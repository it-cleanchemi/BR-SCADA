define(['system/widgets/CompoundWidget/CompoundWidget', 'brease/core/Types', 'text!widgets/HA_BR_Template_WL/HA_IO_Header/content/widgets.css'], function (SuperClass, Types, contentCSS) {

    'use strict';

    /**
    * @class widgets.HA_BR_Template_WL.HA_IO_Header
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

    /** 
    * @cfg {String} HeaderText='$IAT/' 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * text  
    */ 

    var defaultSettings = {
            HeaderText: '$IAT/'
        },

        propertyMapping = {
            
            HeaderText: { 'Label_Header': 'text' }
        },

        WidgetClass = SuperClass.extend(function HA_IO_Header() {
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
    p.setHeaderText = function (value) { this.settings['HeaderText'] = value; this.setChildProps('HeaderText', value); };

    return WidgetClass;

});
