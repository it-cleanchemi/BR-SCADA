define(['system/widgets/CompoundWidget/CompoundWidget', 'brease/core/Types', 'text!widgets/widgetlibrary_1/compoundwidget_0/content/widgets.css'], function (SuperClass, Types, contentCSS) {

    'use strict';

    /**
    * @class widgets.widgetlibrary_1.compoundwidget_0
    * @extends system.widgets.CompoundWidget
    * @requires widgets.brease.Ellipse
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

        WidgetClass = SuperClass.extend(function compoundwidget_0() {
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
