define(['widgets/brease/Rectangle/Rectangle'], function (SuperClass) {

    'use strict';

    /**
    * @class widgets.widgetlibrary_1.Rectangle
    * @extends widgets.brease.Rectangle
    */
    var defaultSettings = {
        "draggable": false,
        "enable": false,
        "style": "default",
        "tabIndex": -1,
        "visible": true,
        "maxHeight": 0,
        "minHeight": 0,
        "maxWidth": 0,
        "minWidth": 0,
        "height": 20,
        "width": 20
},

    WidgetClass = SuperClass.extend(function Rectangle() {
        SuperClass.apply(this, arguments);
    }, defaultSettings),

    p = WidgetClass.prototype;

    return WidgetClass;

});
