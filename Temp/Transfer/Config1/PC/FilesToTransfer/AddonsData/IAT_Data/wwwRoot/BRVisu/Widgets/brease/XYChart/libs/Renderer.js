define(['brease/core/Class',
    'brease/enum/Enum',
    'brease/core/utils',
    'brease/core/Types',
    'widgets/brease/XYChart/libs/decorators/InteractionDecorator',
    'widgets/brease/XYChart/libs/decorators/CursorInteractionDecorator',
    'widgets/brease/XYChart/libs/XYChartEvents',
    'widgets/brease/common/libs/external/LineReduction',
    'widgets/brease/XYChart/libs/Toolbar',
    'widgets/brease/XYChart/libs/CursorTable',
    'widgets/brease/common/libs/EjChart'
], function (SuperClass, Enum, Utils, Types, InteractionDecorator, CursorInteractionDecorator, ChartEvents, RDP, Toolbar, CursorTable, EjChart) {

    'use strict';

    /**
    * @class widgets.brease.XYChart.Renderer
    * @extends Function
    */
    /**
    * @method constructor
    * Creates a new Renderer instance.
    * @param {Object} options options of structured property, as set in content
    */

    var chartPropertyMapping = {
            'backColor': 'background',
            'chartColor': 'chartArea.background',
            'zoomType': 'zooming.type'
        },
        graphPropertyMapping = {
            'lineColor': 'fill',
            'lineWidth': 'width',
            'visible': 'visibility',
            'xAxisReference': ['xAxisName', '_xAxisName'],
            'yAxisReference': ['yAxisName', '_yAxisName'],
            'value': 'points'
        },
        axisPropertyMapping = {
            'color': ['axisLine.color', 'majorTickLines.color'],
            'fontSize': 'font.size',
            'fontName': 'font.fontFamily',
            'gridColor': 'majorGridLines.color',
            'textColor': 'font.color',
            'tickLabelRotation': 'labelRotation',
            'titleFontName': 'title.font.fontFamily',
            'titleFontSize': 'title.font.size',
            'titleTextColor': 'title.font.color',
            'title': 'title.text',
            'visible': ['visible', 'majorGridLines.visible'],
            'position': 'opposedPosition',
            'format': 'custom.numberFormat',
            'numberOfTicks': 'range.interval',
            'min': 'range.min',
            'max': 'range.max',
            'titleRotation': 'title.titleRotation',
            'desiredIntervals': 'desiredIntervals',
            'isInversed': 'isInversed'
        },
        zoomTypeMapping = {},
        MIN_ZOOM_FACTOR = 0.002;
    // mapping between brease enum and syncfusion setting
    zoomTypeMapping[Enum.ChartZoomType.xy] = 'x,y';
    zoomTypeMapping[Enum.ChartZoomType.none] = 'x,y';
    zoomTypeMapping[Enum.ChartZoomType.x] = 'x';
    zoomTypeMapping[Enum.ChartZoomType.y] = 'y';

    var Renderer = SuperClass.extend(function Renderer(options) {
            SuperClass.apply(this, arguments);
            this.model = {
                series: [],
                axes: [],
                legend: {
                    visible: false,
                    enableScrollbar: false,
                    toggleSeriesVisibility: false
                },
                primaryYAxis: {
                    majorGridLines: {
                        visible: false
                    },
                    visible: false,
                    zoomFactor: 1,
                    zoomPosition: 0
                },
                primaryXAxis:
                {
                    majorGridLines: {
                        visible: false
                    },
                    visible: false,
                    zoomFactor: 1,
                    zoomPosition: 0
                },
                //Initializing Common Properties for all the series
                commonSeriesOptions: {
                    type: 'line',
                    visibleOnLegend: 'hidden'
                },
                zooming: {},
                chartArea: {
                    border: {
                        color: 'transparent',
                        opacity: 1
                    }
                },
                margin: {
                    right: 40
                },
                enableCanvasRendering: true
            };
            this.data = {};
            this.settings = {
                updateChartTime: 1000,
                freezeMode: false,
                visible: true,
                enable: true,
                zoomType: Enum.ChartZoomType.xy,
                zoomFactorX: 1,
                zoomFactorY: 1
            };
        }, null),

        p = Renderer.prototype;
    p.init = function (eventDispatcher, el) {
        this.model.load = this._bind('_onChartLoad');
        this.model.axesLabelRendering = this._bind('_axisLabelFormatter');
        //this.model.zoomed = this._bind('_onZoomed');
        this.model.preRender = this._bind('_onPreRender');
        this.model.seriesRendering = this._bind('_onPreRender');
        this.model.chartAreaBoundsCalculate = this._bind('updateToolbarPadding');
        this.eventDispatcher = eventDispatcher;
        this.elem = el;
        this.$el = $(el);
        this.toolbar = new Toolbar();
        this.toolbar.init(eventDispatcher, this.zoomElem);
        this.cursorTable = new CursorTable();
        this.cursorTable.init(eventDispatcher, this.zoomElem);
        this.initEvents();
        this.throttledRedraw = _.throttle(this._redraw, this.settings.updateChartTime, { 'leading': false });
        this.debouncedUpdateViewport = _.debounce(this.updateViewport, 1000);
        if (this.elem && this.elem.parentElement !== null) {
            this.elem.parentElement.appendChild(this.zoomElem);
        }

    };
    p._onPreRender = function () {
        if (this.requiresUpdate()) {
            this.debouncedUpdateViewport();
        }
    };
    p.wake = function () {
        this.setUpdateChartTime(this.settings.updateChartTime);
        this.initEvents();
        if (this.isFrozen()) {
            this.initFreezeEvents();
        }
    };

    p.initEvents = function (remove) {
        var fn = remove ? 'removeEventListener' : 'addEventListener';
        this.eventDispatcher[fn](ChartEvents.RESIZE, this._bind('updateSize'));
        this.eventDispatcher[fn](ChartEvents.STYLE_CHANGED, this._bind('updateProperties'));
        this.eventDispatcher[fn](ChartEvents.VISIBLE_CHANGED, this._bind('updateVisibility'));
        this.eventDispatcher[fn](ChartEvents.FREEZEMODE_CHANGED, this._bind('onFreezeModeChanged'));
        this.eventDispatcher[fn](ChartEvents.ZOOMTYPE_CHANGED, this._bind('updateZoomType'));
        this.eventDispatcher[fn](ChartEvents.AXIS.TITLE_CHANGED, this._bind('updateProperties'));
        this.eventDispatcher[fn](ChartEvents.AXIS.VISIBLE_CHANGED, this._bind('updateProperties'));
        this.eventDispatcher[fn](ChartEvents.AXIS.POSITION_CHANGED, this._bind('updateAxisPosition'));
        this.eventDispatcher[fn](ChartEvents.AXIS.FORMAT_CHANGED, this._bind('updateProperties'));
        this.eventDispatcher[fn](ChartEvents.AXIS.RANGE_CHANGED, this._bind('updateAxisRange'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.VALUE_CHANGED, this._bind('_onGraphValueChanged'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.VALUE_CHANGED, this._bind('updateProperties'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.VISIBLE_CHANGED, this._bind('updateGraphVisibility'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.AXIS_REFERENCE_CHANGED, this._bind('updateProperties'));
        this.eventDispatcher[fn](ChartEvents.ORDER_CHANGED, this._bind('updateOrder'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.NAME_CHANGED, this._bind('updateName'));
        this.eventDispatcher[fn](ChartEvents.AXIS.NAME_CHANGED, this._bind('updateName'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.DISPOSED, this._bind('removeModel'));
        this.eventDispatcher[fn](ChartEvents.AXIS.DISPOSED, this._bind('removeModel'));
    };
    /**
    * @method initFreezeEvents
    * @param {Boolean} remove
    * initialize interactions in freeze mode
    */
    p.initFreezeEvents = function (remove) {
        var fn = remove ? 'removeEventListener' : 'addEventListener';
        this.eventDispatcher[fn](ChartEvents.ZOOM_IN, this._bind('onZoomIn'));
        this.eventDispatcher[fn](ChartEvents.ZOOM_OUT, this._bind('onZoomOut'));
        this.eventDispatcher[fn](ChartEvents.ZOOM_RESET, this._bind('onZoomReset'));
        this.eventDispatcher[fn](ChartEvents.SCROLL_UP, this._bind('onScrollUp'));
        this.eventDispatcher[fn](ChartEvents.SCROLL_DOWN, this._bind('onScrollDown'));
        this.eventDispatcher[fn](ChartEvents.SCROLL_LEFT, this._bind('onScrollLeft'));
        this.eventDispatcher[fn](ChartEvents.SCROLL_RIGHT, this._bind('onScrollRight'));
        this.eventDispatcher[fn](ChartEvents.RENDERER.ZOOMFACTOR_CHANGED, this._bind('onZoomFactorChanged'));
        this.eventDispatcher[fn](ChartEvents.RENDERER.ZOOMFACTOR_CHANGED, this._bind('updateToolbar'));
        this.eventDispatcher[fn](ChartEvents.TOGGLE_SIDEBAR, this._bind('updateCursorTable'));
    };
    /**
    * @method setVisible
    * @param {Boolean} visible
    */
    p.setVisible = function (value) {
        this.settings.visible = Types.parseValue(value, 'Boolean', { default: true });
    };
    /**
    * @method getVisible
    * @return {Boolean} visible
    */
    p.getVisible = function () {
        return this.settings.visible;
    };
    /**
    * @method setEnable
    * @param {Boolean} enable
    */
    p.setEnable = function (value) {
        this.settings.enable = Types.parseValue(value, 'Boolean', { default: true });
        this.updateChartInteraction();
    };
    /**
    * @method getEnable
    * @return {Boolean} enable
    */
    p.getEnable = function () {
        return this.settings.enable;
    };
    /**
    * @method isEnabled
    * @return {Boolean} enabled
    */
    p.isEnabled = function () {
        return this.getEnable() === true;
    };
    /**
    * @method updateProperties
    * used to update the model
    */
    p.updateProperties = function (e) {
        this._updateModel(e.detail.type, e.detail.name, e.detail.data);
    };
    /**
    * @method updateAxisPosition
    * used to update the position of the axis. (top, bottom, left, right)
    */
    p.updateAxisPosition = function (e) {
        var props = {
            position: (e.detail.data.position === Enum.HorizontalAlign.right || e.detail.data.position === Enum.VerticalAlign.top),
            titleRotation: e.detail.data.position === Enum.HorizontalAlign.right ? 'rotateminus90' : 'none'
        };
        this._updateModel(e.detail.type, e.detail.name, props);
    };
    /**
    * @method updateVisibility
    * called when the visibility of the widget changes
    */
    p.updateVisibility = function (e) {
        this.setVisible(e.detail.data.visible);
        this.updateSize();
    };

    /**
    * @method updateSize
    * called when the widget is resized
    */
    p.updateSize = function () {
        if (this.getVisible()) {
            this.debouncedUpdateViewport();
            this.debouncedUpdateViewport.flush();
        }
    };

    /**
    * @method updateGraphVisibility
    * used to update the visibility of the graph. (syncfusion defines the visible property of a series as string)
    */
    p.updateGraphVisibility = function (e) {
        var props = { visible: e.detail.data.visible === true ? 'visible' : 'hidden' };
        this._updateModel(e.detail.type, e.detail.name, props);
    };

    /**
    * @method updateAxisRange
    * used to update the range of an axis depending on the rangeMode. (min, max, numberOfTicks)
    */
    p.updateAxisRange = function (e) {
        var data = e.detail.data,
            range,
            props;
        if (!this.isAxisReferenced(e.detail.name)) {
            // autoscale + no referenced axis => syncfusion always sets some default range => use fromConfiguration (A&P 703705)
            range = this.getAxisRange(Enum.RangeMode.fromConfiguration, data.numberOfTicks, data.min, data.max);
        } else if (brease.config.editMode) {
            range = this.getAxisRange(Enum.RangeMode.autoscale, data.numberOfTicks, data.min, data.max);
        } else if (data.rangeMode === Enum.RangeMode.fromSource) {
            var ranges = e.detail.data.ranges.filter(function removeHidden(data) {
                    var series = _.find(this.model.series, ['name', data.name]);
                    return this.isSeriesVisible(series);
                }, this).map(function extractMinMax(entry) { return { min: entry.min, max: entry.max }; }),
                minRange = _.minBy(ranges, 'min'),
                maxRange = _.maxBy(ranges, 'max');
            range = this.getAxisRange(data.rangeMode, data.numberOfTicks, minRange ? minRange.min : 0, maxRange ? maxRange.max : -1);
        } else {
            range = this.getAxisRange(data.rangeMode, data.numberOfTicks, data.min, data.max);
        }
        props = { numberOfTicks: range.interval, min: range.min, max: range.max, desiredIntervals: data.numberOfTicks, isInversed: false };
        if (range.min > range.max) {
            props.min = range.max;
            props.max = range.min;
            props.isInversed = true;
        }
        this._updateModel(e.detail.type, e.detail.name, props);
    };

    p.isAxisReferenced = function (axisName) {
        for (var i = 0; i < this.model.series.length; ++i) {
            var series = this.model.series[i];
            if (series.xAxisName === axisName || series.yAxisName === axisName) {
                return true;
            }
        }
        return false;
    };

    /**
    * @method updateZoomType
    * used to convert the brease enum zoom type to syncfusion zoomType setting
    */
    p.updateZoomType = function (e) {
        var data = e.detail.data,
            zoomType = Types.parseValue(data.zoomType, 'Enum', { Enum: Enum.ChartZoomType, default: Enum.ChartZoomType.xy }),
            props;
        this.setZoomType(zoomType);
        props = { zoomType: zoomTypeMapping[zoomType] };
        this._updateModel(e.detail.type, e.detail.name, props);
    };

    /**
    * @method
    * @param {String} type type of the property collection (e.g.: chart, Graph, ...)
    * @param {String} name the name of the property collection (e.g.: yAxis1)
    * @param {Object} props properties to update (e.g.: { visible: true } )
    */
    p._updateModel = function (type, name, props) {
        var propName;
        switch (type) {
            case 'chart':
                for (propName in props) {
                    this._updateModelProp(this.model, chartPropertyMapping[propName], props[propName]);
                }
                break;
            case 'Graph':
                for (propName in props) {
                    var series = _.find(this.model.series, ['name', name]);
                    if (!series) {
                        series = this._createSeries(name);
                        this.model.series.push(series);
                    }
                    this._updateModelProp(series, graphPropertyMapping[propName], props[propName]);
                }
                break;
            case 'XAxis':
            case 'YAxis':
                for (propName in props) {
                    var axis = _.find(this.model.axes, ['name', name]);
                    if (!axis) {
                        axis = this._createAxis(name, type);
                        this.model.axes.push(axis);
                    }
                    this._updateModelProp(axis, axisPropertyMapping[propName], props[propName]);
                }
                break;
        }
        this.redraw();
    };
    p._updateModelProp = function (model, mapping, value) {
        if (!Array.isArray(mapping)) {
            mapping = [mapping];
        }
        mapping.forEach(function (path) {
            _.set(model, path, value);
        });
    };
    p._createSeries = function (name) {
        return {
            name: name
        };
    };
    p._createAxis = function (name, type) {
        return {
            name: name,
            majorGridLines: {
                visible: false
            },
            orientation: _typeToOrientation(type)
        };
    };
    p.updateOrder = function (e) {
        switch (e.detail.type) {
            case 'Graph':
                this.updateGraphOrder(e.detail.data.order);
                break;
            case 'XAxis':
            case 'YAxis':
                this.updateAxesOrder(e.detail.type, e.detail.data.order);
                break;
        }
        this.redraw();
    };
    p.updateGraphOrder = function (orderedGraphs) {
        var length = this.model.axes.length - 1;
        for (var i = 0; i < length; ++i) {
            var currentSeries = this.model.series[i];
            if (currentSeries.name !== orderedGraphs[i]) {
                // swap
                var nextSeries = this.model.series[i + 1];
                this.model.series[i + 1] = currentSeries;
                this.model.series[i] = nextSeries;
                break;
            }
        }
    };
    p.updateAxesOrder = function (type, orderedAxes) {
        var orientation = _typeToOrientation(type).toLowerCase(),
            length = this.model.axes.length - 1;
        // all axes are in same array so i iterates over all axes and n iterates over x or y axes
        for (var i = 0, n = 0; i < length; ++i) {
            var currentAxis = this.model.axes[i];
            if (currentAxis.orientation.toLowerCase() === orientation) {
                if (currentAxis.name !== orderedAxes[n]) {
                    // the next equal orientated axis is the swap axis
                    var nextI;
                    for (nextI = i + 1; this.model.axes[nextI].orientation.toLowerCase() !== orientation; ++nextI);
                    // swap
                    var nextAxis = this.model.axes[nextI];
                    this.model.axes[nextI] = currentAxis;
                    this.model.axes[i] = nextAxis;
                    break;
                }
                ++n;
            }
        }
    };
    p.updateName = function (e) {
        var model = _getModelFromType.call(this, e.detail.type);
        _.find(model, ['name', e.detail.name]).name = e.detail.data.name;
    };
    p.removeModel = function (e) {
        var model = _getModelFromType.call(this, e.detail.type),
            index = _.findIndex(model, ['name', e.detail.name]);
        model.splice(index, 1);
        this.redraw();
    };
    p.setUpdateChartTime = function (time) {
        if (brease.config.editMode) {
            return;
        }
        this.settings.updateChartTime = Types.parseValue(time, 'Integer', { min: 0, default: 1000 });
        this.throttledRedraw.flush();
        this.throttledRedraw = _.throttle(this._redraw, this.isFrozen() ? 100 : time, { 'leading': false });
    };
    p.getUpdateChartTime = function () {
        return this.settings.updateChartTime;
    };
    p.redraw = function (excludeDataUpdate) {
        this.throttledRedraw(excludeDataUpdate);
    };
    p._redraw = function (excludeDataUpdate) {
        if (!this.getVisible()) {
            return;
        }
        if (!this.model.dateStart) {
            EjChart.init(this.$el, this.model);
        } else {
            this.$el.ejChart('redraw', excludeDataUpdate === true);
        }
        if (this.isFrozen()) {
            this._generateDataLocation();
        }
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.RENDERER.REDRAW, detail: { data: {}, type: this.constructor.name } });
    };

    /** 
    * @method
     * Add location coordinates to every point in original data.
     */
    p._generateDataLocation = function () {
        this.model.series.forEach(function (series) {
            if (!this.isSeriesVisible(series)) {
                return;
            }
            for (var i = 0; i < this.data[series.name].length; ++i) {
                this.data[series.name][i].location = _getPointLocation.call(this, this.data[series.name][i], series.xAxis, series.yAxis);
            }
        }, this);
    };

    /**
    * @method _mockedRedraw
    * used to prevent the renderer from drawing while suspended
    */
    p._mockedRedraw = function () {

    };
    p._onChartLoad = function (sender) {
        this.model = sender.model;
    };
    p._axisLabelFormatter = function (args) {
        if (args.data.axis.custom) {
            args.data.label.Text =
                brease.formatter.formatNumber(args.data.label.Text,
                    args.data.axis.custom.numberFormat,
                    undefined,
                    brease.user.getSeparators());
        }
    };
    /**
    * @method
    * Used to store data before reduction
    */
    p._onGraphValueChanged = function (e) {
        var detail = e.detail;
        this._setDataByName(Utils.deepCopy(detail.data).value, detail.name);
        // data reduction requires chart to be drawn
        if (this.isDrawn()) {
            detail.data.value = this._reduceData(detail.name);
        } else {
            detail.data.value = [];
            /// 
            this.debouncedUpdateViewport();
        }
    };

    /**
     * @method isDrawn
     * @returns {Boolean} returns true if chart is rendered
     */
    p.isDrawn = function () {
        return this.model.m_AreaBounds !== undefined;
    };

    /**
    * @method
     * This method will store data of a given graph
     * @param {Integer[]} data data that should be stored in the renderer
     * @param {String} name the name of hte graph under which the data belongs to
     */
    p._setDataByName = function (data, name) {
        this.data[name] = data;
    };

    /**
    * @method
     * this method will retrieve the data of a given graph
     * @param {String} name the name of the graph of which data should be retrieved
     * @returns {Integer[]} the data
     */
    p._getDataByName = function (name) {
        if (this.data[name] === undefined) return [];
        return this.data[name];
    };

    /**
    * @method
     * this method will reduce the data of a given graph
     * @param {String} name the name of the graph of which data should be retrieved
     * @return {Integer[]} the reduced dataset
     */
    p._reduceData = function (name) {
        var data = this._getDataByName(name),
            zoomFactor = Math.min(this.getZoomFactorX(), this.getZoomFactorY());
        zoomFactor = brease.formatter.roundToFormat(zoomFactor, 3);
        if (data.length === 0 || zoomFactor <= MIN_ZOOM_FACTOR) {
            return data;
        }
        var xDelta = _.maxBy(data, 'x').x - _.minBy(data, 'x').x,
            yDelta = _.maxBy(data, 'y').y - _.minBy(data, 'y').y;

        return RDP.simplify(data, zoomFactor, xDelta / this.model.m_AreaBounds.Width, yDelta / this.model.m_AreaBounds.Height, true);
    };

    /**
    * @method
    * getAxisRange
    * @param {brease.enum.RangeMode} rangeMode
    * @param {UInteger} numberOfTicks
    * @param {Number} min
    * @param {Number} max
    * @return {Object} range
    * @return {Number} return.min
    * @return {Number} return.max
    * @return {Integer} return.interval
    */
    p.getAxisRange = function (rangeMode, numberOfTicks, min, max) {
        rangeMode = Types.parseValue(rangeMode, 'Enum', { Enum: Enum.RangeMode, default: Enum.RangeMode.autoscale });
        numberOfTicks = Types.parseValue(numberOfTicks, 'Integer', { min: 0, default: 5 });
        min = Types.parseValue(min, 'Number', { default: 0 });
        max = Types.parseValue(max, 'Number', { default: 100 });
        var autoscale = rangeMode === Enum.RangeMode.autoscale,
            range = Math.abs(max - min),
            axisRange = {
                min: autoscale ? null : min,
                max: autoscale ? null : max,
                interval: autoscale ? null : numberOfTicks === 0 ? 0 : range / numberOfTicks
            };

        return axisRange;
    };

    /**
    * @method setFreezeMode
    * Returns whether the chart has been frozen
    * @return {Boolean}
    */
    p.setFreezeMode = function (value) {
        this.settings.freezeMode = Types.parseValue(value, 'Boolean');
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
    * @method onFreezeModeChanged
    * called when freeze mode changes
    */
    p.onFreezeModeChanged = function (e) {
        var freezeMode = e.detail.data.freezeMode;
        if (!this.isFrozen() && freezeMode) {
            this.settings.freezeMode = true;
            this.initFreezeEvents();
        } else if (this.isFrozen() && !freezeMode) {
            this.onZoomReset();
            this.settings.freezeMode = false;
            this.initFreezeEvents(true);
        }
        this.throttledRedraw.flush();
        this.throttledRedraw = _.throttle(this._redraw, this.isFrozen() ? 100 : this.settings.updateChartTime, { 'leading': false });
        this.updateChartInteraction();
    };
    /**
    * @method requiresUpdate
    * returns true if the zoom factor has been modified in order
    * to update the series for the current viewport
    * @return {Boolean}
    */
    p.requiresUpdate = function () {
        return this.settings.zoomFactorX !== this.getZoomFactorX() || this.settings.zoomFactorY !== this.getZoomFactorY();
    };

    /**
    * @method setZoomType
    * @param {brease.enum.ChartZoomType} zoomType
    */
    p.setZoomType = function (zoomType) {
        this.settings.zoomType = Types.parseValue(zoomType, 'Enum', { Enum: Enum.ChartZoomType, default: Enum.ChartZoomType.xy });
        this.updateChartInteraction();
    };
    /**
    * @method getZoomType
    * @return {brease.enum.ChartZoomType}
    */
    p.getZoomType = function () {
        return this.settings.zoomType;
    };

    /**
    * @method isOperable
    * Returns true if chart is frozen, enabled and has a zoomType which allows
    * interaction
    * @return {Boolean}
    */
    p.isOperable = function () {
        return this.isEnabled() && this.isFrozen();
    };
    /**
    * @method isSeriesVisible
    * @param {Object} series
    * Returns true if the visibility property of a series is 'visible'
    * @return {Boolean}
    */
    p.isSeriesVisible = function (series) {
        return (series && series.visibility === 'visible') === true;
    };
    
    p.onBeforeSuspend = function () {
        // this ensures chart is always drawn in pre caching phase
        if (!this.isDrawn()) {
            this.throttledRedraw.flush();
        }
    };

    p.suspend = function () {
        this.debouncedUpdateViewport.cancel();
        this.throttledRedraw.cancel();
        this.throttledRedraw = _.throttle(this._mockedRedraw, 0, { 'leading': false });
        this.initEvents(true);
        this.initFreezeEvents(true);
    };

    p.dispose = function () {
        this.toolbar.dispose();
        this.cursorTable.dispose();
        this.debouncedUpdateViewport.cancel();
        this.initFreezeEvents(true);
        this.initEvents(true);
        this.throttledRedraw.cancel();
        this.$el = null;
        this.elem = null;
    };

    function _getPointLocation(point, xAxis, yAxis) {
        var xLength = this.model.primaryXAxis.width;
        var yLength = this.model.primaryYAxis.height;
        var xRange = xAxis.visibleRange;
        var yRange = yAxis.visibleRange;

        var x = (point.x - xRange.min) / (xRange.delta);
        var y = (point.y - yRange.min) / (yRange.delta);

        var left = xAxis.isInversed ? (1 - x) : x;
        var top = yAxis.isInversed ? y : (1 - y);

        return { X: left * xLength, Y: top * yLength };
    }

    function _typeToOrientation(type) {
        return type === 'XAxis' ? 'Horizontal' : 'Vertical';
    }
    function _getModelFromType(type) {
        return type === 'Graph' ? this.model.series : this.model.axes;
    }

    return CursorInteractionDecorator.decorate(InteractionDecorator.decorate(Renderer));
});
