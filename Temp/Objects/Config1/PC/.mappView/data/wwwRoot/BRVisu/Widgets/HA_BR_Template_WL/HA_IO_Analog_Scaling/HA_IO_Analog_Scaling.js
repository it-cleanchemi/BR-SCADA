define(['system/widgets/CompoundWidget/CompoundWidget', 'brease/core/Types', 'text!widgets/HA_BR_Template_WL/HA_IO_Analog_Scaling/content/widgets.css'], function (SuperClass, Types, contentCSS) {

    'use strict';

    /**
    * @class widgets.HA_BR_Template_WL.HA_IO_Analog_Scaling
    * @extends system.widgets.CompoundWidget
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
    * @cfg {String} unit='{}' 
    * @iatStudioExposed 
    * @bindable 
    * @iatCategory Behavior 
    * Units  
    */ 
    /** 
    * @cfg {HA_IO_Analog_Par_typ} HA_IO_Analog_Par_typ 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * Analog Par  
    */ 
    /** 
    * @cfg {HA_IO_Analog_Signal_typ} HA_IO_Analog_Signal_typ 
    * @iatStudioExposed 
    * @iatCategory Behavior 
    * Analog Signal  
    */ 

    var defaultSettings = {
            IO_Label: '$IAT/',
            unit: '{}'
        },

        propertyMapping = {
            
            IO_Label: { 'IO_Label': 'text' }, 
            unit: { 'IO_NumericInputSlope': 'unit', 'IO_NumericInputIntercept': 'unit', 'IO_NumericInputMin': 'unit', 'IO_NumericInputMax': 'unit', 'IO_NumericOutputApp': 'unit' }, 
            HA_IO_Analog_Par_typ: { 'IO_NumericInputSlope': 'node', 'IO_NumericInputIntercept': 'node', 'IO_NumericInputFilter': 'node', 'IO_NumericInputMin': 'node', 'IO_NumericInputMax': 'node' }, 
            HA_IO_Analog_Signal_typ: { 'IO_NumericOutputRaw': 'node', 'IO_NumericOutputApp': 'node' }
        },

        WidgetClass = SuperClass.extend(function HA_IO_Analog_Scaling() {
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
    p.setUnit = function (value) { this.settings['unit'] = value; this.setChildProps('unit', value); };
    p.setHA_IO_Analog_Par_typ = function (value) { this.settings['HA_IO_Analog_Par_typ'] = value; this.setChildProps('HA_IO_Analog_Par_typ', value); };
    p.setHA_IO_Analog_Signal_typ = function (value) { this.settings['HA_IO_Analog_Signal_typ'] = value; this.setChildProps('HA_IO_Analog_Signal_typ', value); };

    return WidgetClass;

});
