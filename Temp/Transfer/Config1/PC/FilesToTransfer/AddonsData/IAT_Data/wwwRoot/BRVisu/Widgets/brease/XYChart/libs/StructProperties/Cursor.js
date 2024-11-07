define([
    'brease/datatype/StructuredProperty',
    'brease/core/Types',
    'widgets/brease/XYChart/libs/XYChartEvents'
],
function (SuperClass, Types, ChartEvents) {
    'use strict';

    /**
    * @class widgets.brease.XYChart.Cursor
    * Defines appearance and behaviour of a Cursor
    * @extends brease.datatype.StructuredProperty
    * @embeddedClass
    * @virtualNote
    */

    /**
    * @cfg {Boolean} visible=true
    * @bindable
    * @iatStudioExposed
    * @iatCategory Behavior 
    * Defines the visibility of the cursor. (Visible = true, invisible = false)
    */

    /**
    * @cfg {StyleReference} style = 'default'
    * @iatStudioExposed
    * @iatCategory Appearance
    * @bindable
    * @typeRefId widgets.brease.XYChart.Cursor
    * Reference to a style that can be created by the user.
    */

    var defaultSettings = {
            visible: true,
            style: 'default',
            freezeMode: false
        },
        cursorStyleCollection = {
            cursorColor: {
                cssProp: 'color',
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
            }
        },
        styleElemCursor = document.createElement('DIV');

    styleElemCursor.classList.add('cursor');

    var Cursor = SuperClass.extend(function Cursor() {
            SuperClass.apply(this, arguments);
            this.settings.stylePrefix = this.settings.stylePrefix + '_' + this.constructor.name + '_style_';
            this.createStyleElem();
            this.internal = {};
        }, defaultSettings),

        p = Cursor.prototype;

    p.init = function (eventDispatcher, styleContainerElem) {
        this.eventDispatcher = eventDispatcher;
        this.initEvents();
        this.setStyle(this.settings.style);
        this.appendStyleElem(styleContainerElem);
        this.setVisible(this.settings.visible);
    };

    p.wake = function () {
        this.initEvents();
    };

    p.initEvents = function (remove) {
        var fn = remove ? 'removeEventListener' : 'addEventListener';
        this.eventDispatcher[fn](ChartEvents.UPDATE_STYLES, this._bind('updateStyleProperties'));
        this.eventDispatcher[fn](ChartEvents.THEME_CHANGED, this._bind('updateStyleProperties'));
        this.eventDispatcher[fn](ChartEvents.FREEZEMODE_CHANGED, this._bind('_updateFreezeMode'));
    };

    p.createStyleElem = function () {
        this.elem = styleElemCursor.cloneNode();
        this.elem.id = this.id;
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
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.CURSOR.DISPOSED, detail: { name: this.name, type: this.constructor.name } });
        SuperClass.prototype.dispose.apply(this, arguments);
    };

    p.setId = function (id) {
        var name = this.name;
        this.elem.id = id;
        SuperClass.prototype.setId.apply(this, arguments);
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.CURSOR.NAME_CHANGED, detail: { name: name, data: { name: this.name }, type: this.constructor.name } });
    };
    /**
    * @method setStyle
    * Sets new style to the property collection.
    * @param {StyleReference} value
    */
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
    /**
    * @method getStyle
    * returns the current style
    * @returns {StyleReference}
    */
    p.getStyle = function () {
        return this.settings.style;
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
    * @method setFreezeMode
    * @param {Boolean} value
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
    * @method toString
    * Creates readable string of structured property. (i.e cursor[id1])
    */
    p.toString = function () {
        return 'cursor[' + this.name + ']';
    };
    /**
    * @method attributeToString
    * Creates readable string of attribute. (i.e cursor[id1].node)
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
                var computedStyles = window.getComputedStyle(that.elem),
                    styles = {};
                that._applyStyleCollection(styles, cursorStyleCollection, computedStyles);
                that.eventDispatcher.dispatchEvent({ type: ChartEvents.STYLE_CHANGED, detail: { name: that.name, data: styles, type: that.constructor.name } });
                that.internal.animationFrame = null;
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

    p._updateFreezeMode = function (e) {
        this.setFreezeMode(Types.parseValue(e.detail.data.freezeMode, 'Boolean'));
    };

    function _publishVisibility() {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.CURSOR.VISIBLE_CHANGED, detail: { name: this.name, data: { visible: this.settings.visible }, type: this.constructor.name } });
    }

    return Cursor;
});
