define(['system/widgets/CompoundWidget/CompoundWidget', 'brease/core/Types', 'text!widgets/widgetlibrary_1/BufferTank/content/widgets.css'], function (SuperClass, Types, contentCSS) {

    'use strict';

    /**
    * @class widgets.widgetlibrary_1.BufferTank
    * @extends system.widgets.CompoundWidget
    * @requires widgets.brease.Ellipse
    * @requires widgets.brease.Line
    * @requires widgets.brease.ProgressBar
    * @requires widgets.brease.TextOutput
    * @requires widgets.widgetlibrary_1.Rectangle
    *
    * @iatMeta category:Category
    * Compound
    * @iatMeta description:short
    * CompoundWidget
    * @iatMeta description:de
    * CompoundWidget
    * @iatMeta description:en
    * CompoundWidget
    */

    
    var defaultSettings = {
        },

        propertyMapping = {
            
        },

        WidgetClass = SuperClass.extend(function BufferTank() {
            SuperClass.apply(this, arguments);
        }, defaultSettings),

        p = WidgetClass.prototype;
    WidgetClass.static.contentCSS = contentCSS;

    p.init = function () {
        this.initMapping(propertyMapping);
        SuperClass.prototype.init.call(this);
    };

    p.setInitialValues = function () {
        
    };

    return WidgetClass;

});