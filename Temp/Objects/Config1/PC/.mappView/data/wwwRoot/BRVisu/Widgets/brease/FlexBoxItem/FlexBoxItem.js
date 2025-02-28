define(['widgets/brease/GroupBox/GroupBox',
    'brease/decorators/LanguageDependency'
], function (SuperClass, languageDependency) {

    'use strict';

    /**
     * @class widgets.brease.FlexBoxItem
     * @extends widgets.brease.GroupBox
     * @iatMeta studio:isContainer
     * true
     *
     * @iatMeta category:Category
     * Container
     *
     * @iatMeta description:short
     * Container Widget
     * @iatMeta description:de
     * Flexibler Bereich innerhalb einer FlexBox, der je nach Konfiguration wachsen oder schrumpfen kann
     * @iatMeta description:en
     * Flexible area inside of a FlexBox, which can grow or shrink depending on the configuration
     */

    /**
     * @cfg {UNumber} sizeFactor=1
     * @bindable
     * @iatStudioExposed
     * @iatCategory Appearance
     * Factor used to distribute the free space in the parent container (FlexBox)
     */

    /**
     * @cfg {Integer} maxHeight
     * @hide
     */

    /**
     * @cfg {brease.enum.Direction} alignment
     * @hide
     */

    /**
     * @property {WidgetList} parents=["widgets.brease.FlexBox"]
     * @inheritdoc  
     */

    var defaultSettings = {
            sizeFactor: 1
        },

        WidgetClass = SuperClass.extend(function FlexBoxItem() {
            SuperClass.apply(this, arguments);
        }, defaultSettings),

        p = WidgetClass.prototype;

    p.init = function () {

        if (this.settings.omitClass !== true) {
            this.addInitialClass('breaseFlexBoxItem');
        }

        this.settings.omitClass = true;

        // call flexSizeChanged only once in an eventloop; e.g. at startup
        this.debouncedFlexSizeChanged = _.debounce(this._bind('flexSizeChanged'), 0, { leading: false });
        SuperClass.prototype.init.call(this);

        _addRemoveSizeChangedListener.call(this, 'add');
        _setSizeFactor(this);
    };

    // override method called in BaseWidget.init and defined in SuperClass GroupBox
    p._initEditor = function () {
        var widget = this;
        require(['widgets/brease/FlexBoxItem/libs/EditorHandles', 'brease/events/BreaseEvent'], function (EditorHandles, BreaseEvent) {
            var editorHandles = new EditorHandles(widget);
            widget.getHandles = function () {
                return editorHandles.getHandles();
            };
            // workaround
            widget.designer.getSelectionDecoratables = function () {
                return editorHandles.getSelectionDecoratables();
            };
            widget.dispatchEvent(new CustomEvent(BreaseEvent.WIDGET_EDITOR_IF_READY, { bubbles: true }));
        });
    };

    p.visibilityChangeHandler = function () {
        if (this.scroller && this.elem.hidden === false) {
            this.debouncedRefresh(); 
        }
    };
    
    p._visibleHandler = function () {
        this.debouncedFlexSizeChanged(true);
    };

    /**
     * @method setSizeFactor
     * @iatStudioExposed
     * Sets sizeFactor
     * @param {UNumber} sizeFactor
     */
    p.setSizeFactor = function (sizeFactor) {
        this.settings.sizeFactor = sizeFactor;
        _setSizeFactor(this);
    };

    /**
     * @method getSizeFactor
     * Returns sizeFactor.
     * @return {UNumber}
     */
    p.getSizeFactor = function () {
        return this.settings.sizeFactor;
    };

    p.flexSizeChanged = function (forwardChange) {
        if (this.elem) {
            this.dispatchEvent(new CustomEvent('FlexSizeChanged', { bubbles: true, detail: { forwardChange: forwardChange } })); 
        }
    };

    p.onBeforeDispose = function () {
        this.debouncedFlexSizeChanged.cancel();
        _addRemoveSizeChangedListener.call(this, 'remove');
        SuperClass.prototype.onBeforeDispose.apply(this, arguments);
    };

    p.onBeforeSuspend = function () {
        this.debouncedFlexSizeChanged.cancel();
        _addRemoveSizeChangedListener.call(this, 'remove');
        SuperClass.prototype.onBeforeSuspend.apply(this, arguments);
    };

    p.wake = function () {
        SuperClass.prototype.wake.apply(this, arguments);
        _addRemoveSizeChangedListener.call(this, 'add');
    };

    p._flexSizeChangedHandler = function (e) {
        if (e.target !== this.elem && e.detail.forwardChange) {
            this.flexSizeChanged(false); 
        }
    };

    //Private

    function _setSizeFactor(widget) {
        widget.el.css('flex-grow', widget.getSizeFactor());
        widget.debouncedFlexSizeChanged(true);
    }

    function _addRemoveSizeChangedListener(action) {
        action = (action === 'add') ? 'on' : 'off';
        this.el.closest('[data-brease-widget="widgets/brease/FlexBox"]')[action]('FlexSizeChanged', this._bind('_flexSizeChangedHandler'));
    }

    return languageDependency.decorate(WidgetClass, false);

});
