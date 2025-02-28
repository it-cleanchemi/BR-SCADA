define(['system/widgets/CompoundWidget/CompoundWidget', 'brease/core/Types', 'text!widgets/BuildVersionWidget/BuildVersionAdvanced/content/widgets.css'], function (SuperClass, Types, contentCSS) {

    'use strict';

    /**
    * @class widgets.BuildVersionWidget.BuildVersionAdvanced
    * @extends system.widgets.CompoundWidget
    * @requires widgets.brease.DateTimeOutput
    * @requires widgets.brease.Image
    * @requires widgets.brease.Label
    * @requires widgets.brease.TextOutput
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
    * @cfg {BuildVersionType} value 
    * @iatStudioExposed 
    * @iatCategory data 
    * Build version information  
    */ 

    var defaultSettings = {
        },

        propertyMapping = {
            
            value: { 'TextOutputAS': 'value', 'TextOutputUser': 'value', 'TextOutputProject': 'value', 'TextOutputConfiguration': 'value', 'TextOutputBuildMode': 'value', 'DateTimeOutputBuild': 'value', 'TextOutputBranch': 'value', 'TextOutputTag': 'value', 'TextOutputAddCommits': 'value', 'TextOutputSha1': 'value', 'TextOutputChanges': 'value', 'ImageWarning': 'visible', 'DateTimeOutputCommit': 'value', 'TextOutputCommitAuthor': 'value' }
        },

        WidgetClass = SuperClass.extend(function BuildVersionAdvanced() {
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
    p.setValue = function (value) { this.settings['value'] = value; this.setChildProps('value', value); };

    return WidgetClass;

});
