define(['brease/core/Decorator',
    'widgets/brease/XYChart/libs/XYChartEvents',
    'brease/enum/Enum',
    'brease/core/Types',
    'brease/events/BreaseEvent',
    'brease/events/Gestures',
    'widgets/brease/XYChart/libs/Gesture'
], function (Decorator, ChartEvents, Enum, Types, BreaseEvent, Gestures, Gesture) {

    'use strict';

    var InteractionDecorator = function InteractionDecorator() {
        this.initType = Decorator.TYPE_PRE;
    };

    /**
    * @class widgets.brease.XYChart.libs.decorators.InteractionDecorator
    * @extends brease.core.Decorator
    * #Description
    * Handles user interaction of the XYChart widget
    *
    *
    * @iatMeta studio:visible
    * false
    */

    /**
    * @method decorate
    * decorate
    * @param {brease.core.WidgetClass} widgetClass
    * @return {brease.core.WidgetClass} returns decorated WidgetClass
    */
    InteractionDecorator.prototype = new Decorator();
    InteractionDecorator.prototype.constructor = InteractionDecorator;

    var instance = new InteractionDecorator(),
        MIN_ZOOM_FACTOR = 0.002;

    /**
    * @property {Object} methodsToAdd
    */
    instance.methodsToAdd = {
        init: function () {
            this.gestures = {
                pan: new Gesture(),
                pinch: new Gesture(),
                scaleFactor: 1
            };
            this.zoomElem = document.createElement('DIV');
            this.zoomElem.classList.add('interactionWrapper');
            this.zoomEl = $(this.zoomElem);
            Gestures.add(this.zoomElem, ['pinch', 'pan', 'tap'], [
                { event: 'XYChartPinch', pointers: 2, threshold: 0.1, enable: this.isOperable.bind(this) },
                { event: 'XYChartPan', pointers: 1, threshold: 20, direction: 30, enable: this.isOperable.bind(this) },
                { event: 'XYChartTap', pointers: 1, threshold: 10, interval: 100, enable: this.isOperable.bind(this) }
            ]);
            var hammerManager = Gestures.getGestures().get(this.zoomElem);
            hammerManager.recognizers[0].requireFailure(hammerManager.recognizers[1]);
            hammerManager.recognizers[2].requireFailure(hammerManager.recognizers[1]);
        },
        wake: function () {
            //console.log('InteractionDecorator.wake()', this);
        },
        /**
        * @method initFreezeEvents
        * @param {Boolean} remove
        * initialize interactions in freeze mode
        */
        initFreezeEvents: function (remove) {
            var fn = remove ? 'off' : 'on';
            this.zoomEl[fn]('mousewheel DOMMouseScroll', this._bind('_onMouseWheel'));
            Gestures[fn](this.zoomElem, 'XYChartTapstart XYChartTap XYChartTapend XYChartPinchstart XYChartPinchin XYChartPinchout XYChartPinchend XYChartPinchcancel XYChartPanstart XYChartPanup XYChartPandown XYChartPanleft XYChartPanright XYChartPanend XYChartPancancel', this._bind('_onGesture'));
            // used to prevent content scrolling when using pan gestures
            this.zoomEl[fn](BreaseEvent.MOUSE_DOWN, _handleEvent);
        },
        /**
        * @method updateChartInteraction
        * enables or disables syncfusion's chart interaction 
        */
        updateChartInteraction: function () {
            var isOperable = this.isOperable() && this.getZoomType() !== Enum.ChartZoomType.none;
            this.model.zooming.enable = isOperable;
            this.model.zooming.enableMouseWheel = false;
            this.model.zooming.enablePinching = false;
            this.model.zooming.toolbarItems = isOperable ? ['reset', 'pan', 'zoom'] : [''];
            this.updateToolbar();
            if (!this.isOperable()) {
                this.updateCursorTable();
            }
            this.redraw();
        },
        /**
        * @method updateToolbar
        * appends or removes the toolbar when zooming
        */
        updateToolbar: function () {
            if (this.isOperable()) {
                this.updateToolbarPadding();
                this.toolbar.enable();
            } else {
                this.toolbar.disable();
            }
        },
        /**
        * @method updateToolbarPadding
        * used to place the cursor wrapper over the chart area
        * excluding the space for axis labels
        */
        updateToolbarPadding: function () {
            var padding = this.model.m_Spacing ? this.model.m_Spacing : { Top: 0, Right: 0, Bottom: 0, Left: 0 };
            this.zoomElem.style.setProperty('padding', padding.Top + 'px ' + padding.Right + 'px ' + padding.Bottom + 'px ' + padding.Left + 'px');
        },
        /**
        * @method updateViewport
        * loades reduced data depending on the current zoom level into 
        * the renderer
        * This method requires a rendered chart! If its not rendered it will be executed after first redraw.
        */
        updateViewport: function () {
            if (this.isDrawn()) {
                this.settings.zoomFactorX = this.getZoomFactorX();
                this.settings.zoomFactorY = this.getZoomFactorY();
                var that = this;
                this.model.series.forEach(function (series) {
                    series.points = that._reduceData(series.name);
                    //console.log('updateViewport', series.points.length);
                });
                this.redraw();
                this.throttledRedraw.flush();
            } else if (!this.eventDispatcher.hasEventListener(ChartEvents.RENDERER.REDRAW, this._getBound(_updateViewport))) {
                this.eventDispatcher.addEventListener(ChartEvents.RENDERER.REDRAW, this._bind(_updateViewport));
            }
        },

        // ZOOM
        /**
        * @method setZoomFactors
        * @param {Number} zoomFactorX
        * @param {Number} zoomFactorY
        * @param {Boolean} reset
        */
        setZoomFactors: function (zoomFactorX, zoomFactorY, reset) {
            var oldZoomFactors = this.getZoomFactorsByType(),
                newZoomFactors;
            this.setZoomFactorX(zoomFactorX, reset);
            this.setZoomFactorY(zoomFactorY, reset);
            this.applyZoomFactor();
            newZoomFactors = this.getZoomFactorsByType();
            this.eventDispatcher.dispatchEvent({
                type: ChartEvents.RENDERER.ZOOMFACTOR_CHANGED,
                detail: {
                    data: {
                        deltaZoomX: oldZoomFactors.x - newZoomFactors.x,
                        deltaZoomY: oldZoomFactors.y - newZoomFactors.y
                    },
                    type: this.constructor.name
                }
            });
        },
        /**
        * @method applyZoomFactor
        * applies the zoomFactor to all axes
        */
        applyZoomFactor: function () {
            var zoomFactorX = this.getZoomFactorX(),
                zoomFactorY = this.getZoomFactorY();
            this.model.axes.forEach(function (axis) {
                axis.zoomFactor = axis.orientation === 'horizontal' ? zoomFactorX : zoomFactorY;
            });
        },
        getMinZoomFactor: function () {
            return MIN_ZOOM_FACTOR;
        },
        /**
        * @method getZoomFactorsByType
        * returns the zoom factor for x and y axis depending on the zoomType
        * @return {Object}
        * @return {Number} return.x
        * @return {Number} return.y
        */
        getZoomFactorsByType: function () {
            var zoomFactorX = this.getZoomFactorX(),
                zoomFactorY = this.getZoomFactorY(),
                result = {
                    x: 1,
                    y: 1
                };
            switch (this.getZoomType()) {
                case Enum.ChartZoomType.xy:
                    result.x = zoomFactorX;
                    result.y = zoomFactorY;
                    break;

                case Enum.ChartZoomType.x:
                    result.x = zoomFactorX;
                    break;

                case Enum.ChartZoomType.y:
                    result.y = zoomFactorY;
                    break;
            }
            return result;
        },
        /**
        * @method setZoomFactorX
        * @param {Number} zoomFactorX
        * @param {Boolean} reset
        */
        setZoomFactorX: function (zoomFactorX, reset) {
            var zoomType = this.getZoomType();
            if (reset || zoomType === Enum.ChartZoomType.xy || zoomType === Enum.ChartZoomType.x) {
                this.model.primaryXAxis.zoomFactor = Types.parseValue(zoomFactorX, 'Number', { default: 1, min: MIN_ZOOM_FACTOR, max: 1 });
            }
        },
        /**
        * @method getZoomFactorX
        * @return {Number}
        * @param {Boolean} reset
        */
        getZoomFactorX: function () {
            return this.model.primaryXAxis.zoomFactor;
        },
        /**
        * @method setZoomFactorY
        * @param {Number} zoomFactorY
        * @param {Boolean} reset
        */
        setZoomFactorY: function (zoomFactorY, reset) {
            var zoomType = this.getZoomType();
            if (reset || zoomType === Enum.ChartZoomType.xy || zoomType === Enum.ChartZoomType.y) {
                this.model.primaryYAxis.zoomFactor = Types.parseValue(zoomFactorY, 'Number', { default: 1, min: MIN_ZOOM_FACTOR, max: 1 });
            }
        },
        /**
        * @method getZoomFactorY
        * @return {Number} 
        */
        getZoomFactorY: function () {
            return this.model.primaryYAxis.zoomFactor;
        },
        /**
        * @method isZoomed
        * returns if the chart is zoomed in order to append the toolbar
        * @return {Boolean} 
        */
        isZoomed: function () {
            return this.getZoomFactorX() + this.getZoomFactorY() !== 2;
        },
        /**
        * @method onZoomIn
        * Zooms in the graph by 20%.
        * To do this, the widget must be in freeze mode.
        */
        onZoomIn: function (e) {
            if (this.isOperable()) {
                this.setZoomFactors(this.getZoomFactorX() * 0.8, this.getZoomFactorY() * 0.8);
            }
        },

        /**
        * @method onZoomOut
        * Zooms out the graph by 20%.
        * To do this, the widget must be in freeze mode.
        */
        onZoomOut: function (e) {
            if (this.isOperable()) {
                this.setZoomFactors(this.getZoomFactorX() * 1.2, this.getZoomFactorY() * 1.2);
            }
        },
        /**
        * @method onZoomReset
        * Resets the zoom to 0 %.
        * To do this, the widget must be in freeze mode.
        */
        onZoomReset: function () {
            if (this.isOperable()) {
                var btnFound = false;
                if (this.elem) {
                    this.$el.find('#' + this.elem.id + '_canvas_ResetZoom').each(function () {
                        this.dispatchEvent(new Event('click'));
                        btnFound = true;
                    });
                }

                if (!btnFound) {
                    this.setZoomPositionX(0);
                    this.setZoomPositionY(0);
                    this.setZoomFactors(1, 1, true);
                }
                this.eventDispatcher.dispatchEvent({
                    type: ChartEvents.RENDERER.ZOOMFACTOR_CHANGED,
                    detail: {
                        data: {
                            deltaZoomX: 0,
                            deltaZoomY: 0
                        },
                        type: this.constructor.name
                    }
                });

            }
        },
        /**
        * @method onZoomFactorChanged
        * called when the renderer fires a ChartEvents.RENDERER.ZOOMFACTOR_CHANGED in order to 
        * adjust the viewport (zoomPosition)
        */
        onZoomFactorChanged: function (e) {
            var data = e.detail.data,
                deltaZoomX = Types.parseValue(data.deltaZoomX, 'Number', { default: 1, min: -1, max: 1 }),
                deltaZoomY = Types.parseValue(data.deltaZoomY, 'Number', { default: 1, min: -1, max: 1 });
            if (deltaZoomX + deltaZoomY !== 0) {
                this.setZoomPositionX(this.getZoomPositionX() + 0.5 * deltaZoomX);
                this.setZoomPositionY(this.getZoomPositionY() + 0.5 * deltaZoomY);
                this.redraw();
            }
            this.debouncedUpdateViewport();
        },
        _onMouseWheel: function (e) {
            if (this.isOperable() && this.getZoomType() !== Enum.ChartZoomType.none) {
                // prevent scrolling of content
                _handleEvent(e);
                // prevent native scrolling in browser
                e.preventDefault();
                if (e.originalEvent.deltaY > 0) {
                    this.onZoomOut();
                } else if (e.originalEvent.deltaY < 0) {
                    this.onZoomIn();
                }
            }
        },
        // PAN
        /**
        * @method setZoomPositionX
        * sets the x position of the viewport
        * @param {Number} zoomPositionX
        */
        setZoomPositionX: function (zoomPositionX) {
            var zoomPosition = Types.parseValue(zoomPositionX, 'Number', { default: 0.5, min: 0, max: 1 - this.getZoomFactorX() });
            this.model.primaryXAxis.zoomPosition = zoomPosition;
            this.model.axes.filter(function (axis) { return axis.orientation === 'horizontal'; }).forEach(function (axis) {
                axis.zoomPosition = zoomPosition;
            });
        },
        /**
        * @method getZoomPositionX
        * returns the x position of the viewport
        * @return {Number}
        */
        getZoomPositionX: function () {
            return this.model.primaryXAxis.zoomPosition;
        },
        /**
        * @method setZoomPositionY
        * sets the y position of the viewport
        * @param {Number} zoomPositionY
        */
        setZoomPositionY: function (zoomPositionY) {
            var zoomPosition = Types.parseValue(zoomPositionY, 'Number', { default: 0.5, min: 0, max: 1 - this.getZoomFactorY() });
            this.model.primaryYAxis.zoomPosition = zoomPosition;
            this.model.axes.filter(function (axis) { return axis.orientation === 'vertical'; }).forEach(function (axis) {
                axis.zoomPosition = zoomPosition;
            });
        },
        /**
        * @method getZoomPositionY
        * returns the y position of the viewport
        * @return {Number}
        */
        getZoomPositionY: function () {
            return this.model.primaryYAxis.zoomPosition;
        },
        /**
        * @method onScrollUp
        * moves the viewport up
        */
        onScrollUp: function () {
            if (this.isOperable() && this.getZoomType() !== Enum.ChartZoomType.none) {
                this.setZoomPositionY(this.getZoomPositionY() + 0.25 * this.getZoomFactorY());
                this.redraw(true);
            }
        },
        /**
        * @method onScrollDown
        * moves the viewport down
        */
        onScrollDown: function () {
            if (this.isOperable() && this.getZoomType() !== Enum.ChartZoomType.none) {
                this.setZoomPositionY(this.getZoomPositionY() - 0.25 * this.getZoomFactorY());
                this.redraw(true);
            }
        },
        /**
        * @method onScrollLeft
        * moves the viewport to the left
        */
        onScrollLeft: function () {
            if (this.isOperable() && this.getZoomType() !== Enum.ChartZoomType.none) {
                this.setZoomPositionX(this.getZoomPositionX() - 0.25 * this.getZoomFactorX());
                this.redraw(true);
            }
        },
        /**
        * @method onScrollRight
        * moves the viewport to the right
        */
        onScrollRight: function () {
            if (this.isOperable() && this.getZoomType() !== Enum.ChartZoomType.none) {
                this.setZoomPositionX(this.getZoomPositionX() + 0.25 * this.getZoomFactorX());
                this.redraw(true);
            }
        },
        // GESTURES
        /**
         * @method _onGesture
         * Called when the user interacts with the widget
         */
        _onGesture: function (e) {
            //console.log(e.type, e.deltaX, e.deltaY);
            switch (e.type) {
                case 'XYChartPanstart':
                case 'XYChartPinchstart':
                    var scaleFactor = Gestures.getScaleFactor(this.zoomElem);
                    this.gestures.pan.setScaleFactor(scaleFactor);
                    this.gestures.pan.setStartX(this.getZoomPositionX());
                    this.gestures.pan.setStartY(this.getZoomPositionY());
                    this.gestures.pinch.setScaleFactor(scaleFactor);
                    this.gestures.pinch.setStartX(this.getZoomFactorX());
                    this.gestures.pinch.setStartY(this.getZoomFactorY());
                    break;
                case 'XYChartPanleft':
                case 'XYChartPanright':
                    this.gestures.pan.setDeltaX(e.deltaX);
                    this.requestId = Gestures.getAnimationFrame(this.requestId, this.setViewport.bind(this, 'pan'));
                    break;
                case 'XYChartPanup':
                case 'XYChartPandown':
                    this.gestures.pan.setDeltaY(e.deltaY);
                    this.requestId = Gestures.getAnimationFrame(this.requestId, this.setViewport.bind(this, 'pan'));
                    break;
                case 'XYChartPinchin':
                case 'XYChartPinchout':
                    this.gestures.pinch.setDeltaScale(e.scale - (e.scale % 0.2));
                    this.requestId = Gestures.getAnimationFrame(this.requestId, this.setViewport.bind(this, 'pinch'));
                    break;
                case 'XYChartTap':
                    _handleTap.call(this, e);
                    break;
                case 'XYChartPanend':
                    this.gestures.pan.reset();
                    Gestures.cancelAnimationFrame(this.requestId);
                    break;
                case 'XYChartPinchend':
                    this.gestures.pinch.reset();
                    Gestures.cancelAnimationFrame(this.requestId);
                    this.eventDispatcher.dispatchEvent({
                        type: ChartEvents.RENDERER.ZOOMFACTOR_CHANGED,
                        detail: {
                            data: {
                                deltaZoomX: 0,
                                deltaZoomY: 0
                            },
                            type: this.constructor.name
                        }
                    });
                    break;
                case 'XYChartPancancel':
                case 'XYChartPinchcancel':
                    this.gestures.pan.reset();
                    this.gestures.pinch.reset();
                    Gestures.cancelAnimationFrame(this.requestId);
                    this.requestId = Gestures.getAnimationFrame(this.requestId, this.setViewport.bind(this));
                    break;
            }
        },
        setViewport: function (type) {
            if (type === 'pinch') {
                _handlePinch.call(this);
            } else if (type === 'pan') {
                _handlePan.call(this);
            }
            this._redraw(true);
        },
        updateCursorTable: function () {
            if (this.isOperable()) {
                this.cursorTable.toggle();
            } else {
                this.cursorTable.disable();
            }
        },
        suspend: function () {
            Gestures.cancelAnimationFrame(this.requestId);
            //console.log('InteractionDecorator.suspend()', this);
        },
        dispose: function () {
            Gestures.cancelAnimationFrame(this.requestId);
            this.zoomEl.remove();
        }
    };
    function _handleEvent(e) {
        e.stopPropagation();
    }
    function _handlePinch() {
        var zoomX = this.gestures.pinch.getStartX() * (1 / this.gestures.pinch.getDeltaScale()),
            zoomY = this.gestures.pinch.getStartY() * (1 / this.gestures.pinch.getDeltaScale()),
            zoomType = this.getZoomType();
        this.setZoomFactorX(zoomX);
        this.setZoomFactorY(zoomY);
        this.applyZoomFactor();
        if (zoomType === Enum.ChartZoomType.xy || zoomType === Enum.ChartZoomType.x) {
            this.setZoomPositionX(this.gestures.pan.getStartX() + 0.5 * (this.gestures.pinch.getStartX() - zoomX));
        }
        if (zoomType === Enum.ChartZoomType.xy || zoomType === Enum.ChartZoomType.y) {
            this.setZoomPositionY(this.gestures.pan.getStartY() + 0.5 * (this.gestures.pinch.getStartY() - zoomY));
        }
    }
    function _handlePan() {
        this.setZoomPositionX(this.gestures.pan.getStartX() - this.gestures.pan.getDeltaX() / this.model.primaryXAxis.width * this.gestures.pinch.getStartX());
        this.setZoomPositionY(this.gestures.pan.getStartY() + this.gestures.pan.getDeltaY() / this.model.primaryYAxis.height * this.gestures.pinch.getStartY());
    }
    function _handleTap(e) {
        var ev = new MouseEvent('click', {
            bubbles: false,
            cancelable: true,
            screenX: e.srcEvent.screenX,
            screenY: e.srcEvent.screenY,
            clientX: e.srcEvent.clientX,
            clientY: e.srcEvent.clientY,
            view: window
        });
        this.elem.dispatchEvent(ev);
    }

    function _updateViewport() {
        this.eventDispatcher.removeEventListener(ChartEvents.RENDERER.REDRAW, this._getBound(_updateViewport));
        this.updateViewport();
    }

    return instance;
});
