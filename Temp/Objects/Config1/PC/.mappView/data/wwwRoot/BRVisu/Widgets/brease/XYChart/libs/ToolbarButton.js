define(function () {
    'use strict';
    /**
    * @class widgets.brease.XYChart.ToolbarButton
    * Defines a button inside of the Toolbar
    * @extends Object
    */
    /**
    * @method constructor
    */
    var ToolbarButton = function () {
            this.elem = document.createElement('DIV');
            this.el = $(this.elem);
            this.elem.classList.add('button');
            this.index = 0;
            this.name = '';
        },
        p = ToolbarButton.prototype;
    /**
    * @method setName
    * @param {String} name
    */
    p.setName = function (name) {
        this.elem.setAttribute('data-name', name);
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
    * @method setIndex
    * @param {Number} index
    */
    p.setIndex = function (index) {
        this.elem.setAttribute('data-index', index);
        this.index = index;
    };
    /**
    * @method getIndex
    * @returns {Number}
    */
    p.getIndex = function () {
        return this.index;
    };
    /**
    * @method setActive
    * @param {Boolean} active
    * used to highlight the button
    */
    p.setActive = function (active) {
        if (active && !this.isActive()) {
            this.elem.classList.add('active');
        } else if (!active && this.isActive()) {
            this.elem.classList.remove('active');
        }
    };
    /**
    * @method isActive
    * @returns {Boolean}
    * returns wether the button is active
    */
    p.isActive = function () {
        return this.elem.classList.contains('active');
    };
    /**
    * @method setVisible
    * @param {Boolean} visible
    * used to show/hide the button
    */
    p.setVisible = function (visible) {
        if (visible && !this.isVisible()) {
            this.elem.classList.remove('remove');
        } else if (!visible && this.isVisible()) {
            this.elem.classList.add('remove');
        }
    };
    /**
    * @method isVisible
    * @returns {Boolean} 
    * returns if the button is visible
    */
    p.isVisible = function () {
        return !this.elem.classList.contains('remove');
    };
    /**
    * @method setType
    * @param {String} type
    * used to set the type of the button (reset or cursor)
    */
    p.setType = function (type) {
        switch (type) {
            case 'reset':
            case 'cursorTable':
                this.elem.classList.add(type);
                break;
            default:
                this.elem.classList.add('cursor');
        }
    };
    /**
    * @method setColor
    * @param {String} color
    * used to set the color of the cursors
    */
    p.setColor = function (color) {
        this.elem.style['border-color'] = color;
    };
    /**
    * @method getColor
    * @returns {String}
    */
    p.getColor = function () {
        return this.elem.style['border-color'];
    };
    p.dispose = function () {
        this.el.off();
        this.el = null;
        this.elem = null;
    };

    return ToolbarButton;
});
