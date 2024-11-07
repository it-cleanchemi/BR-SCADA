define([], function () {

    'use strict';

    /**
     * @class widgets.brease.XYChart.libs.config.Config
     * @extends core.javascript.Object
     * @override widgets.brease.XYChart
     */

    /**
     * @cfg {UInteger} updateChartTime = 1000
     * Interval in ms in which the chart is redrawn.
     * @bindable
     * @iatStudioExposed
     * @iatCategory Behavior
     */

    /**
     * @cfg {brease.enum.ChartZoomType} zoomType = 'xy'
     * Defines for which axes zooming should be possible.
     * @iatStudioExposed
     * @iatCategory Behavior
     * @bindable
     */

    /**
    * @cfg {widgets.brease.XYChart.Graph} graph={}
    * @iatStudioExposed
    * @iatCategory Collections
    * Defines appearance and behaviour of the graph instances
    * @iatMeta StructuredProperty:true
    * @iatMeta minSize:1
    * @iatMeta maxSize:32
    */

    /**
    * @cfg {widgets.brease.XYChart.XAxis} xAxis={}
    * @iatStudioExposed
    * @iatCategory Collections
    * Defines appearance and behaviour of the xAxis instances
    * @iatMeta StructuredProperty:true
    * @iatMeta minSize:1
    * @iatMeta maxSize:8
    */

    /**
    * @cfg {widgets.brease.XYChart.YAxis} yAxis={}
    * @iatStudioExposed
    * @iatCategory Collections
    * Defines appearance and behaviour of the yAxis instances
    * @iatMeta StructuredProperty:true
    * @iatMeta minSize:1
    * @iatMeta maxSize:8
    */

    /**
    * @cfg {widgets.brease.XYChart.Cursor} cursor={}
    * @iatStudioExposed
    * @iatCategory Collections
    * Defines appearance and behaviour of the cursor instances
    * @iatMeta StructuredProperty:true
    * @iatMeta minSize:1
    * @iatMeta maxSize:2
    */

    return {
        updateChartTime: 1000,
        freezeMode: false,
        zoomType: 'xy'
    };

});
