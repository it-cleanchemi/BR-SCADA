define([
    'brease/datatype/StructuredProperty',
    'brease/core/Types',
    'brease/enum/Enum',
    'brease/datatype/ArrayNode',
    'brease/datatype/Node',
    'widgets/brease/XYChart/libs/XYChartEvents'
],
function (SuperClass, Types, Enum, ArrayNode, Node, ChartEvents) {
    'use strict';

    /**
    * @class widgets.brease.XYChart.Graph
    * Defines appearance and behaviour of a Graph
    * @extends brease.datatype.StructuredProperty
    * @embeddedClass
    * @virtualNote
    */

    /**
    * @cfg {Boolean} visible=true
    * @bindable
    * @iatStudioExposed
    * @iatCategory Behavior 
    * Defines the visibility of the graph. (Visible = true, invisible = false)
    */

    /**
    * @cfg {PropertyCollectionReference} yAxisReference (required)
    * @iatStudioExposed
    * @iatCategory Behavior
    * @typeRefId yAxis
    * Specifies the id of the yAxis that has to be associated with this graph.
    * The yAxis defines the display unit and scales with the graph when autoscaling.
    */

    /**
    * @cfg {PropertyCollectionReference} xAxisReference (required)
    * @iatStudioExposed
    * @iatCategory Behavior
    * @typeRefId xAxis
    * Specifies the id of the xAxis that has to be associated with this graph.
    * The xAxis defines the display unit and scales with the graph when autoscaling.
    */

    /**
    * @cfg {NumberArray1D} valueX
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * @nodeRefId nodeX
    */

    /**
    * @cfg {brease.datatype.ArrayNode} nodeX
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * Defines the data source of the graph.
    */

    /**
    * @cfg {NumberArray1D} valueY
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * @nodeRefId nodeY
    */

    /**
    * @cfg {brease.datatype.ArrayNode} nodeY
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * Defines the data source of the graph.
    */

    /**
    * @cfg {Number} cursor1ValueX=0
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * @nodeRefId cursor1NodeX
    */

    /**
    * @cfg {brease.datatype.Node} cursor1NodeX=''
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * Defines the cursor intersection of the graph.
    */

    /**
    * @cfg {Number} cursor1ValueY=0
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * @nodeRefId cursor1NodeY
    */

    /**
    * @cfg {brease.datatype.Node} cursor1NodeY=''
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * Defines the cursor intersection of the graph.
    */

    /**
    * @cfg {Number} cursor2ValueX=0
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * @nodeRefId cursor2NodeX
    */

    /**
    * @cfg {brease.datatype.Node} cursor2NodeX=''
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * Defines the cursor intersection of the graph.
    */

    /**
    * @cfg {Number} cursor2ValueY=0
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * @nodeRefId cursor2NodeY
    */

    /**
    * @cfg {brease.datatype.Node} cursor2NodeY=''
    * @bindable
    * @not_projectable
    * @iatStudioExposed
    * @iatCategory Data
    * Defines the cursor intersection of the graph.
    */

    /**
    * @cfg {brease.enum.GraphType} type='stepLine'
    * @iatCategory Behavior
    * Defines the visual representation of the data.
    */

    /**
    * @cfg {StyleReference} style = 'default'
    * @iatStudioExposed
    * @iatCategory Appearance
    * @bindable
    * @typeRefId widgets.brease.XYChart.Graph
    * Reference to a style that can be created by the user.
    */

    /**
    * @cfg {Integer} numberOfSamples=-1
    * @bindable
    * @iatStudioExposed
    * @iatCategory Behavior
    */

    /**
    * @cfg {Boolean} reporting = true
    * Defines if value changes are reported to the renderer
    */

    var defaultSettings = {
            visible: true,
            enable: true,
            type: 'stepLine',
            style: 'default',
            numberOfSamples: -1,
            reporting: true,
            freezeMode: false
        },
        graphStyleCollection = {
            lineColor: {
                cssProp: 'color',
                parseValue: function (value) {
                    return value;
                }
            },
            lineWidth: {
                cssProp: 'border-width',
                parseValue: function (value) {
                    return Types.parseValue(value, 'Integer', { min: 0, default: 3 });
                }
            }
        },
        styleElemGraph = document.createElement('DIV');

    styleElemGraph.classList.add('graph');

    var Graph = SuperClass.extend(function Graph() {
            SuperClass.apply(this, arguments);
            this.settings.stylePrefix = this.settings.stylePrefix + '_' + this.constructor.name + '_style_';
            this.createStyleElem();
            this.internal = {};
        }, defaultSettings),

        p = Graph.prototype;

    p.init = function (eventDispatcher, styleContainerElem) {
        this.data = {};
        this.internal.demoSignalFunctions = [];
        this.internal.demoValueX = [];
        this.internal.demoValueY = [];
        this.data.nodeY = new ArrayNode([]);
        this.data.nodeX = new ArrayNode([]);
        this.data.cursor1NodeX = new Node();
        this.data.cursor1NodeY = new Node();
        this.data.cursor2NodeX = new Node();
        this.data.cursor2NodeY = new Node();
        this.data.cursorNames = [];
        this.eventDispatcher = eventDispatcher;
        this.initEvents();
        this.setStyle(this.settings.style);
        this.appendStyleElem(styleContainerElem);
        this.setVisible(this.settings.visible);
        this.setType(this.settings.type);
        this.setXAxisReference(this.settings.xAxisReference);
        this.setYAxisReference(this.settings.yAxisReference);
        this.setReporting(this.settings.reporting);
    };

    p.wake = function () {
        this.initEvents();
    };

    p.initEvents = function (remove) {
        var fn = remove ? 'removeEventListener' : 'addEventListener';
        this.eventDispatcher[fn](ChartEvents.UPDATE_STYLES, this._bind('updateStyleProperties'));
        this.eventDispatcher[fn](ChartEvents.THEME_CHANGED, this._bind('updateStyleProperties'));
        this.eventDispatcher[fn](ChartEvents.AXIS.UNIT_CHANGED, this._bind('_axisUnitChangeHandler'));
        this.eventDispatcher[fn](ChartEvents.UPDATE_REPORTING, this._bind('_updateReporting'));
        this.eventDispatcher[fn](ChartEvents.FREEZEMODE_CHANGED, this._bind('_updateFreezeMode'));
        this.eventDispatcher[fn](ChartEvents.CROSSHAIR.VALUE_CHANGED, this._bind('_onCursorValueChanged'));
        this.eventDispatcher[fn](ChartEvents.CURSOR.VISIBLE_CHANGED, this._bind('_onCursorVisibleChanged'));
    };

    p.createStyleElem = function () {
        this.elem = styleElemGraph.cloneNode();
        this.elem.id = this.id;
    };

    /**
    * @method generateDemoData
    * @param {Function[]} demoSignalFunctions
    * creates demo data with first function entry in demoSignalFunctions. Adds all demo singal type functions to demoSignalFunctions
    * if demoSignalFunctions is empty.
    */
    p.generateDemoData = function (demoSignalFunctions) {
        if (demoSignalFunctions.length === 0) {
            Array.prototype.push.apply(demoSignalFunctions, [
                Math.sin,
                Math.cos,
                _linear,
                _triangle,
                _square,
                // inverted functions 5:
                _invert(Math.sin),
                _invert(Math.cos),
                _invert(_linear),
                _invert(_triangle),
                _invert(_square),
                // combined functions 6:
                function (t) { return Math.sin(t) / 2 + _linear(t) / 2; },
                function (t) { return Math.cos(t) / 2 + _linear(t) / 2; },
                function (t) { return -1 * (Math.sin(t) / 2 + _linear(t) / 2); },
                function (t) { return -1 * (Math.cos(t) / 2 + _linear(t) / 2); },
                function (t) { return _triangle(t) / 2 + _square(t) / 2; },
                function (t) { return -1 * (_triangle(t) / 2 + _square(t) / 2); }
            ]);
        }
        this.internal.demoSignalFunction = demoSignalFunctions.shift();
        this.internal.demoSignalFunctions = demoSignalFunctions;
        var xValues = [], yValues = [];

        for (var i = 0; i < 400; i++) {
            yValues.push(this.internal.demoSignalFunction(i * 3.141592654 / 180.0));
            xValues.push(i);
        }
        this.setDemoValueX(xValues);
        this.setDemoValueY(yValues);
        _publishSeries.call(this);
    };

    /**
    * @method setDemoValueX
    * @param {NumberArray1D} value
    * demo data for editMode
    */
    p.setDemoValueX = function (value) {
        this.internal.demoValueX = value;
    };
    /**
    * @method getDemoValueX
    * @return {NumberArray1D} value
    */
    p.getDemoValueX = function () {
        return this.internal.demoValueX;
    };
    /**
    * @method setDemoValueY
    * @param {NumberArray1D} value
    * demo data for editMode
    */
    p.setDemoValueY = function (value) {
        this.internal.demoValueY = value;
    };
    /**
    * @method getDemoValueY
    * @return {NumberArray1D} value
    */
    p.getDemoValueY = function () {
        return this.internal.demoValueY;
    };

    p.suspend = function () {
        this.initEvents(true);
    };

    p.dispose = function () {
        this.internal.demoSignalFunctions.unshift(this.internal.demoSignalFunction);
        window.cancelAnimationFrame(this.internal.animationFrame);
        this.internal.animationFrame = null;
        this.initEvents(true);
        if (this.elem) {
            this.elem.remove();
            this.elem = null;
        }
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.DISPOSED, detail: { name: this.name, type: this.constructor.name } });
        SuperClass.prototype.dispose.apply(this, arguments);
    };

    p.setNumberOfSamples = function (value) {
        this.settings.numberOfSamples = Types.parseValue(value, 'Integer', { min: -1 });
        _publishSeries.call(this);
    };

    p.getNumberOfSamples = function () {
        return this.settings.numberOfSamples;
    };

    p.setId = function (id) {
        var name = this.name;
        this.elem.id = id;
        SuperClass.prototype.setId.apply(this, arguments);
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.NAME_CHANGED, detail: { name: name, data: { name: this.name }, type: this.constructor.name } });
    };

    p.setYAxisReference = function (value) {
        this.settings.yAxisReference = value;
        _publishAxisReference.call(this);
    };

    p.getYAxisReference = function () {
        return this.settings.yAxisReference;
    };

    p.setXAxisReference = function (value) {
        this.settings.xAxisReference = value;
        _publishAxisReference.call(this);
    };

    p.getXAxisReference = function () {
        return this.settings.xAxisReference;
    };

    p.setType = function (value) {
        this.settings.type = Types.parseValue(value, 'Enum', { Enum: Enum.GraphType, default: Enum.GraphType.stepLine });
    };

    p.getType = function () {
        return this.settings.type;
    };

    p.setStyle = function (value) {
        var settings = this.settings,
            style = settings.stylePrefix + settings.style,
            classList = this.elem.classList;
        if (classList.contains(style)) {
            classList.remove(style);
        }
        style = settings.stylePrefix + value;
        settings.style = value;
        classList.add(style);
        this.updateStyleProperties();
    };

    p.getStyle = function () {
        return this.settings.style;
    };

    /**
    * @method setNodeX
    * @param {brease.datatype.ArrayNode} node The node to be set
    */
    p.setNodeX = function (node) {
        var _node = ArrayNode.json2ArrayNode(node);
        if (_node === null) {
            this.setValueX(_node);
            this.setMinValueX(_node);
            this.setMaxValueX(_node);
        } else {
            Object.keys(_node.toJSON()).forEach(function (key) {
                this[key] = _node[key];
            }, this.data.nodeX);
            this.setValueX(_node.getValue());
            this.setMinValueX(_node.getMinValue());
            this.setMaxValueX(_node.getMaxValue());
        }
    };

    /**
    * @method getNodeX 
    * @return {brease.datatype.ArrayNode} The current node of the widget
    */
    p.getNodeX = function () {
        return this.data.nodeX;
    };

    /**
    * @method setValueX
    * @param {NumberArray1D} value 
    */
    p.setValueX = function (value) {
        value = Array.isArray(value) ? value : [];
        this.data.nodeX.setValue(value);
        _publishSeries.call(this);
    };
    /**
    * @method getValueX
    * @return {NumberArray1D} value
    */
    p.getValueX = function () {
        return this.data.nodeX.getValue();
    };

    /**
    * @method setMinValueX
    * @param {Number} value 
    */
    p.setMinValueX = function (value) {
        this.data.nodeX.setMinValue(Types.parseValue(value, 'number'));
        _publishRangesX.call(this);
    };

    /**
    * @method getMinValueX
    * @return {Number} value
    */
    p.getMinValueX = function () {
        return this.data.nodeX.getMinValue();
    };

    /**
    * @method setCalcedMinValueX
    * @param {Number} value 
    */
    p.setCalcedMinValueX = function (value) {
        this.data.calcedMinValueX = Types.parseValue(value, 'number');
        _publishRangesX.call(this);
    };

    /**
    * @method getCalcedMinValueX
    * @return {Number} value
    */
    p.getCalcedMinValueX = function () {
        return this.data.calcedMinValueX;
    };

    /**
    * @method setMaxValueX
    * @param {Number} value 
    */
    p.setMaxValueX = function (value) {
        this.data.nodeX.setMaxValue(Types.parseValue(value, 'number'));
        _publishRangesX.call(this);
    };

    /**
    * @method getMaxValueX
    * @return {Number} value
    */
    p.getMaxValueX = function () {
        return this.data.nodeX.getMaxValue();
    };

    /**
    * @method setCalcedMaxValueX
    * @param {Number} value 
    */
    p.setCalcedMaxValueX = function (value) {
        this.data.calcedMaxValueX = Types.parseValue(value, 'number');
        _publishRangesX.call(this);
    };

    /**
    * @method getCalcedMaxValueX
    * @return {Number} value
    */
    p.getCalcedMaxValueX = function () {
        return this.data.calcedMaxValueX;
    };

    /**
    * @method setNodeY
    * @param {brease.datatype.ArrayNode} node The node to be set
    */
    p.setNodeY = function (node) {
        var _node = ArrayNode.json2ArrayNode(node);
        if (_node === null) {
            this.setValueY(_node);
            this.setMinValueY(_node);
            this.setMaxValueY(_node);
        } else {
            Object.keys(_node.toJSON()).forEach(function (key) {
                this[key] = _node[key];
            }, this.data.nodeY);
            this.setValueY(_node.getValue());
            this.setMinValueY(_node.getMinValue());
            this.setMaxValueY(_node.getMaxValue());
        }
    };

    /**
    * @method getNodeY 
    * @return {brease.datatype.ArrayNode} The current node of the widget
    */
    p.getNodeY = function () {
        return this.data.nodeY;
    };

    /**
    * @method setValueY
    * @param {NumberArray1D} value 
    */
    p.setValueY = function (value) {
        value = Array.isArray(value) ? value : [];
        this.data.nodeY.setValue(value);
        this.setCalcedMinValueY(Math.min.apply(Math, value));
        this.setCalcedMaxValueY(Math.max.apply(Math, value));
        _publishSeries.call(this);
    };

    /**
    * @method getValueY
    * @return {NumberArray1D} value
    */
    p.getValueY = function () {
        return this.data.nodeY.getValue();
    };

    /**
    * @method setMinValueY
    * @param {Number} value 
    */
    p.setMinValueY = function (value) {
        this.data.nodeY.setMinValue(Types.parseValue(value, 'number'));
        _publishRangesY.call(this);
    };

    /**
    * @method getMinValueY
    * @return {Number} value
    */
    p.getMinValueY = function () {
        return this.data.nodeY.getMinValue();
    };

    /**
    * @method setCalcedMinValueY
    * @param {Number} value 
    */
    p.setCalcedMinValueY = function (value) {
        this.data.calcedMinValueY = Types.parseValue(value, 'number');
        _publishRangesY.call(this);
    };

    /**
    * @method getCalcedMinValueY
    * @return {Number} value
    */
    p.getCalcedMinValueY = function () {
        return this.data.calcedMinValueY;
    };

    /**
    * @method setMaxValueY
    * @param {Number} value 
    */
    p.setMaxValueY = function (value) {
        this.data.nodeY.setMaxValue(Types.parseValue(value, 'number'));
        _publishRangesY.call(this);
    };

    /**
    * @method getMaxValueY
    * @return {Number} value
    */
    p.getMaxValueY = function () {
        return this.data.nodeY.getMaxValue();
    };

    /**
    * @method setCalcedMaxValueY
    * @param {Number} value 
    */
    p.setCalcedMaxValueY = function (value) {
        this.data.calcedMaxValueY = Types.parseValue(value, 'number');
        _publishRangesY.call(this);
    };

    /**
    * @method getCalcedMaxValueY
    * @return {Number} value
    */
    p.getCalcedMaxValueY = function () {
        return this.data.calcedMaxValueY;
    };

    /**
    * @method setCursor1NodeY
    * @param {brease.datatype.Node} node The node to be set
    */
    p.setCursor1NodeY = function (node) {
        var _node = Node.json2Node(node);
        if (_node === null) {
            this.setCursor1ValueY(_node);
        } else {
            Object.keys(_node.toJSON()).forEach(function (key) {
                this[key] = _node[key];
            }, this.data.cursor1NodeY);
        }
    };

    /**
    * @method getCursor1NodeY
    * @return {brease.datatype.Node} The current node of the widget
    */
    p.getCursor1NodeY = function () {
        return this.data.cursor1NodeY;
    };

    /**
    * @method setCursor1ValueY
    * @param {Number} value
    */
    p.setCursor1ValueY = function (value) {
        value = Types.parseValue(value, 'number');
        this.data.cursor1NodeY.setValue(value);
    };

    /**
    * @method getCursor1ValueY
    * @return {Number} value
    */
    p.getCursor1ValueY = function () {
        return this.data.cursor1NodeY.getValue();
    };

    /**
    * @method setCursor1NodeX
    * @param {brease.datatype.Node} node The node to be set
    */
    p.setCursor1NodeX = function (node) {
        var _node = Node.json2Node(node);
        if (_node === null) {
            this.setCursor1ValueX(_node);
        } else {
            Object.keys(_node.toJSON()).forEach(function (key) {
                this[key] = _node[key];
            }, this.data.cursor1NodeX);
        }
    };

    /**
    * @method getCursor1NodeX
    * @return {brease.datatype.Node} The current node of the widget
    */
    p.getCursor1NodeX = function () {
        return this.data.cursor1NodeX;
    };

    /**
    * @method setCursor1ValueX
    * @param {Number} value 
    */
    p.setCursor1ValueX = function (value) {
        value = Types.parseValue(value, 'number');
        this.data.cursor1NodeX.setValue(value);
    };

    /**
    * @method getCursor1ValueX
    * @return {Number} value
    */
    p.getCursor1ValueX = function () {
        return this.data.cursor1NodeX.getValue();
    };

    /**
    * @method setCursor2NodeY
    * @param {brease.datatype.Node} node The node to be set
    */
    p.setCursor2NodeY = function (node) {
        var _node = Node.json2Node(node);
        if (_node === null) {
            this.setCursor2ValueY(_node);
        } else {
            Object.keys(_node.toJSON()).forEach(function (key) {
                this[key] = _node[key];
            }, this.data.cursor2NodeY);
        }
    };

    /**
    * @method getCursor2NodeY
    * @return {brease.datatype.Node} The current node of the widget
    */
    p.getCursor2NodeY = function () {
        return this.data.cursor2NodeY;
    };

    /**
    * @method setCursor2ValueY
    * @param {Number} value
    */
    p.setCursor2ValueY = function (value) {
        value = Types.parseValue(value, 'number');
        this.data.cursor2NodeY.setValue(value);
    };

    /**
    * @method getCursor2ValueY
    * @return {Number} value
    */
    p.getCursor2ValueY = function () {
        return this.data.cursor2NodeY.getValue();
    };

    /**
    * @method setCursor2NodeX
    * @param {brease.datatype.Node} node The node to be set
    */
    p.setCursor2NodeX = function (node) {
        var _node = Node.json2Node(node);
        if (_node === null) {
            this.setCursor2ValueX(_node);
        } else {
            Object.keys(_node.toJSON()).forEach(function (key) {
                this[key] = _node[key];
            }, this.data.cursor2NodeX);
        }
    };

    /**
    * @method getCursor2NodeX
    * @return {brease.datatype.Node} The current node of the widget
    */
    p.getCursor2NodeX = function () {
        return this.data.cursor2NodeX;
    };

    /**
    * @method setCursor2ValueX
    * @param {Number} value 
    */
    p.setCursor2ValueX = function (value) {
        value = Types.parseValue(value, 'number');
        this.data.cursor2NodeX.setValue(value);
    };

    /**
    * @method getCursor2ValueX
    * @return {NumberArray1D} value
    */
    p.getCursor2ValueX = function () {
        return this.data.cursor2NodeX.getValue();
    };
    /**
    * @method setEnable
    * Sets the state of property «enable»
    * @param {Boolean} value
    */
    p.setEnable = function (value) {
        this.settings.enable = Types.parseValue(value, 'Boolean');
        if (this.settings.enable === true) {
            this.elem.classList.remove('disabled');
        } else {
            this.elem.classList.add('disabled');
        }
        this.updateStyleProperties();
    };

    /**
    * @method getEnable
    * Returns the state of property «enable»
    * @return {Boolean}
    */
    p.getEnable = function () {
        return this.settings.enable;
    };

    /**
    * @method setVisible
    * @iatStudioExposed
    * Sets the state of property «visible»
    * @param {Boolean} value
    */
    p.setVisible = function (value) {
        this.settings.visible = Types.parseValue(value, 'Boolean');
        _publishVisibility.call(this);
    };

    /**
    * @method getVisible
    * Returns the state of property «visible»
    * @return {Boolean}
    */
    p.getVisible = function () {
        return this.settings.visible;
    };

    /**
    * @method setReporting
    * Defines if the graph reports value changes to the renderer due to updateChartTime
    * @param {Boolean} value
    */
    p.setReporting = function (value) {
        this.settings.reporting = Types.parseValue(value, 'Boolean');
        if (!this.isFrozen()) {
            _publishSeries.call(this);
            _publishRangesX.call(this);
            _publishRangesY.call(this);
        }
    };

    /**
    * @method getReporting
    * Returns true if the graph is reporting value changes
    * @return {Boolean}
    */
    p.getReporting = function () {
        return this.settings.reporting;
    };

    /**
    * @method update
    * Used to force an update of the values if chart is in freeze mode
    */
    p.update = function () {
        _publishSeries.call(this, true);
        _publishRangesX.call(this, true);
        _publishRangesY.call(this, true);
    };

    /**
    * @method setFreezeMode
    * Defines if the graph reports value changes to the renderer 
    * @param {Boolean} value
    */
    p.setFreezeMode = function (value) {
        this.settings.freezeMode = Types.parseValue(value, 'Boolean');
        _publishSeries.call(this);
        _publishRangesX.call(this);
        _publishRangesY.call(this);
        if (!this.settings.freezeMode) {
            this.invalidateCursors();
        }
    };

    p.invalidateCursors = function () {
        this.setCursor1ValueX(null);
        this.setCursor1ValueY(null);
        this.setCursor2ValueX(null);
        this.setCursor2ValueY(null);
        _publishCursor1Values.call(this);
        _publishCursor2Values.call(this);
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
    * @method _onCursorValueChanged
    * called when the user places a cursor in freeze mode
    */
    p._onCursorValueChanged = function (e) {
        if (e.detail.name === this.name) {
            var cursorIndex = this.data.cursorNames.indexOf(e.detail.data.cursorName);
            switch (cursorIndex) {
                case 0:
                    this.setCursor1ValueX(e.detail.data.valueX);
                    this.setCursor1ValueY(e.detail.data.valueY);
                    _publishCursor1Values.call(this);
                    break;
                case 1:
                    this.setCursor2ValueX(e.detail.data.valueX);
                    this.setCursor2ValueY(e.detail.data.valueY);
                    _publishCursor2Values.call(this);
                    break;

                default:
            }

        }
    };
    /**
    * @method _onCursorVisibleChanged
    * used to collect available cursors
    */
    p._onCursorVisibleChanged = function (e) {
        if (!this.data.cursorNames.includes(e.detail.name)) {
            this.data.cursorNames.push(e.detail.name);
        }
    };
    /**
    * @method toString
    * Creates readable string of structured property. (i.e graph[id1])
    */
    p.toString = function () {
        return 'graph[' + this.name + ']';
    };
    /**
    * @method attributeToString
    * Creates readable string of attribute. (i.e graph[id1].node)
    */
    p.attributeToString = function (name) {
        return this.toString() + '.' + name;
    };

    p.appendStyleElem = function (styleContainerElem) {
        if (styleContainerElem !== null) {
            styleContainerElem.appendChild(this.elem);
        }
    };

    p.updateStyleProperties = function () {
        var that = this;
        if (!this.internal.animationFrame) {
            this.internal.animationFrame = window.requestAnimationFrame(function () {
                that.internal.animationFrame = null;
                var computedStyles = window.getComputedStyle(that.elem),
                    styles = {};
                that._applyStyleCollection(styles, graphStyleCollection, computedStyles);
                that.eventDispatcher.dispatchEvent({ type: ChartEvents.STYLE_CHANGED, detail: { name: that.name, data: styles, type: that.constructor.name } });
            });
        }
    };

    /**
    * @method _applyStyleCollection
    * Adds the current styles to the style object
    * @param {Object} styles object to extend
    * @param {Object} styleCollection mapping from css property to styleable property
    * @param {Object} computedStyles CSSStyleDeclaration
    */
    p._applyStyleCollection = function (styles, styleCollection, computedStyles) {
        var entry, // current entry in the styleCollection
            key;
        for (key in styleCollection) {
            entry = styleCollection[key];
            styles[key] = entry.parseValue(computedStyles.getPropertyValue(entry.cssProp));
        }
    };

    p._axisUnitChangeHandler = function (e) {
        var nodeData = { nodeAttribute: 'unit', value: e.detail.data.unit },
            cursor1Data = { nodeAttribute: 'unit', value: e.detail.data.unit },
            cursor2Data = { nodeAttribute: 'unit', value: e.detail.data.unit };
        if (e.detail.name === this.settings.yAxisReference) {
            this.data.nodeY.setUnit(e.detail.data.unit);
            this.data.cursor1NodeY.setUnit(e.detail.data.unit);
            this.data.cursor2NodeY.setUnit(e.detail.data.unit);
            nodeData.attribute = this.attributeToString('nodeY');
            cursor1Data.attribute = this.attributeToString('cursor1NodeY');
            cursor2Data.attribute = this.attributeToString('cursor2NodeY');
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.UNIT_CHANGED, detail: { name: this.name, data: nodeData, type: this.constructor.name } });
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.UNIT_CHANGED, detail: { name: this.name, data: cursor1Data, type: this.constructor.name } });
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.UNIT_CHANGED, detail: { name: this.name, data: cursor2Data, type: this.constructor.name } });
        }
        if (e.detail.name === this.settings.xAxisReference) {
            this.data.nodeX.setUnit(e.detail.data.unit);
            this.data.cursor1NodeX.setUnit(e.detail.data.unit);
            this.data.cursor2NodeX.setUnit(e.detail.data.unit);
            nodeData.attribute = this.attributeToString('nodeX');
            cursor1Data.attribute = this.attributeToString('cursor1NodeX');
            cursor2Data.attribute = this.attributeToString('cursor2NodeX');
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.UNIT_CHANGED, detail: { name: this.name, data: nodeData, type: this.constructor.name } });
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.UNIT_CHANGED, detail: { name: this.name, data: cursor1Data, type: this.constructor.name } });
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.UNIT_CHANGED, detail: { name: this.name, data: cursor2Data, type: this.constructor.name } });
        }
    };

    p._updateReporting = function (e) {
        this.setReporting(Types.parseValue(e.detail.data.reporting, 'Boolean'));
    };

    p._updateFreezeMode = function (e) {
        this.setFreezeMode(Types.parseValue(e.detail.data.freezeMode, 'Boolean'));
    };

    function _publishSeries(update) {
        var arrX = _getXValues.call(this),
            arrY = _getYValues.call(this),
            series = _createSeries.call(this, arrX, arrY);

        this.setCalcedMinValueX(Math.min.apply(Math, arrX.slice(1, length)));
        this.setCalcedMaxValueX(Math.max.apply(Math, arrX.slice(1, length)));
        this.setCalcedMinValueY(Math.min.apply(Math, arrY.slice(1, length)));
        this.setCalcedMaxValueY(Math.max.apply(Math, arrY.slice(1, length)));
        if (brease.config.editMode || (this.getReporting() && !this.isFrozen()) || update === true) {
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.VALUE_CHANGED, detail: { name: this.name, data: { value: series }, type: this.constructor.name } });
        }
    }
    function _getXValues() {
        return brease.config.editMode ? this.getDemoValueX() : this.getValueX();
    }
    function _getYValues() {
        return brease.config.editMode ? this.getDemoValueY() : this.getValueY();
    }
    function _createSeries(arrX, arrY) {
        var series = [],
            i = 0,
            length = Types.parseValue(brease.config.editMode || this.settings.numberOfSamples === -1 ? Math.min(arrX.length, arrY.length) : Math.min(arrX.length, arrY.length, this.settings.numberOfSamples), 'Integer', { min: 0 });

        for (i = 0; i < length; i += 1) {
            series.push({ x: arrX[i], y: arrY[i] });
        }
        return series;
    }

    function _publishAxisReference() {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.AXIS_REFERENCE_CHANGED, detail: { name: this.name, data: { xAxisReference: this.getXAxisReference(), yAxisReference: this.getYAxisReference() }, type: this.constructor.name } });
    }

    function _publishVisibility() {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.VISIBLE_CHANGED, detail: { name: this.name, data: { visible: this.settings.visible }, type: this.constructor.name } });
    }

    function _publishRangesX(update) {
        if (brease.config.editMode || (this.getReporting() && !this.isFrozen()) || update === true) {
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.RANGE_X_CHANGED, detail: { name: this.name, data: { axisReference: this.getXAxisReference(), range: { min: this.getMinValueX(), calcedMin: this.getCalcedMinValueX(), max: this.getMaxValueX(), calcedMax: this.getCalcedMaxValueX() } }, type: this.constructor.name } });
        }
    }

    function _publishRangesY(update) {
        if (brease.config.editMode || (this.getReporting() && !this.isFrozen()) || update === true) {
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.GRAPH.RANGE_Y_CHANGED, detail: { name: this.name, data: { axisReference: this.getYAxisReference(), range: { min: this.getMinValueY(), calcedMin: this.getCalcedMinValueY(), max: this.getMaxValueY(), calcedMax: this.getCalcedMaxValueY() } }, type: this.constructor.name } });
        }
    }

    function _publishCursor1Values() {
        if (!brease.config.editMode) {
            var data = {};
            data[this.attributeToString('cursor1ValueX')] = this.getCursor1ValueX();
            data[this.attributeToString('cursor1NodeX')] = this.getCursor1NodeX().toJSON();
            data[this.attributeToString('cursor1ValueY')] = this.getCursor1ValueY();
            data[this.attributeToString('cursor1NodeY')] = this.getCursor1NodeY().toJSON();
            this.eventDispatcher.dispatchEvent({
                type: ChartEvents.GRAPH.CURSOR_VALUE_CHANGED,
                detail: {
                    name: this.name,
                    data: data,
                    type: this.constructor.name
                }
            });
        }
    }

    function _publishCursor2Values() {
        if (!brease.config.editMode) {
            var data = {};
            data[this.attributeToString('cursor2ValueX')] = this.getCursor2ValueX();
            data[this.attributeToString('cursor2NodeX')] = this.getCursor2NodeX().toJSON();
            data[this.attributeToString('cursor2ValueY')] = this.getCursor2ValueY();
            data[this.attributeToString('cursor2NodeY')] = this.getCursor2NodeY().toJSON();
            this.eventDispatcher.dispatchEvent({
                type: ChartEvents.GRAPH.CURSOR_VALUE_CHANGED,
                detail: {
                    name: this.name,
                    data: data,
                    type: this.constructor.name
                }
            });
        }
    }

    function _linear(t) {
        return (t * 0.288) - 1;
    }

    function _triangle(t) {
        return 1 - Math.abs((t % 4) - 2);
    }

    function _square(t) {
        if (t < 2) return 1;
        if (t < 4) return -1;
        if (t < 6) return 1;
        if (t < 8) return -1;
    }

    function _invert(f) {
        return function (t) {
            return f(t) * -1;
        };
    }

    return Graph;
});
