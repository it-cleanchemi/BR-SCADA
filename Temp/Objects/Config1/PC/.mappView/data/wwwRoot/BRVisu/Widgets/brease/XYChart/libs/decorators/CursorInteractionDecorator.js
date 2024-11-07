define(['brease/core/Decorator',
    'widgets/brease/XYChart/libs/CrosshairSet',
    'widgets/brease/XYChart/libs/XYChartEvents',
    'brease/core/Utils'
], function (Decorator, CrosshairSet, ChartEvents, Utils) {

    'use strict';

    var CursorInteractionDecorator = function CursorInteractionDecorator() {
        this.initType = Decorator.TYPE_PRE;
    };

    /**
    * @class widgets.brease.XYChart.libs.decorators.CursorInteractionDecorator
    * @extends brease.core.Decorator
    * #Description
    * Handles cursor interaction of the XYChart widget
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
    CursorInteractionDecorator.prototype = new Decorator();
    CursorInteractionDecorator.prototype.constructor = CursorInteractionDecorator;

    var instance = new CursorInteractionDecorator();

    /**
    * @property {Object} methodsToAdd
    */
    instance.methodsToAdd = {
        init: function () {
            this.isResized = true;
            this.isRedrawAfterFreeze = true;
            this.scaleFactor = 1;
            this.cursors = new Map();
            this.cursorWrapper = document.createElement('DIV');
            this.cursorWrapper.classList.add('cursorWrapper');
            this.$cursorWrapper = $(this.cursorWrapper);
        },
        wake: function () {
            this.isResized = true;
        },

        initEvents: function (remove) {
            var fn = remove ? 'removeEventListener' : 'addEventListener';
            // this.eventDispatcher[fn](ChartEvents.GRAPH.DISPOSED, this._bind('_onGraphDisp')); needed only for edit mode
            this.eventDispatcher[fn](ChartEvents.GRAPH.VISIBLE_CHANGED, this._bind('_onGraphVisibilityChanged'));
            this.eventDispatcher[fn](ChartEvents.RENDERER.REDRAW, this._bind('_onRedraw'));
            this.eventDispatcher[fn](ChartEvents.CURSOR.VISIBLE_CHANGED, this._bind('_onCursorVisibilityChanged'));
            this.eventDispatcher[fn](ChartEvents.STYLE_CHANGED, this._bind('_onStyleChanged'));
            this.eventDispatcher[fn](ChartEvents.CURSOR_SELECTION_CHANGED, this._bind('_onCursorSelectionChanged'));
            window[fn]('resize', this._bind('_resizeHandler'));
        },

        /**
        * @method initFreezeEvents
        * @param {Boolean} remove
        * initialize interactions in freeze mode
        */
        initFreezeEvents: function (remove) {
            var fn = remove ? 'removeEventListener' : 'addEventListener';
            this.model.chartClick = remove ? null : this._bind('_handleChartClick');
            this.eventDispatcher[fn](ChartEvents.GRAPH.VALUE_CHANGED, this._bind('_updateCursorValuesForGraph'));
        },

        _onCursorVisibilityChanged: function (e) {
            if (e.detail.type === 'Cursor') {
                if (!this.cursors.has(e.detail.name)) {
                    this._createCursor(e.detail.name);
                }
                this.cursors.get(e.detail.name).setVisible(e.detail.data.visible);
            }
        },

        _onGraphVisibilityChanged: function (e) {
            this.cursors.forEach(function (cursor) {
                if (!cursor.hasCrosshair(e.detail.name)) {
                    cursor.addCrosshair(e.detail.name);
                }
                cursor.setCrosshairVisible(e.detail.name, e.detail.data.visible);
            });
        },

        _onStyleChanged: function (e) {
            if (e.detail.type === 'Cursor') {
                if (!this.cursors.has(e.detail.name)) {
                    this._createCursor(e.detail.name);
                }
                this.cursors.get(e.detail.name).setColor(e.detail.data.cursorColor);
            }

            if (e.detail.type === 'Graph') {
                this.cursors.forEach(function (cursor) {
                    if (cursor.hasCrosshair(e.detail.name)) {
                        cursor.crosshairs.get(e.detail.name).el.css('background-color', e.detail.data.lineColor);
                    }
                });
            }
        },

        /** 
        * @method
        * Creates a new CrosshairSet and sets it to active its the first one.
        * @param {String} name 
        */
        _createCursor: function (name) {
            var cursor = new CrosshairSet(this.$cursorWrapper);
            cursor.setName(name);
            cursor.setActive(this.cursors.size === 0);
            // add Croshair for each graph
            this.model.series.forEach(function (series) {
                if (!cursor.hasCrosshair(series.name)) {
                    cursor.addCrosshair(series.name);
                }
                cursor.setCrosshairVisible(series.name, this.isSeriesVisible(series));
            }, this);
            this.cursors.set(name, cursor);
        },

        _onCursorSelectionChanged: function (e) {
            var name = e.detail.name;
            this.cursors.forEach(function (cursor, cursorsName) {
                if (cursorsName === name) {
                    cursor.setActive(true);
                } else {
                    cursor.setActive(false);
                }
            });
        },

        /**
        * @method
         * Disables the cursors if unfreezed
         */
        updateChartInteraction: function () {
            var fn = this.isOperable() ? 'enable' : 'disable';
            this.cursors.forEach(function (cursor) {
                cursor[fn]();
            });
            this.isRedrawAfterFreeze = this.isFrozen();
        },

        /**
        * @method
         * Appends the cursor wrapper to the interaction div.
         * @param {Object} sender 
         */
        _onChartLoad: function (sender) {
            this.zoomEl.append(this.$cursorWrapper);
        },

        /**
        * @method
         * In case of zoom, pan or data change reposition the crosshairs.
         * In case of initial redraw after freeze positions crosshairs on first index.  
         */
        _onRedraw: function () {
            // check if in freeze mode
            if (this.isFrozen()) {
                this.cursors.forEach(function (cursor) {
                    var index = cursor.getIndex();
                    for (var i = 0; i < this.model.series.length; i++) {
                        var series = this.model.series[i];
                        if (!this.isSeriesVisible(series)) {
                            continue;
                        }
                        var point = this.data[series.name][index],
                            valueX = null,
                            valueY = null;
                        if (!point) {
                            cursor.disableCrosshair(series.name);
                            cursor.setPoint(series.name, point);
                        } else {
                            cursor.setPoint(series.name, point.location);
                            if (this.isEnabled()) {
                                cursor.enableCrosshair(series.name);
                            }
                            valueX = point.x;
                            valueY = point.y;
                        }
                        if (this.isRedrawAfterFreeze) {
                            this.eventDispatcher.dispatchEvent({
                                type: ChartEvents.CROSSHAIR.VALUE_CHANGED,
                                detail: { type: 'Crosshair', data: { valueX: valueX, valueY: valueY, cursorName: cursor.getName() }, name: series.name }
                            });
                        }
                    }
                }, this);
                this.isRedrawAfterFreeze = false;
            }
        },

        /**
        * @method
         * Position the cursor on the nearest point index of the nearest graph. 
         * @param {Object} args 
         */
        _handleChartClick: function (args) {
            var mouseX = args.data.location.x / this._getScaleFactor(),
                mouseY = args.data.location.y / this._getScaleFactor(),
                cursorX = mouseX - args.model.primaryXAxis.Location.X1,
                cursorY = mouseY - args.model.primaryYAxis.Location.Y2,
                nearestPointIndex = this._findNearestPointIndex(cursorX, cursorY);

            this._setActiveCursorIndex(nearestPointIndex);
        },

        /** 
        * @method
        * Find nearest point index from all series.
         * @param {Number} cursorX 
         * @param {Number} cursorY
         * @returns {Number} nearest point data index
         */
        _findNearestPointIndex: function (cursorX, cursorY) {
            var nearestPointIndex = -1, nearestPoint;
            for (var i = 0; i < this.model.series.length; i++) {
                var series = this.model.series[i];
                if (!this.isSeriesVisible(series)) {
                    continue;
                }
                var nPIndex = _findNearestPoint(this.data[series.name], cursorX, cursorY);
                if (nPIndex === -1) {
                    continue;
                }
                var nP = this.data[series.name][nPIndex];
                if (!nearestPoint) {
                    nearestPointIndex = nPIndex;
                    nearestPoint = nP;
                } else {
                    var index = _findNearestPoint([nearestPoint, nP], cursorX, cursorY);
                    if (index > 0) {
                        nearestPointIndex = nPIndex;
                        nearestPoint = nP;
                    }
                }
            }
            return nearestPointIndex;
        },

        /**
        * @method
         * Positions the crosshairs of active cursors on the point index.
         * @param {Number} index 
         */
        _setActiveCursorIndex: function (index) {
            this.cursors.forEach(function (cursor) {
                if (cursor.isActive() && cursor.isVisible()) {
                    cursor.setIndex(index);

                    this.model.series.forEach(function (series) {
                        if (!this.isSeriesVisible(series)) {
                            return;
                        }
                        var point = this.data[series.name][index],
                            valueX = null,
                            valueY = null;
                        if (!point) {
                            cursor.disableCrosshair(series.name);
                            cursor.setPoint(series.name, point);
                        } else {
                            cursor.setPoint(series.name, point.location);
                            cursor.enableCrosshair(series.name);
                            valueX = point.x;
                            valueY = point.y;
                        }
                        this.eventDispatcher.dispatchEvent({
                            type: ChartEvents.CROSSHAIR.VALUE_CHANGED,
                            detail: { type: 'Crosshair', data: { valueX: valueX, valueY: valueY, cursorName: cursor.getName() }, name: series.name }
                        });
                    }, this);
                }
            }, this);
        },
        /**
        * @method
        * Updates the cursor values after a graph fires a value_changed event due to calling the
        * update method
        */
        _updateCursorValuesForGraph: function (e) {
            var series = _.find(this.model.series, ['name', e.detail.name]);
            if (!this.isSeriesVisible(series)) {
                return;
            }
            this.cursors.forEach(function (cursor) {
                var index = cursor.getIndex(),
                    name = e.detail.name,
                    valueX = null,
                    valueY = null,
                    point = this.data[name][index];

                if (!point) {
                    cursor.disableCrosshair(name);
                    cursor.setPoint(name, point);
                } else {
                    cursor.setPoint(name, point.location);
                    cursor.enableCrosshair(name);
                    valueX = point.x;
                    valueY = point.y;
                }
                this.eventDispatcher.dispatchEvent({
                    type: ChartEvents.CROSSHAIR.VALUE_CHANGED,
                    detail: { type: 'Crosshair', data: { valueX: valueX, valueY: valueY, cursorName: cursor.getName() }, name: name }
                });
            }, this);
        },
        _getScaleFactor: function () {
            if (this.isResized) {
                this.scaleFactor = Utils.getScaleFactor(this.elem.parentNode);
                if (this.scaleFactor === 0) {
                    this.scaleFactor = 1;
                }
                this.isResized = false;
            }
            return this.scaleFactor;
        },

        _resizeHandler: function () {
            this.isResized = true;
        },

        suspend: function () {
        },

        dispose: function () {
            this.cursors.forEach(function (cursor) {
                cursor.dispose();
            });
            this.cursors.clear();
            this.$cursorWrapper.remove();
        }
    };

    /**
    * @method
    * @private 
     * Find the nearest point in points for given coordinates x, y.
     * 
     * @param {Array} points All points with location coordinates ([{location: {X, Y}}])
     * @param {Number} x target x
     * @param {Number} y target y
     * @return {Number} index
     */
    function _findNearestPoint(points, x, y) {
        // search for the point with lowest delta x + delta y to cursor
        var nearestPointIndex = -1, minDistance;
        for (var j = 0; j < points.length; j++) {
            var dataPoint = points[j];
            if (!dataPoint || !dataPoint.location) {
                continue;
            }
            var distance = _calcDistance([dataPoint.location.X, dataPoint.location.Y], [x, y]);
            if (nearestPointIndex === -1 || distance < minDistance) {
                nearestPointIndex = j;
                minDistance = distance;
            }
        }
        return nearestPointIndex;
    }

    /**
    * @method
    * @private 
     * Calculate the distance between two points (hypotenuse)
     * @param {Number[]} p1 
     * @param {Number[]} p2 
     */
    function _calcDistance(p1, p2) {
        var dX = Math.abs(p1[0] - p2[0]),
            dY = Math.abs(p1[1] - p2[1]);
        return Math.hypot(dX, dY);
    }

    return instance;
});
