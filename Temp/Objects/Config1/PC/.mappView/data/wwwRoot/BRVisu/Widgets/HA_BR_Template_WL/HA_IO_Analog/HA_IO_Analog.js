define(['system/widgets/CompoundWidget/CompoundWidget', 'brease/core/Types', 'text!widgets/HA_BR_Template_WL/HA_IO_Analog/content/widgets.css'], function (SuperClass, Types, contentCSS) {

    'use strict';

    /**
    * @class widgets.HA_BR_Template_WL.HA_IO_Analog
    * @extends system.widgets.CompoundWidget
    * @requires widgets.brease.CheckBox
    * @requires widgets.brease.Label
    * @requires widgets.brease.NumericInput
    * @requires widgets.brease.NumericOutput
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
    * @cfg {Number} minValue=-100 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * minValue  
    */ 
    /** 
    * @cfg {Number} maxValue=100 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * maxValue  
    */ 
    /** 
    * @cfg {String} unit='{}' 
    * @iatStudioExposed 
    * @bindable 
    * @iatCategory Behavior 
    * Units  
    */ 
    /** 
    * @cfg {String} format='{}' 
    * @iatStudioExposed 
    * @bindable 
    * @iatCategory Behavior 
    * Format  
    */ 
    /** 
    * @cfg {HA_IO_Analog_Forcing_typ} HA_IO_Analog_Forcing_typ 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * Analog Forcing  
    */ 
    /** 
    * @cfg {HA_IO_Analog_Signal_typ} HA_IO_Analog_Signal_typ 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * Analog Signal  
    */ 

    var defaultSettings = {
            IO_Label: '$IAT/',
            minValue: -100,
            maxValue: 100,
            unit: '{}',
            format: '{}'
        },

        propertyMapping = {
            
            IO_Label: { 'IO_Label': 'text' }, 
            minValue: { 'IO_NumericInputForce': 'minValue' }, 
            maxValue: { 'IO_NumericInputForce': 'maxValue' }, 
            unit: { 'IO_NumericInputForce': 'unit', 'IO_NumericOutputIO': 'unit', 'IO_NumericOutputApp': 'unit' }, 
            format: { 'IO_NumericInputForce': 'format', 'IO_NumericOutputIO': 'format', 'IO_NumericOutputApp': 'format' }, 
            HA_IO_Analog_Forcing_typ: { 'IO_CheckBoxForceOff': 'value', 'IO_CheckBoxForceOn': 'value', 'IO_NumericInputForce': 'node' }, 
            HA_IO_Analog_Signal_typ: { 'IO_NumericOutputIO': 'node', 'IO_NumericOutputApp': 'node' }
        },

        WidgetClass = SuperClass.extend(function HA_IO_Analog() {
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
    p.setMinValue = function (value) { this.settings['minValue'] = value; this.setChildProps('minValue', value); };
    p.setMaxValue = function (value) { this.settings['maxValue'] = value; this.setChildProps('maxValue', value); };
    p.setUnit = function (value) { this.settings['unit'] = value; this.setChildProps('unit', value); };
    p.setFormat = function (value) { this.settings['format'] = value; this.setChildProps('format', value); };
    p.setHA_IO_Analog_Forcing_typ = function (value) { this.settings['HA_IO_Analog_Forcing_typ'] = value; this.setChildProps('HA_IO_Analog_Forcing_typ', value); };
    p.setHA_IO_Analog_Signal_typ = function (value) { this.settings['HA_IO_Analog_Signal_typ'] = value; this.setChildProps('HA_IO_Analog_Signal_typ', value); };

    return WidgetClass;

});
