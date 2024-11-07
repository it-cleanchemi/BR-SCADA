define(function () {
    'use strict';
    /**
    * @class widgets.brease.XYChart.Crosshair
    * Defines the visible indicator for the current intersection point 
    * of a graph
    * @extends Object
    */
    /**
    * @method constructor
    */
    var Crosshair = function () {
            this.elem = document.createElement('DIV');
            this.el = $(this.elem);
            this.elem.classList.add('crosshair');
            this.index = -1;
            this.name = '';
            this.valid = false;
            this.point = {
                X: 0,
                Y: 0
            };
        },
        p = Crosshair.prototype;
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
    * @method setVisible
    * @param {Boolean} visible
    * used to show/hide the crosshair 
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
    * returns if the crosshair is visible
    */
    p.isVisible = function () {
        return !this.elem.classList.contains('remove');
    };
    /**
    * @method append
    * @param {jQuery} parentEl
    */
    p.append = function (parentEl) {
        if (this.isValid()) {
            parentEl.append(this.el);
        }
    };
    /**
    * @method detach
    */
    p.detach = function () {
        this.el.detach();
    };
    /**
    * @method setPoint
    * @param {Object} point
    * @param {Number} point.X
    * @param {Number} point.Y
    * sets the point for the cursor location
    */
    p.setPoint = function (point) {
        if (!point) {
            this.valid = false;
            return;
        } else {
            this.valid = true;
        }
        this.point.X = point.X ? point.X : 0;
        this.point.Y = point.Y ? point.Y : 0;
        this.el.css({
            'left': this.point.X,
            'top': this.point.Y
        });

    };
    /**
    * @method getPoint
    * @returns {Object} 
    * @returns {Number} return.X
    * @returns {Number} return.Y
    * returns the point for the cursor location
    */
    p.getPoint = function () {
        return this.point;
    };
    /**
    * @method setColor
    * @param {String} color
    * used to set the color of the cursor
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
    /**
    * @method isValid
    * @returns {Boolean}
    * returns true if the crosshair contains valid data
    */
    p.isValid = function () {
        return this.valid === true;
    };
    p.dispose = function () {
        this.el.remove();
        this.el = null;
        this.elem = null;
    };

    return Crosshair;
});
