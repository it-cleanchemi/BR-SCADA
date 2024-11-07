define(['brease/core/Class',
    'widgets/brease/XYChart/libs/XYChartEvents',
    'brease/events/BreaseEvent',
    'widgets/brease/XYChart/libs/CursorData'],
function (SuperClass, ChartEvents, BreaseEvent, CursorData) {
    'use strict';
    /**
    * @class widgets.brease.XYChart.CursorTable
    * Defines the CursorTable of the XYChart
    * @extends Object
    */
    /**
    * @method constructor
    */
    var defaultSettings = {},
        template = document.createElement('template'),
        CursorTable = SuperClass.extend(function CursorTable(id) {
            SuperClass.apply(this, arguments);
        }, defaultSettings),

        p = CursorTable.prototype;
    template.innerHTML = '<table><tbody><tr><th></th></tr></tbody></table>';
    p.init = function (eventDispatcher, containerElem) {
        _initDom.call(this);
        this.cursorNames = [];
        this.cursorData = new Map();
        this.eventDispatcher = eventDispatcher;
        this.containerElem = containerElem;
        this.initEvents();
    };
    /**
    * @method enable
    * activates the toolbar for user interaction (inserts the element into the DOM)
    */
    p.enable = function () {
        if (this.elem.parentElement === null) {
            this.cursorData.forEach(function (cursorData) {
                cursorData.rowElems.forEach(function (row) {
                    this.tbodyElem.appendChild(row);
                }, this);
            }, this);
            this.containerElem.appendChild(this.elem);
        }
    };
    p.toggle = function () {
        if (this.elem.parentElement === null) {
            this.enable();
        } else {
            this.disable();
        }
    };
    p.initEvents = function (remove) {
        var fn = remove ? 'removeEventListener' : 'addEventListener';
        this.eventDispatcher[fn](ChartEvents.CURSOR.VISIBLE_CHANGED, this._bind('onCursorVisibilityChanged'));
        this.eventDispatcher[fn](ChartEvents.CURSOR_SELECTION_CHANGED, this._bind('onCursorSelectionChanged'));
        this.eventDispatcher[fn](ChartEvents.STYLE_CHANGED, this._bind('onStyleChanged'));
        this.eventDispatcher[fn](ChartEvents.GRAPH.VISIBLE_CHANGED, this._bind('onGraphVisibleChanged'));
    };
    /**
    * @method onCursorVisibilityChanged
    * called when the visibility of a cursor has been changed
    */
    p.onCursorVisibilityChanged = function (e) {
        // enable / disable second column
        if (!this.cursorNames.includes(e.detail.name)) {
            this.cursorNames.push(e.detail.name);
            _insertColumn.call(this, this.theadElem, this.cursorNames.indexOf(e.detail.name));
        }
        var index = this.cursorNames.indexOf(e.detail.name),
            visible = e.detail.data.visible;
        if (index === 0) {
            _handleElemVisibility(this.col1Elem, visible);
            this.cursorData.forEach(function (cursorData) {
                cursorData.setCursor1Visible(visible);
            });
        }
        if (index === 1) {
            _handleElemVisibility(this.col2Elem, visible);
            this.cursorData.forEach(function (cursorData) {
                cursorData.setCursor2Visible(visible);
            });
        }
    };
    p.onCursorSelectionChanged = function (e) {
        this.col1Elem.classList.remove('active');
        this.col2Elem.classList.remove('active');
        this.cursorNames.indexOf(e.detail.name) === 0 ? this.col1Elem.classList.add('active') : this.col2Elem.classList.add('active');
    };
    p.onGraphVisibleChanged = function (e) {
        // add / remove table rows
        if (!this.cursorData.has(e.detail.name)) {
            _createCursorData.call(this, e.detail.name);
        }
        this.cursorData.get(e.detail.name).setVisible(e.detail.data.visible);
    };
    /**
    * @method onStyleChanged
    * called when a cursor style has been changed
    */
    p.onStyleChanged = function (e) {
        if (e.detail.type === 'chart') {
            //this.tableElem.style['background-color'] = e.detail.data.chartColor;
        }
    };
    /**
    * @method disable
    * deactivates the toolbar for user interaction (removes the element into the DOM)
    */
    p.disable = function () {
        if (this.elem.parentElement !== null) {
            this.containerElem.removeChild(this.elem);
        }
    };
    p.dispose = function () {
        this.initEvents(true);
        this.cursorNames = null;
        this.cursorData.forEach(function (data) {
            data.dispose();
        });
        this.cursorData.clear();
        if (this.elem.parentElement !== null) {
            this.containerElem.removeChild(this.elem);
        }
        this.containerElem = null;
        this.elem = null;
    };
    function _createCursorData(name) {
        var cursorData = new CursorData();
        this.cursorData.set(name, cursorData);
        cursorData.init(this.eventDispatcher);
        cursorData.setName(name);
    }
    function _initDom() {
        this.elem = document.createElement('DIV');
        this.elem.classList.add('cursorTable');
        this.tableElem = template.content.cloneNode(true).firstChild;
        this.tbodyElem = this.tableElem.querySelector('tbody');
        this.theadElem = this.tableElem.querySelector('tr');
        this.col1Elem = document.createElement('th');
        this.col1Elem.innerText = '1';
        this.col1Elem.classList.add('active');
        this.col2Elem = document.createElement('th');
        this.col2Elem.innerText = '2';
        //this.theadElem.appendChild(this.col1Elem);
        //this.theadElem.appendChild(this.col2Elem);
        this.elem.appendChild(this.tableElem);
    }
    function _handleElemVisibility(elem, visible) {
        elem.classList.remove('remove');
        if (visible === false) {
            elem.classList.add('remove');
        }
    }
    function _insertColumn(parent, index) {
        var columnElem = index === 0 ? this.col1Elem : this.col2Elem,
            nextSibling = parent.childNodes[index + 1];
        // passing null to insertBefore will add the node at the end of its parent
        parent.insertBefore(columnElem, nextSibling instanceof Node ? nextSibling : null);
    }
    return CursorTable;
});
