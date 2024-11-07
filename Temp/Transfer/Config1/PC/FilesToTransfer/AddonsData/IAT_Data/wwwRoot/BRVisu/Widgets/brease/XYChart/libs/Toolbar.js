define(['brease/core/Class',
    'widgets/brease/XYChart/libs/XYChartEvents',
    'brease/events/BreaseEvent',
    'widgets/brease/XYChart/libs/ToolbarButton'],
function (SuperClass, ChartEvents, BreaseEvent, ToolbarButton) {
    'use strict';
    /**
    * @class widgets.brease.XYChart.Toolbar
    * Defines the Toolbar at the top of the XYChart
    * @extends Object
    */
    /**
    * @method constructor
    */
    var defaultSettings = {},
        Toolbar = SuperClass.extend(function Toolbar(id) {
            SuperClass.apply(this, arguments);
        }, defaultSettings),

        p = Toolbar.prototype;

    p.init = function (eventDispatcher, containerElem) {
        this.elem = document.createElement('DIV');
        this.elem.classList.add('toolbar');
        this.cursorTableBtn = new ToolbarButton();
        this.cursorTableBtn.setType('cursorTable');
        this.elem.appendChild(this.cursorTableBtn.elem);
        this.resetBtn = new ToolbarButton();
        this.resetBtn.setType('reset');
        this.elem.appendChild(this.resetBtn.elem);
        this.cursorButtons = new Map();
        this.eventDispatcher = eventDispatcher;
        this.containerElem = containerElem;
        this.initEvents();
        this.initButtonEvents();
    };
    /**
    * @method enable
    * activates the toolbar for user interaction (inserts the element into the DOM)
    */
    p.enable = function () {
        if (this.elem.parentElement === null) {
            this.containerElem.appendChild(this.elem);
        }
    };
    p.initEvents = function (remove) {
        var fn = remove ? 'removeEventListener' : 'addEventListener';
        this.eventDispatcher[fn](ChartEvents.CURSOR.VISIBLE_CHANGED, this._bind('onCursorVisibilityChanged'));
        this.eventDispatcher[fn](ChartEvents.STYLE_CHANGED, this._bind('onStyleChanged'));
        this.eventDispatcher[fn](ChartEvents.CURSOR_SELECTION_CHANGED, this._bind('onCursorSelectionChanged'));
        this.eventDispatcher[fn](ChartEvents.TOGGLE_SIDEBAR, this._bind('onToggleCursorTable'));
    };
    p.initButtonEvents = function (remove) {
        var fn = remove ? 'off' : 'on';
        this.resetBtn.el[fn](BreaseEvent.MOUSE_DOWN + ' pointerdown mousedown touchstart', _cancelEvent);
        this.resetBtn.el[fn](BreaseEvent.CLICK, this._bind('onZoomReset'));
        this.cursorTableBtn.el[fn](BreaseEvent.MOUSE_DOWN + ' pointerdown mousedown touchstart', _cancelEvent);
        this.cursorTableBtn.el[fn](BreaseEvent.CLICK, this._bind('onCursorTableBtnClick'));
        this.cursorButtons.forEach(function (btn) {
            btn.el[fn](BreaseEvent.MOUSE_DOWN + ' pointerdown mousedown touchstart', _cancelEvent);
            btn.el[fn](BreaseEvent.CLICK, this._bind('onCursorClick'));
        }, this);
    };
    /**
    * @method onCursorVisibilityChanged
    * called when the visibility of a cursor has been changed
    */
    p.onCursorVisibilityChanged = function (e) {
        if (e.detail.type === 'Cursor') {
            if (!this.cursorButtons.has(e.detail.name)) {
                _createCursor.call(this, e.detail.name);
            }
            this.cursorButtons.get(e.detail.name).setVisible(e.detail.data.visible);
        }
    };
    /**
    * @method onStyleChanged
    * called when a cursor style has been changed
    */
    p.onStyleChanged = function (e) {
        if (e.detail.type === 'Cursor') {
            if (!this.cursorButtons.has(e.detail.name)) {
                _createCursor.call(this, e.detail.name);
            }
            this.cursorButtons.get(e.detail.name).setColor(e.detail.data.cursorColor);
        }
    };
    /**
    * @method onZoomReset
    * called when the user clicks on the zoom reset button
    */
    p.onZoomReset = function (e) {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.ZOOM_RESET, detail: { type: 'chart' } });
    };
    /**
    * @method onCursorTableBtnClick
    * called when the user clicks on the cursorTable button
    */
    p.onCursorTableBtnClick = function () {
        this.eventDispatcher.dispatchEvent({ type: ChartEvents.TOGGLE_SIDEBAR, detail: { type: 'chart' } });
    };
    /**
    * @method onToggleCursorTable
    * called when event ChartEvents.TOGGLE_SIDEBAR fired
    */
    p.onToggleCursorTable = function () {
        this.cursorTableBtn.setActive(!this.cursorTableBtn.isActive());
    };
    /**
    * @method onCursorClick
    * called when the user clicks on a cursor button
    */
    p.onCursorClick = function (e) {
        var name = e.target.getAttribute('data-name'),
            btn = this.cursorButtons.has(name) ? this.cursorButtons.get(name) : null;

        if (btn !== null && !btn.isActive()) {
            this.eventDispatcher.dispatchEvent({ type: ChartEvents.CURSOR_SELECTION_CHANGED, detail: { type: 'Cursor', data: { index: btn.getIndex() }, name: btn.getName() } });
        }
    };
    /**
    * @method onCursorSelectionChanged
    * called when the selected cursor has been changed. Either because of a 
    * user click or by using the action to set the active cursor
    */
    p.onCursorSelectionChanged = function (e) {
        var name = e.detail.name;
        if (!this.cursorButtons.has(name)) {
            return;
        }
        this.cursorButtons.forEach(function (btn, currentName) {
            if (currentName === name) {
                btn.setActive(true);
            } else {
                btn.setActive(false);
            }
        }, this);
    };
    /**
    * @method disable
    * deactivates the toolbar for user interaction (removes the element into the DOM)
    */
    p.disable = function () {
        if (this.elem.parentElement !== null) {
            this.containerElem.removeChild(this.elem);
            this.cursorTableBtn.setActive(false);
        }
    };
    p.dispose = function () {
        this.initButtonEvents(true);
        this.initEvents(true);
        this.resetBtn.dispose();
        this.cursorButtons.forEach(function (btn) {
            btn.dispose();
        });
        if (this.elem.parentElement !== null) {
            this.containerElem.removeChild(this.elem);
        }
        this.containerElem = null;
        this.elem = null;
    };
    function _createCursor(name) {
        this.cursorButtons.set(name, new ToolbarButton());
        var cursorButton = this.cursorButtons.get(name);
        cursorButton.setIndex(this.cursorButtons.size);
        cursorButton.setName(name);
        cursorButton.setType('cursor');
        if (cursorButton.getIndex() === 1) {
            cursorButton.setActive(true);
        }
        this.elem.appendChild(cursorButton.elem);
        this.initButtonEvents(true);
        this.initButtonEvents();
    }
    function _cancelEvent(e) {
        e.stopPropagation();
        e.cancelBubble = true;
    }
    return Toolbar;
});
