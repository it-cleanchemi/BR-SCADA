define(['system/widgets/CompoundWidget/CompoundWidget', 'brease/core/Types', 'text!widgets/HA_BR_Template_WL/HA_IO_Digital/content/widgets.css'], function (SuperClass, Types, contentCSS) {

    'use strict';

    /**
    * @class widgets.HA_BR_Template_WL.HA_IO_Digital
    * @extends system.widgets.CompoundWidget
    * @requires widgets.brease.CheckBox
    * @requires widgets.brease.Ellipse
    * @requires widgets.brease.Label
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
    * @cfg {String} IO_Label='$IAT/' 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * IO Label  
    */ 
    /** 
    * @cfg {HA_IO_Digital_Forcing_typ} HA_IO_Digital_Forcing_typ 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * Digital Forcing  
    */ 
    /** 
    * @cfg {HA_IO_Digital_Signal_typ} HA_IO_Digital_Signal_typ 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * Digital Signal  
    */ 

    var defaultSettings = {
            IO_Label: '$IAT/'
        },

        propertyMapping = {
            
            IO_Label: { 'IO_Label': 'text' }, 
            HA_IO_Digital_Forcing_typ: { 'IO_CheckBoxForceOff': 'value', 'IO_CheckBoxForceOn': 'value' }, 
            HA_IO_Digital_Signal_typ: { 'IO_EllipseIOMapping': 'enable', 'IO_EllipseFiltered': 'enable', 'IO_Label': 'enable' }
        },

        WidgetClass = SuperClass.extend(function HA_IO_Digital() {
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
    p.setIO_Label = function (value) { this.settings['IO_Label'] = value; this.setChildProps('IO_Label', value); };
    p.setHA_IO_Digital_Forcing_typ = function (value) { this.settings['HA_IO_Digital_Forcing_typ'] = value; this.setChildProps('HA_IO_Digital_Forcing_typ', value); };
    p.setHA_IO_Digital_Signal_typ = function (value) { this.settings['HA_IO_Digital_Signal_typ'] = value; this.setChildProps('HA_IO_Digital_Signal_typ', value); };

    return WidgetClass;

});
