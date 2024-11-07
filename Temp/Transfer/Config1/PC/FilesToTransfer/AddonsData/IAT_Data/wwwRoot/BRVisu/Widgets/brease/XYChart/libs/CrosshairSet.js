define(['widgets/brease/XYChart/libs/Crosshair'], function (Crosshair) {
    'use strict';
    /**
    * @class widgets.brease.XYChart.CrosshairSet
    * Defines a set of Crosshairs for each graph
    * @extends Object
    */
    /**
    * @method constructor
    */
    var CrosshairSet = function ($wrapper) {
            this.name = '';
            this.crosshairs = new Map();
            this.el = $wrapper;
            this.index = 0;
            this.color = '';
            this.visible = true; // visible attribute defined by property collection cursor
            this.active = false;
            this.enabled = false; // true if chart is frozen and enabled
        },
        p = CrosshairSet.prototype;

    /**
    * @method setName
    * @param {String} name
    */
    p.setName = function (name) {
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
    * @param {Number} name
    * set the data index of crosshair set
    */
    p.setIndex = function (index) {
        this.index = index;
    };
    /**
    * @method getIndex
    * @returns {Number} name
    * get data index of crosshair set
    */
    p.getIndex = function () {
        return this.index;
    };
    /**
     * @method addCrosshair
     * @param {String} name
     */
    p.addCrosshair = function (name) {
        var crosshair = new Crosshair();
        crosshair.setName(this.name + '_' + name);
        crosshair.setColor(this.getColor());
        this.crosshairs.set(name, crosshair);
    };
    /**
    * @method hasCrosshair
    * @param {String} name
    */
    p.hasCrosshair = function (name) {
        return this.crosshairs.has(name);
    };
    /**
     * @method enable
     * Add crosshairs to wrapper element
     */
    p.enable = function () {
        this.enabled = true;
        this.crosshairs.forEach(function (crosshair, name) {
            this.enableCrosshair(name);
        }, this);
    };
    /**
     * @method disable
     * Detach crosshairs from wrapper
     */
    p.disable = function () {
        this.enabled = false;
        this.crosshairs.forEach(function (crosshair, name) {
            this.disableCrosshair(name);
        }, this);
    };
    p.isEnabled = function () {
        return this.enabled === true;
    };
    /**
     * @method enableCrosshair
     * @param {String} name
     *  Add specific crosshairs to wrapper element
     */
    p.enableCrosshair = function (name) {
        if (this.isVisible() && this.isEnabled() && this.crosshairs.has(name)) {
            this.crosshairs.get(name).append(this.el);
        }
    };
    /**
     * @method disableCrosshair
     * @param {String} name
     *  Detach specific crosshairs from wrapper element
     */
    p.disableCrosshair = function (name) {
        if (this.crosshairs.has(name)) {
            this.crosshairs.get(name).detach();
        }
    };
    /**
     * @method setActive
     * @param {Boolean} active 
     */
    p.setActive = function (active) {
        this.active = active;
    };
    /**
     * @method isActive
     * @returns {Boolean} 
     */
    p.isActive = function () {
        return this.active;
    };
    /**
    * @method setVisible
    * @param {Boolean} visible
    * used to show/hide the set of crosshairs
    */
    p.setVisible = function (visible) {
        var fn = visible ? 'enableCrosshair' : 'disableCrosshair';
        this.visible = visible;
        this.crosshairs.forEach(function (crosshair, name) {
            this[fn](name);
        }, this);
    };
    /**
    * @method isVisible
    * @returns {Boolean} 
    * used to show/hide the crosshairs
    */
    p.isVisible = function () {
        return this.visible === true;
    };
    /**
    * @method setCrosshairVisible
    * @param {String} name
    * @param {Boolean} visible
    * used to show/hide a specific crosshairs depending on the 
    * graph visibility
    */
    p.setCrosshairVisible = function (name, visible) {
        this.crosshairs.get(name).setVisible(visible);
    };
    /**
    * @method setPoint
    * @param {String} name
    * @param {Object} point
    * @param {Number} point.X
    * @param {Number} point.Y
    * sets the point for the cursor location
    */
    p.setPoint = function (name, point) {
        this.crosshairs.get(name).setPoint(point);
    };
    /**
    * @method getPoint
    * @param {String} name
    * @returns {Object} 
    * @returns {Number} return.X
    * @returns {Number} return.Y
    * returns the point for the cursor location
    */
    p.getPoint = function (name) {
        return this.crosshairs.get(name).getPoint();
    };
    /**
    * @method setColor
    * @param {String} color
    * used to set the color of the cursor
    */
    p.setColor = function (color) {
        this.color = color;
        this.crosshairs.forEach(function (crosshair) {
            crosshair.setColor(color);
        }, this);
    };
    /**
    * @method getColor
    * @returns {String}
    */
    p.getColor = function () {
        return this.color;
    };
    p.dispose = function () {
        this.crosshairs.forEach(function (crosshair) {
            crosshair.dispose();
        }, this);
        this.crosshairs.clear();
    };

    return CrosshairSet;
});
