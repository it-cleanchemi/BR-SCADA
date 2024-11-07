define([
    'brease/datatype/StructuredProperty',
    'brease/core/Types',
    'brease/config/NumberFormat',
    'brease/enum/Enum',
    'brease/core/Utils',
    'widgets/brease/XYChart/libs/XYChartEvents'
], function (SuperClass, Types, NumberFormat, Enum, Utils, ChartEvents) {
    'use strict';

    /**
    * @class widgets.brease.XYChart.YAxis
    * Defines appearance and behaviour of a YAxis
    * @extends brease.datatype.StructuredProperty
    * @embeddedClass
    * @virtualNote
    */

    /**
    * @cfg {brease.enum.HorizontalAlign} position = 'left'
    * @iatStudioExposed
    * @iatCategory Appearance
    * Defines weather the axis is positioned left or right in the chart.
    */

    /**
     * @cfg {brease.config.MeasurementSystemUnit} unit=''
     * @iatStudioExposed
     * @bindable
     * @iatCategory Appearance
     * Unit code for every measurement system.
     */

    /**
     * @cfg {brease.enum.RangeMode} rangeMode='autoscale'
     * @iatStudioExposed
     * @iatCategory Behavior
     * Defines how the range is drawn. If rangeMode fromConfiguration is used the range is static and will not be converted!
     */

    /**
    * @cfg {Number} min=0
    * @iatStudioExposed
    * @bindable
    * @iatCategory Behavior
    * Defines the minimum range if rangeMode is set to fromConfiguration. This value has no unit and will not be converted!
    */

    /**
    * @cfg {Number} max=100
    * @iatStudioExposed
    * @bindable
    * @iatCategory Behavior
    * Defines the maximum range if rangeMode is set to fromConfiguration. This value has no unit and will not be converted!
    */

    /**
     * @cfg {brease.config.MeasurementSystemFormat} format= {'metric':{ 'decimalPlaces' : 1, 'minimumIntegerDigits' : 1 }, 'imperial' :{ 'decimalPlaces' : 1, 'minimumIntegerDigits' : 1 }, 'imperial-us' :{ 'decimalPlaces' : 1, 'minimumIntegerDigits' : 1 }} 
     * @iatStudioExposed
     * @bindable
     * @iatCategory Appearance
     * NumberFormat for every measurement system.
     * Defines the number format of the labels.
     */

    /**
     * @cfg {Boolean} showUnit = true
     * @iatStudioExposed
     * @iatCategory Appearance
     * Defines whether the unit should be displayed.
     */

    /**
     * @cfg {String} title = ''
     * @iatStudioExposed
     * @localizable
     * @iatCategory Appearance
     * Title of axis.
     */

    /**
    * @cfg {Boolean} visible = true
    * @iatStudioExposed
    * @iatCategory Behavior
    * @bindable
    * Defines the visibility of the graph. (Visible = true, invisible = false)
    */

    /**
    * @cfg {StyleReference} style = 'default'
    * @iatStudioExposed
    * @iatCategory Appearance
    * @bindable
    * @typeRefId widgets.brease.XYChart.YAxis
    * Reference to a style that can be created by the user.
    */

    /**
    * @cfg {UInteger} numberOfTicks = 5
    * @iatStudioExposed
    * @iatCategory Appearance
    * @bindable
    * @typeRefId widgets.brease.XYChart.YAxis
    * Reference to a style that can be created by the user.
    */

    var defaultSettings = {
            position: Enum.HorizontalAlign.left,
            title: '',
            showUnit: true,
            rangeMode: Enum.RangeMode.autoscale,
            min: 0,
            max: 100,
            numberOfTicks: 5,
            visible: true,
            enable: true,
            unit: {},
            format: {
                'metric': { decimalPlaces: 1, minimumIntegerDigits: 1 },
                'imperial': { decimalPlaces: 1, minimumIntegerDigits: 1 },
                'imperial-us': { 'decimalPlaces': 1, 'minimumIntegerDigits': 1 }
            },
            style: 'default'
        },
        axisStyleCollection = {
            textColor: {
                cssProp: 'color',
                parseValue: function (value) {
                    return value;
                }
            },
            color: {
                cssProp: 'background-color',
                parseValue: function (value) {
                    return value;
                }
            },
            gridColor: {
                cssProp: 'border-color',
                parseValue: function (value) {
                    return value;
                }
            },
            fontSize: {
                cssProp: 'font-size',
                parseValue: function (value) {
                    return value;
                }
            },
            fontName: {
                cssProp: 'font-family',
                parseValue: function (value) {
                    return value;
                }
            },
            tickLabelRotation: {
                cssProp: 'transform',
                parseValue: function (value) {
                    var matches = [];
                    matches = value.match(/[-]?\d+(?:\.\d+)?/g);
                    return matches === null ? '0' : Math.round(Math.atan2(matches[1], matches[0]) * (180 / Math.PI));
                }
            }
        },
        titleStyleCollection = {
            titleTextColor: {
                cssProp: 'color',
                parseValue: function (value) {
                    return value;
                }
            },
            titleFontSize: {
                cssProp: 'font-size',
                parseValue: function (value) {
                    return value;
                }
            },
            titleFontName: {
                cssProp: 'font-family',
                parseValue: function (value) {
                    return value;
                }
            }
        },
        styleElemYAxis = document.createElement('DIV'),
        styleElemTitle = document.createElement('SPAN');

    styleElemYAxis.appendChild(styleElemTitle);
    styleElemYAxis.classList.add('.yAxis');

    var YAxis = SuperClass.extend(function YAxis(id) {
            SuperClass.apply(this, arguments);
            this.settings.stylePrefix = this.settings.stylePrefix + '_' + this.constructor.name + '_style_';
            this.createStyleElem(id);
            this.internal = {};
            this.data = new Map();
        }, defaultSettings),

        p = YAxis.prototype;

    p.init = function (eventDispatcher, styleContainerElem) {
        this.eventDispatcher = eventDispatcher;
        this.initEvents();
        this.setStyle(this.settings.style);
        this.appendStyleElem(styleContainerElem);
        this.setPosition(this.settings.position);
        this.setUnit(this.settings.unit);
        this.setTitle(this.settings.title);
        this.setVisible(this.settings.visible);
        this.setRangeMode(this.settings.rangeMode);
        this.setFormat(this.settings.format);
        this.setNumberOfTicks(this.settings.numberOfTicks);
    };

    p.wake = function () {
        this.initEvents();
    };

    p.initEvents = function (remove) {
        var fn = remove ? 'removeEventListener' : 'addEventListener';
        this.eventDispatcher[fn](ChartEvents.UPDATE_STYLES, this._bind('updateStyleProperties'));
        this.eventDispatcher[fn](ChartEvents.THEME_CHANGED, this._bind('updateStyleProperties'));
        this.eventDispatcher[fn](ChartEvents.MEASUREMENTSYSTEM_CHANGED, this._bind('msSystemChangedHandler'));
        this.eventDispatcher[fn](ChartEvents.LANGUAGE_CHANGED, this._bind('languageChangedHandler'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.VISIBLE_CHANGED, this._bind('onGraphVisibleChanged'));
        this.eventDispatcher[fn](this.getRangeChangeEvent(), this._bind('onGraphRangeChanged'));
    };

    /**
    * @method getRangeChangeEvent
    * Returns the event to subscribe for changes in the range of a graph if rangeMode is fromSource.
    * Needs to be overloaded in the XAxis
    * @return {String} eventname
    */
    p.getRangeChangeEvent = function () {
        return ChartEvents.GRAPH.RANGE_Y_CHANGED;
    };

    p.createStyleElem = function (id) {
        this.elem = styleElemYAxis.cloneNode(true);
        this.elem.id = id;
    };

    p.suspend = function () {
        this.initEvents(true);
    };

    p.dispose = function () {
        window.cancelAnimationFrame(this.internal.animationFrame);
        this.internal.animationFrame = null;
        this.initEvents(true);
        if (this.elem) {
            this.elem.remove();
            this.elem = null;
        }
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.AXIS.DISPOSED, detail: { name: this.name, type: this.constructor.name } });
        SuperClass.prototype.dispose.apply(this, arguments);
    };

    p.setId = function (id) {
        var name = this.name;
        this.elem.id = id;
        SuperClass.prototype.setId.apply(this, arguments);
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.AXIS.NAME_CHANGED, detail: { name: name, data: { name: this.name }, type: this.constructor.name } });
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

    p.updateStyleProperties = function () {
        var that = this;
        if (!this.internal.animationFrame) {
            this.internal.animationFrame = window.requestAnimationFrame(function () {
                that.internal.animationFrame = null;
                var computedStyles = window.getComputedStyle(that.elem),
                    computedTitleStyles = window.getComputedStyle(that.elem.querySelector('span')),
                    styles = {};
                that._applyStyleCollection(styles, axisStyleCollection, computedStyles);
                that._applyStyleCollection(styles, titleStyleCollection, computedTitleStyles);
    
                that.eventDispatcher.dispatchEvent({
                    type: ChartEvents.STYLE_CHANGED,
                    detail: {
                        name: that.name,
                        data: styles,
                        type: that.constructor.name
                    }
                });
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

    p.setVisible = function (value) {
        this.settings.visible = Types.parseValue(value, 'Boolean');
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.AXIS.VISIBLE_CHANGED,
            detail: {
                name: this.name,
                data: { visible: value },
                type: this.constructor.name
            }
        });
    };

    p.getVisible = function () {
        return this.settings.visible;
    };

    p.setPosition = function (value) {
        this.settings.position = Types.parseValue(value, 'Enum', { Enum: Enum.HorizontalAlign, default: Enum.HorizontalAlign.left });
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.AXIS.POSITION_CHANGED,
            detail: {
                name: this.name,
                data: { position: value },
                type: this.constructor.name
            }
        });
    };

    p.getPosition = function () {
        return this.settings.position;
    };

    p.setRangeMode = function (value) {
        this.settings.rangeMode = Types.parseValue(value, 'Enum', { Enum: Enum.RangeMode, default: Enum.RangeMode.autoscale });
        _publishRange.call(this);
    };

    p.getRangeMode = function () {
        return this.settings.rangeMode;
    };

    p.setMin = function (value) {
        this.settings.min = Types.parseValue(value, 'Number', { default: 0 });
        _publishRange.call(this);
    };

    p.getMin = function () {
        return this.settings.min;
    };

    p.setMax = function (value) {
        this.settings.max = Types.parseValue(value, 'Number', { default: 100 });
        _publishRange.call(this);
    };

    p.getMax = function () {
        return this.settings.max;
    };

    p.setNumberOfTicks = function (value) {
        this.settings.numberOfTicks = Types.parseValue(value, 'Integer', { min: 0, default: 5 });
        _publishRange.call(this);
    };

    p.getNumberOfTicks = function () {
        return this.settings.numberOfTicks;
    };

    p.setTitle = function (title) {
        this.settings.title = Types.parseValue(title, 'String', { default: '' });
        this._updateTitle();
    };

    p.getTitle = function () {
        return this.settings.title;
    };

    p._updateTitle = function () {
        var formattedTitle = this.getFormattedTitle(),
            unitSymbol = this.settings.showUnit ? this.getUnitSymbol() : '',
            displayTitle = unitSymbol.length > 0 ? formattedTitle + ' [' + unitSymbol + ']' : formattedTitle;

        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.AXIS.TITLE_CHANGED,
            detail: {
                name: this.name,
                data: { title: displayTitle },
                type: this.constructor.name
            }
        });
    };
    /**
    * @method getFormattedTitle
    * Returns the formatted title. 
    * @return {String}
    */
    p.getFormattedTitle = function () {
        var title = this.settings.title;
        if (brease.language.isKey(title)) {
            var textKey = brease.language.parseKey(title),
                text = brease.language.getTextByKey(textKey);
            if (text !== brease.config.undefinedTextReturnValue) {
                title = text;
            } else {
                console.iatWarn(this.getId() + ': Format textKey not found: ' + title);
            }
        }
        return title;
    };

    p.setUnit = function (unit) {
        if (typeof unit === 'string') {
            this.settings.unit = unit.length > 0 ? JSON.parse(unit.replace(/'/g, '"')) : {};
        } else {
            this.settings.unit = unit;
        }
        this._updateUnit();
    };

    p._updateUnit = function () {
        if (_.isEmpty(this.settings.unit)) {
            return;
        }
        var actualUnit = this.getCurrentUnit();

        if (this.internal.previousUnitCode !== actualUnit) {
            var that = this;
            brease.language.pipeAsyncUnitSymbol(actualUnit, function (symbol) {
                that.internal.unitSymbol = symbol;
                that.setTitle(that.settings.title);
            });
            this.eventDispatcher.dispatchEvent({
                type: ChartEvents.AXIS.UNIT_CHANGED,
                detail: {
                    name: this.name,
                    data: { unit: actualUnit },
                    type: this.constructor.name
                }
            });
        }
        this.internal.previousUnitCode = actualUnit;
    };

    p.getCurrentUnit = function () {
        return this.settings.unit[brease.measurementSystem.getCurrentMeasurementSystem()];
    };

    p.getUnit = function () {
        return this.settings.unit;
    };
    /**
    * @method getUnitSymbol
    * Returns the current unit symbol
    * @return {String}
    */
    p.getUnitSymbol = function () {
        var unitSymbol = this.internal.unitSymbol;
        return brease.config.editMode ? 'unit' : typeof unitSymbol === 'string' ? unitSymbol : '';
    };

    p.setFormat = function (format) {
        this.settings.format = format;
        this._updateFormat();
    };

    p._updateFormat = function () {
        var mms = brease.measurementSystem.getCurrentMeasurementSystem(),
            numberFormat = NumberFormat.getFormat(this.parseFormat(), mms);

        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.AXIS.FORMAT_CHANGED,
            detail: {
                name: this.name,
                data: { format: numberFormat },
                type: this.constructor.name
            }
        });
    };

    p.getFormat = function () {
        return this.settings.format;
    };
    /**
    * @method parseFormat
    * Returns the parsed format
    * @return {Object}
    */
    p.parseFormat = function () {
        var format = this.settings.format,
            formatObject = {};
        if (Utils.isObject(format)) {
            formatObject = format;
        } else if (typeof (format) === 'string') {
            formatObject = this.parseFormatText(format);
        }
        return formatObject;
    };
    /**
    * @method parseFormatText
    * Returns the parsed format if a textkey is used
    * @param {String} format
    * @return {Object}
    */
    p.parseFormatText = function (format) {
        var lang = brease.language;
        try {
            return lang.isKey(format) ? JSON.parse(lang.getTextByKey(lang.parseKey(format)).replace(/'/g, '"')) : JSON.parse(format.replace(/'/g, '"'));
        } catch (error) {
            console.iatWarn(this.getId() + ': Format String "' + format + '" is invalid!');
            return {};
        }
    };

    p.setShowUnit = function (showUnit) {
        this.settings.showUnit = Types.parseValue(showUnit, 'Boolean', { default: true });
        this._updateTitle();
    };

    p.getShowUnit = function () {
        return this.settings.showUnit;
    };

    p.hasUnit = function () {
        return !_.isEmpty(this.settings.unit);
    };

    p.msSystemChangedHandler = function () {
        this._updateFormat();
        this._updateUnit();
    };

    p.languageChangedHandler = function () {
        // would only be necessary if they have text key: event is dispatched unnecessarily @ the moment
        this._updateFormat();
        this.setTitle(this.settings.title);
    };

    /**
     * @method toString
     * Creates readable string of structured property. (i.e yAxis[id1])
    */
    p.toString = function () {
        return 'yAxis[' + this.name + ']';
    };
    /**
     * @method attributeToString
     * Creates readable string of attribute. (i.e yAxis[id1].node)
    */
    p.attributeToString = function (name) {
        return this.toString() + '.' + name;
    };

    p.appendStyleElem = function (styleContainerElem) {
        if (styleContainerElem !== null) {
            styleContainerElem.appendChild(this.elem);
        }
    };

    /**
    * @method onGraphRangeChanged
    * Called when the range of an associated graph changes. 
    * Used for rangeMode = fromSource
    */
    p.onGraphRangeChanged = function (e) {
        var data = e.detail.data;
        if (data.axisReference === this.name) {
            this.data.set(e.detail.name, data.range);
            _publishRange.call(this);
        }
    };

    /**
    * @method onGraphVisibleChanged
    * Called when the visibility of a graph has been changed in order to 
    * publish the ranges
    * Used for rangeMode = fromSource
    */
    p.onGraphVisibleChanged = function (e) {
        if (this.data.has(e.detail.name)) {
            _publishRange.call(this);
        }
    };

    /**
    * @method getRanges
    * returns the range for every assigned graph
    * @return {Array} ranges
    */
    p.getRanges = function () {
        var ranges = [];
        this.data.forEach(function (data, name) {
            ranges.push({ min: data.min, max: data.max, name: name });
        });
        return ranges;
    };

    function _publishRange() {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.AXIS.RANGE_CHANGED, detail: { name: this.name, data: { rangeMode: this.getRangeMode(), numberOfTicks: this.getNumberOfTicks(), min: this.getMin(), max: this.getMax(), ranges: this.getRanges() }, type: this.constructor.name } });
    }

    return YAxis;
});
