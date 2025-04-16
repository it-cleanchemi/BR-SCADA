define(['system/widgets/CompoundWidget/CompoundWidget', 'brease/core/Types', 'text!widgets/HA_BR_Template_WL/HA_IO_Analog_Labels/content/widgets.css'], function (SuperClass, Types, contentCSS) {

    'use strict';

    /**
    * @class widgets.HA_BR_Template_WL.HA_IO_Analog_Labels
    * @extends system.widgets.CompoundWidget
    * @requires widgets.brease.Label
    * @requires widgets.brease.Line
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

        WidgetClass = SuperClass.extend(function HA_IO_Analog_Labels() {
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
