define([
    'widgets/brease/XYChart/libs/StructProperties/YAxis',
    'brease/core/Types',
    'brease/enum/Enum',
    'brease/core/Utils',
    'widgets/brease/XYChart/libs/XYChartEvents'
], function (SuperClass, Types, Enum, Utils, ChartEvents) {
    'use strict';

    /**
    * @class widgets.brease.XYChart.XAxis
    * Defines appearance and behaviour of a XAxis
    * @extends widgets.brease.XYChart.YAxis
    * @embeddedClass
    * @virtualNote
    */

    /**
    * @cfg {brease.enum.VerticalAlign} position = 'bottom'
    * @iatStudioExposed
    * @iatCategory Appearance
    * Defines weather the axis is positioned at the top or bottom in the chart.
    */

    /**
    * @cfg {StyleReference} style = 'default'
    * @iatStudioExposed
    * @iatCategory Appearance
    * @bindable
    * @typeRefId widgets.brease.XYChart.XAxis
    * Reference to a style that can be created by the user.
    */

    var defaultSettings = {
            position: Enum.VerticalAlign.bottom
        },
        styleElemXAxis = document.createElement('DIV'),
        styleElemTitle = document.createElement('SPAN');

    styleElemXAxis.appendChild(styleElemTitle);
    styleElemXAxis.classList.add('.xAxis');

    var XAxis = SuperClass.extend(function XAxis() {
            SuperClass.apply(this, arguments);
        }, defaultSettings),
        p = XAxis.prototype;

    /**
    * @method getRangeChangeEvent
    * Returns the event to subscribe for changes in the range of a graph if rangeMode is fromSource.
    * Needs to be overloaded 
    * @return {String} eventname
    */
    p.getRangeChangeEvent = function () {
        return ChartEvents.GRAPH.RANGE_X_CHANGED;
    };

    p.createStyleElem = function () {
        this.elem = styleElemXAxis.cloneNode(true);
        this.elem.id = this.id;
    };

    p.setPosition = function (value) {
        this.settings.position = Types.parseValue(value, 'Enum', { Enum: Enum.VerticalAlign, default: Enum.VerticalAlign.bottom });
        this.eventDispatcher.dispatchEvent({
            type: ChartEvents.AXIS.POSITION_CHANGED,
            detail: {
                name: this.name,
                data: { position: value },
                type: this.constructor.name
            }
        });
    };

    /**
     * @method toString
     * Creates readable string of structured property. (i.e xAxis[id1])
    */
    p.toString = function () {
        return 'xAxis[' + this.name + ']';
    };

    return XAxis;
});
