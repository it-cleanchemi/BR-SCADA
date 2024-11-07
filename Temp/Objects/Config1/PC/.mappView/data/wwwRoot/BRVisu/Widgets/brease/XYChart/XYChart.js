define(['brease/core/BaseWidget',
    'brease/core/Utils',
    'brease/enum/Enum',
    'brease/core/Types',
    'brease/events/BreaseEvent',
    'brease/events/EventDispatcher',
    'brease/decorators/DragAndDropCapability',
    'brease/decorators/MeasurementSystemDependency',
    'brease/decorators/LanguageDependency',
    'brease/decorators/ContentActivatedDependency',
    'widgets/brease/common/libs/BreaseResizeObserver',
    'widgets/brease/XYChart/libs/StructProperties/StructProperties',
    'widgets/brease/XYChart/libs/config/Config',
    'widgets/brease/XYChart/libs/XYChartEvents',
    'widgets/brease/XYChart/libs/Renderer',
    'widgets/brease/common/DragDropProperties/libs/DroppablePropertiesEvents'
], function (
    SuperClass,
    Utils,
    Enum,
    Types,
    BreaseEvent,
    EventDispatcher,
    dragAndDropCapability,
    MeasurementSystemDependency,
    LanguageDependency,
    ContentActivatedDependency,
    BreaseResizeObserver,
    StructuredProperties,
    defaultSettings,
    ChartEvents,
    Renderer) {

    'use strict';

    /**
    * @class widgets.brease.XYChart
    * #Description
    * Widget to display data as a collection of points, each having the value of one variable determining the position
    * on the horizontal axis and the value of the other variable determining the position on the vertical axis.
    *
    * @breaseNote 
    * @extends brease.core.BaseWidget
    * @mixins widgets.brease.common.DragDropProperties.libs.DroppablePropertiesEvents
    * 
    * @iatMeta studio:license
    * licensed
    * @iatMeta category:Category
    * Chart
    * @iatMeta description:de
    * Widget zur Anzeige von Daten als eine Gruppe von Punkten, von denen jeder den Wert einer 
    * Variablen hat, die die Position auf der horizontalen Achse bestimmt, und den Wert der anderen Variablen, die 
    * die Position auf der vertikalen Achse bestimmt.
    * @iatMeta description:en
    * Widget to display data as a collection of points, each having the value of one variable determining the position 
    * on the horizontal axis and the value of the other variable determining the position on the vertical axis.
    */

    var WidgetClass = SuperClass.extend(function XYChart() {
            this.internal = {
                animationFrame: null,
                demoSignalFunctions: []
            };
            SuperClass.apply(this, arguments);
        }, defaultSettings),
        chartStyleCollection = {
            backColor: {
                cssProp: 'background-color',
                parseValue: function (value) {
                    return value;
                }
            },
            chartColor: {
                cssProp: 'color',
                parseValue: function (value) {
                    return value;
                }
            }
        },
        styleElemChart = document.createElement('DIV'),
        p = WidgetClass.prototype;

    styleElemChart.classList.add('chart');

    p.init = function init() {
        //var widget = this;
        if (this.settings.omitClass !== true) {
            this.addInitialClass('breaseXYChart');
        }
        this.graph = {};
        this.xAxis = {};
        this.yAxis = {};
        this.cursor = {};
        this.eventDispatcher = new EventDispatcher();
        this.styleElem = styleElemChart.cloneNode();
        this.styleWrapperElem = this.elem.querySelector('.styleElemWrapper');
        this.styleWrapperElem.appendChild(this.styleElem);
        this.chartWrapperElem = this.elem.querySelector('.chartWrapper');
        this.chartWrapperElem.id = this.elem.id + 'chartWrapper';
        this.renderer = new Renderer();
        // in edit mode we have to call throttled redraw as WIDGET_STYLE_PROPERTIES_CHANGED has to be handled first in XYChart to read the style props.  
        const resizeHandler = brease.config.editMode ? this.renderer._bind('redraw') : this._bind('_dispatchResize');
        this.observer = new BreaseResizeObserver(this.elem, resizeHandler);
        this.renderer.init(this.eventDispatcher, this.chartWrapperElem);
        this.renderer.setUpdateChartTime(this.settings.updateChartTime);
        document.body.addEventListener(BreaseEvent.THEME_CHANGED, this._bind('_themeChangedHandler'));
        SuperClass.prototype.init.call(this);
        this.initEvents();
        this._initStructuredProperties();
        this._updateEnable();
    };

    p.contentActivatedHandler = function () {
        if (this.observer.initialized) {
            this.observer.wake();
        } else {
            this.observer.init();
        }
    };

    p._initEditor = function () {
        this.elem.addEventListener(BreaseEvent.WIDGET_STYLE_PROPERTIES_CHANGED, this._bind('_dispatchUpdateStyles'));
        this.observer.init();
    };

    p.wake = function () {
        this.renderer.wake();
        _eachStructProp.call(this, 'wake');
        this.initEvents(); // attach events
        SuperClass.prototype.wake.apply(this, arguments);
        this._dispatchUpdateStyles();
    };

    p.initEvents = function (remove) {
        var fn = remove ? 'removeEventListener' : 'addEventListener';
        this.eventDispatcher[fn](ChartEvents.UPDATE_STYLES, this._bind('updateStyleProperties'));
        this.eventDispatcher[fn](ChartEvents.THEME_CHANGED, this._bind('updateStyleProperties'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.UNIT_CHANGED, this._bind('_graphUnitChangedHandler'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.CURSOR_VALUE_CHANGED, this._bind('_graphCursorValueChangedHandler'));
    };

    p._initStructuredProperties = function () {
        for (var graphId in this.settings.graph) {
            this._addGraph(graphId, this.settings.graph[graphId]);
        }
        for (var xAxisId in this.settings.xAxis) {
            this._addXAxis(xAxisId, this.settings.xAxis[xAxisId]);
        }
        for (var yAxisId in this.settings.yAxis) {
            this._addYAxis(yAxisId, this.settings.yAxis[yAxisId]);
        }
        for (var cursorId in this.settings.cursor) {
            this._addCursor(cursorId, this.settings.cursor[cursorId]);
        }
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.UPDATE_STYLES
        });
    };

    p._graphCursorValueChangedHandler = function (e) {
        this.sendValueChange(e.detail.data);
    };

    p._graphUnitChangedHandler = function (e) {
        this.sendNodeChange(e.detail.data);
    };

    p._themeChangedHandler = function () {
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.THEME_CHANGED
        });
    };

    /**
    * @method langChangeHandler
    */
    p.langChangeHandler = function () {
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.LANGUAGE_CHANGED
        });
    };

    /**
    * @method measurementSystemChangeHandler
    * Sets unit for every y axis
    */
    p.measurementSystemChangeHandler = function () {
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.MEASUREMENTSYSTEM_CHANGED
        });
    };
    /**
    * @method setZoomType
    * @iatStudioExposed
    * Defines on which Axis zomming is enabled
    * @param {brease.enum.ChartZoomType} zoomType
    */
    p.setZoomType = function (value) {
        this.settings.zoomType = Types.parseValue(value, 'Enum', { Enum: Enum.ChartZoomType, default: Enum.ChartZoomType.xy });
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.ZOOMTYPE_CHANGED, detail: { data: { zoomType: this.getZoomType() }, type: 'chart' } });
    };
    /**
    * @method getZoomType
    * @return {brease.enum.ChartZoomType}
    */
    p.getZoomType = function () {
        return this.settings.zoomType;
    };

    // ------------ Structured Properties Set/Get/Add/Delete/Rename ------------

    /**
    * @method setGraph
    * Set property value of single graph
    */
    p.setGraph = function (path, attribute, value) {
        if (!this.graph[path]) {
            _reportPropertyNotExist(path);
            return;
        }
        this.graph[path][Utils.setter(attribute)](value);
    };

    /**
    * @method getGraph
    * Get property value of single graph
    */
    p.getGraph = function (path, attribute) {
        if (!this.graph[path]) {
            _reportPropertyNotExist(path);
            return null;
        }
        return this.graph[path][Utils.getter(attribute)]();
    };

    /**
    * @method addGraph
    * Add a new graph and recreate demo chart
    */
    p.addGraph = function (id, options) {
        this._addGraph(id, options);
        //this._createChartEditor();
    };

    p._addGraph = function (id, options) {
        if (!this.settings.graph[id]) {
            this.settings.graph[id] = options;
        }
        //this.settings.stylePrefix
        this.graph[id] = new StructuredProperties.Graph(id, Utils.extendOptionsToNew(options, { stylePrefix: this.settings.stylePrefix }), this.elem.id, 'graph');
        this.graph[id].init(this.eventDispatcher, this.styleWrapperElem);
        if (brease.config.editMode) {
            this.graph[id].generateDemoData(this.internal.demoSignalFunctions);
        }
    };

    /**
    * @method deleteGraph
    * Delete graph and redraw chart
    */
    p.deleteGraph = function (id) {
        this._deleteStructProp('graph', id);
    };

    p.renameGraph = function (id, newId) {
        this._renameStructProp('graph', id, newId);
    };

    p.orderGraph = function (graphs) {
        this._orderStructProp('Graph', graphs);
    };

    p._renameStructProp = function (prop, id, newId) {
        this[prop][id].setId(newId);
        this[prop][newId] = this[prop][id];
        delete this[prop][id];
        this.settings[prop][newId] = this.settings[prop][id];
        delete this.settings[prop][id];
    };

    p._deleteStructProp = function (prop, id) {
        this[prop][id].dispose();
        delete this[prop][id];
        delete this.settings[prop][id];
        this.renderer.redraw();
    };

    /**
    * @method _orderStructProp
    * dispatches order event with detail.data.order = ['axis1', 'axis3','axis2']
    * @param {String} prop property name i.e 'XAxis'
    * @param {String[]} structProps array of fully quallified property ids i.e ['widgetId_XAxis_axis1', 'widgetId_XAxis_axis3', 'widgetId_XAxis_axis2']
    */
    p._orderStructProp = function (prop, structProps) {
        var order = structProps.map(function (id) {
            return id.split('_').pop();
        });
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.ORDER_CHANGED, detail: { data: { order: order }, type: prop } });
    };

    /**
        * @method setYAxis
        * Set property value of single yAxis
        */
    p.setYAxis = function (path, attribute, value) {
        if (!this.yAxis[path]) {
            _reportPropertyNotExist(path);
            return;
        }
        this.yAxis[path][Utils.setter(attribute)](value);
    };

    /**
        * @method getYAxis
        * Get property value of single yAxis
        */
    p.getYAxis = function (path, attribute) {
        if (!this.yAxis[path]) {
            _reportPropertyNotExist(path);
            return null;
        }
        return this.yAxis[path][Utils.getter(attribute)]();
    };

    /**
        * @method addYAxis
        * Add a new yAxis and redraw chart
        */
    p.addYAxis = function (id, options) {
        this._addYAxis(id, options);
        //this.renderer.redraw();
    };

    p._addYAxis = function (id, options) {
        if (!this.settings.yAxis[id]) {
            this.settings.yAxis[id] = options;
        }
        this.yAxis[id] = new StructuredProperties.YAxis(id, Utils.extendOptionsToNew(options, { stylePrefix: this.settings.stylePrefix }), this.elem.id, 'yAxis');
        this.yAxis[id].init(this.eventDispatcher, this.styleWrapperElem);
    };

    /**
    * @method deleteYAxis
    * Delete yAxis and redraw chart
    */
    p.deleteYAxis = function (id) {
        this._deleteStructProp('yAxis', id);
    };

    p.renameYAxis = function (id, newId) {
        this._renameStructProp('yAxis', id, newId);
    };

    p.orderYAxis = function (axes) {
        this._orderStructProp('YAxis', axes);
    };

    p.setXAxis = function (path, attribute, value) {
        if (!this.xAxis[path]) {
            _reportPropertyNotExist(path);
            return;
        }
        this.xAxis[path][Utils.setter(attribute)](value);
    };

    p.getXAxis = function (path, attribute) {
        if (!this.xAxis[path]) {
            _reportPropertyNotExist(path);
            return null;
        }
        return this.xAxis[path][Utils.getter(attribute)]();
    };

    /**
    * @method addXAxis
    * Add a new yAxis and redraw chart
    */
    p.addXAxis = function (id, options) {
        this._addXAxis(id, options);
        //this.renderer.redraw();
    };

    p._addXAxis = function (id, options) {
        if (!this.settings.xAxis[id]) {
            this.settings.xAxis[id] = options;
        }
        this.xAxis[id] = new StructuredProperties.XAxis(id, Utils.extendOptionsToNew(options, { stylePrefix: this.settings.stylePrefix }), this.elem.id, 'xAxis');
        this.xAxis[id].init(this.eventDispatcher, this.styleWrapperElem);
    };
    /**
    * @method deleteXAxis
    * Delete yAxis and redraw chart
    */
    p.deleteXAxis = function (id) {
        this._deleteStructProp('xAxis', id);
    };

    p.renameXAxis = function (id, newId) {
        this.xAxis.setId(newId);
        this.settings.xAxis[newId] = this.settings.xAxis[id];
        delete this.settings.xAxis[id];
    };

    p.orderXAxis = function (axes) {
        this._orderStructProp('XAxis', axes);
    };

    /**
    * @method setCursor
    * Set property value of single cursor
    */
    p.setCursor = function (path, attribute, value) {
        if (!this.cursor[path]) {
            _reportPropertyNotExist(path);
            return;
        }
        this.cursor[path][Utils.setter(attribute)](value);
    };

    /**
        * @method getCursor
        * Get property value of single cursor
        */
    p.getCursor = function (path, attribute) {
        if (!this.cursor[path]) {
            _reportPropertyNotExist(path);
            return null;
        }
        return this.cursor[path][Utils.getter(attribute)]();
    };

    /**
        * @method addCursor
        * Add a new cursor and redraw chart
        */
    p.addCursor = function (id, options) {
        this._addCursor(id, options);
    };

    p._addCursor = function (id, options) {
        if (!this.settings.cursor[id]) {
            this.settings.cursor[id] = options;
        }
        this.cursor[id] = new StructuredProperties.Cursor(id, Utils.extendOptionsToNew(options, { stylePrefix: this.settings.stylePrefix }), this.elem.id, 'cursor');
        this.cursor[id].init(this.eventDispatcher, this.styleWrapperElem);
    };

    /**
    * @method deleteCursor
    * Delete cursor and redraw chart
    */
    p.deleteCursor = function (id) {
        this._deleteStructProp('cursor', id);
    };

    p.renameCursor = function (id, newId) {
        this._renameStructProp('cursor', id, newId);
    };

    p.orderCursor = function (axes) {
        this._orderStructProp('Cursor', axes);
    };

    // ------------ Setters ------------

    /**
        * @method setUpdateChartTime
        * @param {UInteger} updateChartTime
        */
    p.setUpdateChartTime = function setUpdateChartTime(updateChartTime) {
        this.settings.updateChartTime = Types.parseValue(updateChartTime, 'Integer', { min: 0 });
        if (this.renderer) {
            this.renderer.setUpdateChartTime(this.settings.updateChartTime);
        }
        this._dispatchUpdateReporting();

    };

    /**
    * @method getUpdateChartTime
    * @returns {UInteger} updateChartTime
    */
    p.getUpdateChartTime = function getUpdateChartTime() {
        return this.settings.updateChartTime;
    };

    // called by the BaseWidget when the enable state changes due to 
    // changed permissions or the enable property
    p._enableHandler = function () {
        SuperClass.prototype._enableHandler.apply(this, arguments);
        this._updateEnable();
    };

    p._updateEnable = function () {
        var enabled = !this.isDisabled;
        for (var graphId in this.graph) {
            this.graph[graphId].setEnable(enabled);
        }
        for (var xAxisId in this.xAxis) {
            this.xAxis[xAxisId].setEnable(enabled);
        }
        for (var yAxisId in this.yAxis) {
            this.yAxis[yAxisId].setEnable(enabled);
        }
        this.renderer.setEnable(enabled);
        this.updateStyleProperties();
    };

    p._visibleHandler = function () {
        SuperClass.prototype._visibleHandler.apply(this, arguments);
        this.updateStyleProperties();
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.VISIBLE_CHANGED, detail: { data: { visible: this.isVisible() }, type: 'chart' } });
    };

    /**
    * @method _setWidth
    * @param {Number} w  
    */
    p._setWidth = function _setWidth(w) {
        SuperClass.prototype._setWidth.call(this, w);
        if (brease.config.editMode) {
            this.renderer.redraw();
        }
    };

    /**
    * @method _setHeight
    * @param {Number} w  
    */
    p._setHeight = function _setHeight(h) {
        SuperClass.prototype._setHeight.call(this, h);
        if (brease.config.editMode) {
            this.renderer.redraw();
        }

    };

    /**
    * @method setStyle
    * Sets new style to the widget.
    * @iatStudioExposed
    * @param {StyleReference} value
    */
    p.setStyle = function () {
        SuperClass.prototype.setStyle.apply(this, arguments);
        this.updateStyleProperties();
    };
    // ------------ Getters ------------

    // ------------ Methods ------------

    //-------Structured Property Actions------//

    /**
    * @method setGraphVisible
    * @iatStudioExposed
    * Sets visibility of graph
    * @param {PropertyCollectionReference} graphId
    * @param {Boolean} value
    * @paramMeta graphId:typeRefId=graph
    */
    p.setGraphVisible = function (graphId, value) {
        var graph = _.find(this.graph, ['name', graphId]);
        if (graph) {
            this._changeStructProp(graph, 'visible', value);
        } else {
            return null;
        }
    };

    /**
    * @method _changeStructProp
    * Change struct prop attribute and dispatch changes. 
    */
    p._changeStructProp = function (structProp, attribute, value) {
        var promise = structProp[Utils.setter(attribute)](value);
        var data = {};
        data[structProp.attributeToString(attribute)] = structProp[Utils.getter(attribute)]();
        this.sendValueChange(data);
        return promise;
    };

    /**
    * @method setGraphStyle
    * @iatStudioExposed
    * Sets style of graph
    * @param {PropertyCollectionReference} graphId
    * @param {StyleReference} value
    * @paramMeta graphId:typeRefId=graph
    * @paramMeta value:typeRefId=widgets.brease.XYChart.Graph
    */
    p.setGraphStyle = function (graphId, value) {
        var graph = _.find(this.graph, ['name', graphId]);
        if (graph) {
            this._changeStructProp(graph, 'style', value);
        } else {
            return null;
        }
    };

    /**
    * @method setYAxisVisible
    * @iatStudioExposed
    * Sets visibility of yAxis
    * @param {PropertyCollectionReference} yAxisId
    * @param {Boolean} value
    * @paramMeta yAxisId:typeRefId=yAxis
    */
    p.setYAxisVisible = function (yAxisId, value) {
        var yAxis = _.find(this.yAxis, ['name', yAxisId]);
        if (yAxis) {
            this._changeStructProp(yAxis, 'visible', value);
        } else {
            return null;
        }
    };

    /**
    * @method setYAxisPosition
    * @iatStudioExposed
    * Defines weather the axis is positioned at the right or left in the chart.
    * @param {PropertyCollectionReference} yAxisId
    * @param {brease.enum.HorizontalAlign} position
    * @paramMeta yAxisId:typeRefId=yAxis
    */
    p.setYAxisPosition = function (yAxisId, position) {
        var pos = Types.parseValue(position, 'Enum', { Enum: Enum.HorizontalAlign, default: null });
        if (pos === null) {
            return null;
        }
        var yAxis = _.find(this.yAxis, ['name', yAxisId]);
        if (yAxis) {
            this._changeStructProp(yAxis, 'position', pos);
        } else {
            return null;
        }
    };

    /**
    * @method setYAxisStyle
    * @iatStudioExposed
    * Sets style of yAxis
    * @param {PropertyCollectionReference} yAxisId
    * @param {StyleReference} value
    * @paramMeta yAxisId:typeRefId=yAxis
    * @paramMeta value:typeRefId=widgets.brease.XYChart.YAxis
    */
    p.setYAxisStyle = function (yAxisId, value) {
        var yAxis = _.find(this.yAxis, ['name', yAxisId]);
        if (yAxis) {
            this._changeStructProp(yAxis, 'style', value);
        } else {
            return null;
        }
    };

    /**
    * @method setXAxisVisible
    * @iatStudioExposed
    * Sets visibility of xAxis
    * @param {PropertyCollectionReference} xAxisId
    * @param {Boolean} value
    * @paramMeta xAxisId:typeRefId=xAxis
    */
    p.setXAxisVisible = function (xAxisId, value) {
        var xAxis = _.find(this.xAxis, ['name', xAxisId]);
        if (xAxis) {
            this._changeStructProp(xAxis, 'visible', value);
        } else {
            return null;
        }
    };

    /**
    * @method setXAxisPosition
    * @iatStudioExposed
    * Defines weather the axis is positioned at the top or bottom in the chart.
    * @param {PropertyCollectionReference} xAxisId
    * @param {brease.enum.VerticalAlign} position
    * @paramMeta xAxisId:typeRefId=xAxis
    */
    p.setXAxisPosition = function (xAxisId, position) {
        var pos = Types.parseValue(position, 'Enum', { Enum: Enum.VerticalAlign, default: null });
        if (pos === null) {
            return null;
        }
        var xAxis = _.find(this.xAxis, ['name', xAxisId]);
        if (xAxis) {
            this._changeStructProp(xAxis, 'position', pos);
        } else {
            return null;
        }
    };

    /**
    * @method setXAxisStyle
    * @iatStudioExposed
    * Sets style of xAxis
    * @param {PropertyCollectionReference} xAxisId
    * @param {StyleReference} value
    * @paramMeta xAxisId:typeRefId=xAxis
    * @paramMeta value:typeRefId=widgets.brease.XYChart.XAxis
    */
    p.setXAxisStyle = function (xAxisId, value) {
        var xAxis = _.find(this.xAxis, ['name', xAxisId]);
        if (xAxis) {
            this._changeStructProp(xAxis, 'style', value);
        } else {
            return null;
        }
    };

    /**
    * @method setCursorVisible
    * @iatStudioExposed
    * Sets visibility of cursor
    * @param {PropertyCollectionReference} cursorId
    * @param {Boolean} value
    * @paramMeta cursorId:typeRefId=cursor
    */
    p.setCursorVisible = function (cursorId, value) {
        var cursor = _.find(this.cursor, ['name', cursorId]);
        if (cursor) {
            this._changeStructProp(cursor, 'visible', value);
        } else {
            return null;
        }
    };

    /**
    * @method setCursorStyle
    * @iatStudioExposed
    * Sets style of cursor
    * @param {PropertyCollectionReference} cursorId
    * @param {StyleReference} value
    * @paramMeta cursorId:typeRefId=cursor
    * @paramMeta value:typeRefId=widgets.brease.XYChart.Cursor
    */
    p.setCursorStyle = function (cursorId, value) {
        var cursor = _.find(this.cursor, ['name', cursorId]);
        if (cursor) {
            this._changeStructProp(cursor, 'style', value);
        } else {
            return null;
        }
    };

    /**
    * @method setSelectedCursor
    * @iatStudioExposed
    * Sets a specific cursor active
    * @param {PropertyCollectionReference} cursorId
    * @paramMeta cursorId:typeRefId=cursor
    */
    p.setSelectedCursor = function (cursorId) {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.CURSOR_SELECTION_CHANGED, detail: { type: 'Cursor', data: { }, name: cursorId } });
    };

    /**
    * @method toggleCursorTable
    * @iatStudioExposed
    * Toggle cursorTable visiblity to show/hide cursor values in freeze mode.
    */
    p.toggleCursorTable = function () {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.TOGGLE_SIDEBAR, detail: { type: 'chart' } });
    };

    p.updateStyleProperties = function () {
        var that = this;
        if (!this.internal.animationFrame) {
            this.internal.animationFrame = window.requestAnimationFrame(function () {
                var computedStyles = window.getComputedStyle(that.styleElem),
                    styleCollection,
                    styles = {},
                    key;
                for (key in chartStyleCollection) {
                    styleCollection = chartStyleCollection[key];
                    styles[key] = styleCollection.parseValue(computedStyles.getPropertyValue(styleCollection.cssProp));
                }
                that.eventDispatcher.dispatchEvent({ type: ChartEvents.STYLE_CHANGED, detail: { data: styles, type: 'chart' } });
                that.internal.animationFrame = null;
            });
        }
    };
    /**
    * @method freeze
    * @iatStudioExposed
    * Ends the graph data update and makes it possible to use the zoom and scroll functions.
    */
    p.freeze = function () {
        if (this.isFrozen() === false) {
            this.settings.freezeMode = true;
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.FREEZEMODE_CHANGED, detail: { data: { freezeMode: this.isFrozen() }, type: 'chart' } });
        }
    };
    /**
    * @method unfreeze
    * @iatStudioExposed
    * Restarts the update of the graph data and prevents the zoom and scroll functions.
    */
    p.unfreeze = function () {
        if (this.isFrozen() === true) {
            this.settings.freezeMode = false;
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.FREEZEMODE_CHANGED, detail: { data: { freezeMode: this.isFrozen() }, type: 'chart' } });
        }
    };
    /**
    * @method getStatus
    * @iatStudioExposed
    * This action is used to determine whether the graph is in freeze mode.
    * If true is returned, freeze mode is not active.
    * @return {Boolean}
    */
    p.getStatus = function () {
        return !this.isFrozen();
    };

    /**
    * @method isFrozen
    * Returns whether the chart has been frozen
    * @return {Boolean}
    */
    p.isFrozen = function () {
        return this.settings.freezeMode === true;
    };

    /**
    * @method update
    * @iatStudioExposed
    * used to update the data of a certain graph while in freeze mode or
    * updateChartTime is 0
    * @param {PropertyCollectionReference} graphId
    * @paramMeta graphId:typeRefId=graph
    */
    p.update = function (graphId) {
        var graph = _.find(this.graph, ['name', graphId]);
        if (graph) {
            graph.update();
        } else {
            return null;
        }
    };
    /**
    * @method zoomIn
    * @iatStudioExposed
    * Zooms in the graph by 20%.
    * To do this, the widget must be in freeze mode.
    */
    p.zoomIn = function () {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.ZOOM_IN, detail: { type: 'chart' } });
    };
    /**
    * @method zoomOut
    * @iatStudioExposed
    * Zooms out the graph by 20%.
    * To do this, the widget must be in freeze mode.
    */
    p.zoomOut = function () {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.ZOOM_OUT, detail: { type: 'chart' } });
    };
    
    /**
    * @method zoomReset
    * @iatStudioExposed
    * Resets the zoom to 0 %.
    * To do this, the widget must be in freeze mode.
    */
    p.zoomReset = function () {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.ZOOM_RESET, detail: { type: 'chart' } });
    };

    /**
    * @method scrollUp
    * @iatStudioExposed
    * Scrolls up 25%.
    * To do this, the widget must be in freeze mode.
    */
    p.scrollUp = function () {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.SCROLL_UP, detail: { type: 'chart' } });
    };

    /**
    * @method scrollDown
    * @iatStudioExposed
    * Scrolls down 25%.
    * To do this, the widget must be in freeze mode.
    */
    p.scrollDown = function () {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.SCROLL_DOWN, detail: { type: 'chart' } });
    };

    /**
    * @method scrollLeft
    * @iatStudioExposed
    * Scrolls left 25%.
    * To do this, the widget must be in freeze mode.
    */
    p.scrollLeft = function () {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.SCROLL_LEFT, detail: { type: 'chart' } });
    };

    /**
    * @method scrollRight
    * @iatStudioExposed
    * Scrolls right 25%.
    * To do this, the widget must be in freeze mode.
    */
    p.scrollRight = function () {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.SCROLL_RIGHT, detail: { type: 'chart' } });
    };

    p.onBeforeSuspend = function () {
        this.renderer.suspend();
        _eachStructProp.call(this, 'suspend');
        this.initEvents(true); // detach events
        SuperClass.prototype.onBeforeSuspend.apply(this, arguments);
    };

    p.suspend = function () {
        this.observer.suspend();
        SuperClass.prototype.suspend.apply(this, arguments);
    };

    p.dispose = function () {
        this.elem.removeEventListener(BreaseEvent.WIDGET_STYLE_PROPERTIES_CHANGED, this._bind('_dispatchUpdateStyles'));
        document.body.removeEventListener(BreaseEvent.THEME_CHANGED, this._bind('_themeChangedHandler'));
        cancelAnimationFrame(this.internal.animationFrame);
        this.internal.animationFrame = null;
        this.initEvents(true);
        this.observer.dispose();
        this.observer = undefined;
        this.renderer.dispose();
        _eachStructProp.call(this, 'dispose');
        SuperClass.prototype.dispose.apply(this, arguments);
    };

    p._initialValueHandling = function () {
        SuperClass.prototype._initialValueHandling.apply(this, arguments);
        this._dispatchUpdateStyles();
    };

    p._dispatchResize = function () {
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.RESIZE
        });
    };

    p._dispatchUpdateStyles = function () {
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.UPDATE_STYLES
        });
    };

    p._dispatchUpdateReporting = function () {
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.UPDATE_REPORTING,
            detail: {
                data: {
                    reporting: this.getUpdateChartTime() > 0
                }
            }
        });
    };

    // call a method on each structured property (suspend, dispose, wake,...)
    function _eachStructProp(method) {
        for (var graphId in this.settings.graph) {
            this.graph[graphId][method]();
        }
        for (var xAxisId in this.settings.xAxis) {
            this.xAxis[xAxisId][method]();
        }
        for (var yAxisId in this.settings.yAxis) {
            this.yAxis[yAxisId][method]();
        }
        for (var cursorId in this.settings.cursor) {
            this.cursor[cursorId][method]();
        }
    }

    function _reportPropertyNotExist(path) {
        var propName = path.split('_').pop();
        console.iatWarn('Binded property "' + propName + '" does not exist');
    }

    return ContentActivatedDependency.decorate(dragAndDropCapability.decorate(MeasurementSystemDependency.decorate(LanguageDependency.decorate(WidgetClass, true), true), false), true);
});
