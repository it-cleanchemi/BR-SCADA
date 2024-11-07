define(['widgets/brease/XYChart/libs/XYChartEvents', 'brease/core/Types'], function (ChartEvents, Types) {
    'use strict';

    var attributeMapping = new Map();
    attributeMapping.set('cursor1NodeX', 'setValueX1');
    attributeMapping.set('cursor1NodeY', 'setValueY1');
    attributeMapping.set('cursor2NodeX', 'setValueX2');
    attributeMapping.set('cursor2NodeY', 'setValueY2');

    /**
    * @class widgets.brease.XYChart.CursorData
    * Defines the cursor data for each graph value, format, unit for x and y
    * @extends Object
    */
    /**
    * @method constructor
    */
    var CursorData = function CursorData() {
            _initDom.call(this);
            this.name = '';
            this.settings = {
                formatX: { decimalPlaces: 1, minimumIntegerDigits: 1 },
                formatY: { decimalPlaces: 1, minimumIntegerDigits: 1 },
                unitX: '',
                unitY: '',
                xAxisReference: '',
                yAxisReference: ''
            };
            this.boundStyleChanged = this.onStyleChanged.bind(this);
            this.boundGraphVisibleChanged = this.onGraphVisibleChanged.bind(this);
            this.boundAxisReferenceChanged = this.onAxisReferenceChanged.bind(this);
            this.boundGraphCursorValueChanged = this.onGraphCursorValueChanged.bind(this);
            this.boundAxisFormatChanged = this.onAxisFormatChanged.bind(this);
            this.boundAxisUnitChanged = this.onAxisUnitChanged.bind(this);
        },
        p = CursorData.prototype;

    p.init = function (eventDispatcher) {
        this.eventDispatcher = eventDispatcher;
        this.initEvents();
    };
    p.initEvents = function (remove) {
        var fn = remove ? 'removeEventListener' : 'addEventListener';
        this.eventDispatcher[fn](ChartEvents.STYLE_CHANGED, this.boundStyleChanged);
        this.eventDispatcher[fn](ChartEvents.GRAPH.VISIBLE_CHANGED, this.boundGraphVisibleChanged);
        this.eventDispatcher[fn](ChartEvents.GRAPH.AXIS_REFERENCE_CHANGED, this.boundAxisReferenceChanged);
        this.eventDispatcher[fn](ChartEvents.GRAPH.CURSOR_VALUE_CHANGED, this.boundGraphCursorValueChanged);
        this.eventDispatcher[fn](ChartEvents.AXIS.FORMAT_CHANGED, this.boundAxisFormatChanged);
        this.eventDispatcher[fn](ChartEvents.AXIS.UNIT_CHANGED, this.boundAxisUnitChanged);
    };

    p.setCursor1Visible = function (visible) {
        if (this.valueX1Elem.parentElement === null) {
            _insertColumn.call(this, 0);
        }
        _handleElemVisibility(this.valueX1Elem, this.valueY1Elem, visible);
    };

    p.setCursor2Visible = function (visible) {
        if (this.valueX2Elem.parentElement === null) {
            _insertColumn.call(this, 1);
        }
        _handleElemVisibility(this.valueX2Elem, this.valueY2Elem, visible);
    };

    p.setVisible = function (visible) {
        this.settings.visible = visible;
        _handleElemVisibility(this.rowXElem, this.rowYElem, visible);
    };

    p.isVisible = function () {
        return this.settings.visible === true;
    };
    /**
    * @method setName
    * @param {String} name
    */
    p.setName = function (name) {
        //this.elem.setAttribute('data-name', name);
        this.name = name;
    };
    /**
    * @method getName
    * @returns {String}
    */
    p.getName = function () {
        return this.name;
    };
    /**
    * @method setColor
    * @param {String} color
    * used to set the color of the cursors
    */
    p.setColor = function (color) {
        this.rowXElem.style.color = color;
        this.rowYElem.style.color = color;
    };
    /**
    * @method getColor
    * @returns {String}
    */
    p.getColor = function () {
        return this.rowXElem.style.color;
    };
    p.setFormatX = function (format) {
        this.settings.formatX = format;
        _renderValue(this.valueX1Elem, this.getValueX1(), this.getFormatX());
        _renderValue(this.valueX2Elem, this.getValueX2(), this.getFormatX());
    };
    p.getFormatX = function () {
        return this.settings.formatX;
    };
    p.setUnitX = function (unitX) {
        if (unitX !== this.getUnitX()) {
            _renderUnitCode('X', this.unitXElem, unitX);
        }
        this.settings.unitX = unitX;
    };
    p.getUnitX = function () {
        return this.settings.unitX;
    };
    p.setFormatY = function (format) {
        this.settings.formatY = format;
        _renderValue(this.valueY1Elem, this.getValueY1(), this.getFormatY());
        _renderValue(this.valueY2Elem, this.getValueY2(), this.getFormatY());
    };
    p.getFormatY = function () {
        return this.settings.formatY;
    };
    p.setUnitY = function (unitY) {
        if (unitY !== this.getUnitY()) {
            _renderUnitCode('Y', this.unitYElem, unitY);
        }
        this.settings.unitY = unitY;
    };
    p.getUnitY = function () {
        return this.settings.unitY;
    };
    p.setXAxisReference = function (xAxisReference) {
        this.settings.xAxisReference = xAxisReference;
    };
    p.getXAxisReference = function () {
        return this.settings.xAxisReference;
    };
    p.setYAxisReference = function (yAxisReference) {
        this.settings.yAxisReference = yAxisReference;
    };
    p.getYAxisReference = function () {
        return this.settings.yAxisReference;
    };
    p.setValueX1 = function (value) {
        value = Types.parseValue(value, 'number');
        this.settings.valueX1 = value;
        _renderValue(this.valueX1Elem, value, this.getFormatX());
    };
    p.getValueX1 = function () {
        return this.settings.valueX1;
    };
    p.setValueX2 = function (value) {
        value = Types.parseValue(value, 'number');
        this.settings.valueX2 = value;
        _renderValue(this.valueX2Elem, value, this.getFormatX());
    };
    p.getValueX2 = function () {
        return this.settings.valueX2;
    };
    p.setValueY1 = function (value) {
        value = Types.parseValue(value, 'number');
        this.settings.valueY1 = value;
        _renderValue(this.valueY1Elem, value, this.getFormatY());
    };
    p.getValueY1 = function () {
        return this.settings.valueY1;
    };
    p.setValueY2 = function (value) {
        value = Types.parseValue(value, 'number');
        this.settings.valueY2 = value;
        _renderValue(this.valueY2Elem, value, this.getFormatY());
    };
    p.getValueY2 = function () {
        return this.settings.valueY2;
    };
    p.onStyleChanged = function (e) {
        if (e.detail.type === 'Graph' && e.detail.name === this.name) {
            this.setColor(e.detail.data.lineColor);
        }
    };
    p.onGraphVisibleChanged = function (e) {
        var detail = e.detail;
        if (detail.name === this.name) {
            this.setVisible(e.detail.data.visible);
        }
    };
    p.onAxisReferenceChanged = function (e) {
        var detail = e.detail;
        if (detail.name === this.name) {
            this.setXAxisReference(detail.data.xAxisReference);
            this.setYAxisReference(detail.data.yAxisReference);
        }
    };
    p.onGraphCursorValueChanged = function (e) {
        var detail = e.detail,
            data = detail.data;
        if (detail.name === this.name) {
            for (var attribute in data) {
                var attributeName = _parseAttributeName(attribute);
                if (attributeMapping.has(attributeName)) {
                    this[attributeMapping.get(attributeName)](data[attribute].value);
                }
            }
        }
    };

    p.onAxisUnitChanged = function (e) {
        var axisName = e.detail.name;
        switch (e.detail.type) {
            case 'XAxis':
                if (axisName === this.getXAxisReference()) {
                    this.setUnitX(e.detail.data.unit);
                }
                break;
            case 'YAxis':
                if (axisName === this.getYAxisReference()) {
                    this.setUnitY(e.detail.data.unit);
                }
                break;
        }
    };

    p.onAxisFormatChanged = function (e) {
        var axisName = e.detail.name;
        switch (e.detail.type) {
            case 'XAxis':
                if (axisName === this.getXAxisReference()) {
                    this.setFormatX(e.detail.data.format);
                }
                break;
            case 'YAxis':
                if (axisName === this.getYAxisReference()) {
                    this.setFormatY(e.detail.data.format);
                }
                break;
        }
    };

    p.dispose = function () {
        this.initEvents(true);
    };

    function _renderValue(elem, value, format) {
        elem.innerText = typeof value === 'number'
            ? brease.formatter.formatNumber(value,
                format,
                undefined,
                brease.user.getSeparators()) : brease.settings.noValueString;
    }

    function _renderUnitCode(prefix, elem, unitCode) {
        brease.language.pipeAsyncUnitSymbol(unitCode, function (unitSymbol) {
            elem.innerText = prefix + (_.isEmpty(unitSymbol) ? '' : '[' + unitSymbol + ']');
        });
    }

    function _handleElemVisibility(elemX, elemY, visible) {
        elemX.classList.remove('remove');
        elemY.classList.remove('remove');
        if (visible === false) {
            elemX.classList.add('remove');
            elemY.classList.add('remove');
        }
    }

    function _initDom() {
        this.rowXElem = document.createElement('tr');
        this.unitXElem = document.createElement('th');
        this.unitXElem.innerText = 'X';
        this.valueX1Elem = document.createElement('td');
        this.valueX2Elem = document.createElement('td');
        this.rowXElem.appendChild(this.unitXElem);
        this.rowYElem = document.createElement('tr');
        this.unitYElem = document.createElement('th');
        this.unitYElem.innerText = 'Y';
        this.valueY1Elem = document.createElement('td');
        this.valueY2Elem = document.createElement('td');
        this.rowYElem.appendChild(this.unitYElem);
        this.rowElems = [this.rowXElem, this.rowYElem];
    }

    function _parseAttributeName(attribute) {
        return attribute.slice(attribute.lastIndexOf('].') + 2);
    }

    function _insertColumn(index) {
        var columnXElem = index === 0 ? this.valueX1Elem : this.valueX2Elem,
            columnYElem = index === 0 ? this.valueY1Elem : this.valueY2Elem,
            nextSibling = this.rowXElem.childNodes[index + 1];
        // passing null to insertBefore will add the node at the end of its parent
        this.rowXElem.insertBefore(columnXElem, nextSibling instanceof Node ? nextSibling : null);
        nextSibling = this.rowYElem.childNodes[index + 1];
        this.rowYElem.insertBefore(columnYElem, nextSibling instanceof Node ? nextSibling : null);
    }

    return CursorData;
});
