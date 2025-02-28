define([
    'brease/core/BaseWidget',
    'brease/datatype/ZoomType',
    'brease/events/BreaseEvent',
    'brease/core/libs/Deferred',
    'brease/core/Utils',
    'brease/decorators/DragAndDropCapability',
    'brease/controller/libs/ScrollManager',
    'widgets/brease/common/libs/HideableWidgetState',
    'widgets/brease/common/libs/HideableWidgetEvents',
    'widgets/brease/common/DragDropProperties/libs/DroppablePropertiesEvents'
], function (SuperClass, ZoomType, BreaseEvent, Deferred, Utils, dragAndDropCapability, ScrollManager, 
    HideableWidgetState, HideableWidgetEvents) {

    'use strict';

    /**
     * @class widgets.brease.ContentControl
     * #Description  
     * Widget to load a content
     * @breaseNote 
     * @extends brease.core.BaseWidget
     * @mixins widgets.brease.common.DragDropProperties.libs.DroppablePropertiesEvents
     *
     * @iatMeta category:Category
     * System
     * @iatMeta description:short
     * Widget to load a content
     * @iatMeta description:de
     * Das ContentControl-Widget ermöglicht das Laden eines Contents in einem Widget
     * @iatMeta description:en
     * The widget provides an optional configurable contentId property where the user can reference a content which is loaded when the widget is shown on the client
     */

    /**
     * @property {WidgetList} parents=["widgets.brease.GroupBox","widgets.brease.TabItem","widgets.brease.FlexBoxItem","widgets.brease.InfoBanner","widgets.brease.FlyOut"]
     * @inheritdoc  
     */

    /**
     * @cfg {ContentReference} contentId=''
     * reference to a content; this content is loaded immediately
     * @iatStudioExposed
     * @iatCategory Behavior 
     */

    /**
     * @cfg {ZoomType} zoomMode='original'
     * @iatStudioExposed
     * @iatCategory Behavior 
     */

    /**
     * @cfg {Boolean} deactivate=false
     * defines, if the loaded content is deactivated, when the widget is not shown
     * @iatStudioExposed
     * @iatCategory Behavior 
     */

    /**
     * @cfg {StyleReference} style
     * @hide
     */
    /**
     * @cfg {Boolean} enable
     * @hide
     */
    /**
     * @cfg {Boolean} omitClass
     * @hide 
     */
    /**
     * @cfg {RoleCollection} permissionOperate
     * @hide 
     */

    /**
     * @cfg {String} tooltip=''
     * @hide
     */

    /**
     * @method showTooltip
     * @hide
     */

    /**
     * @method setEnable
     * @hide
     */
    /**
     * @method setStyle
     * @hide
     */
    /**
     * @event EnableChanged
     * @hide
     */
    /**
     * @event Click
     * @hide
     */
    /**
     * @event DisabledClick
     * @hide
     */

    /**
     * @cfg {Integer} tabIndex=-1
     * @hide
     */
    
    var NO_CONTENT_VALUE = '',
        defaultSettings = {
            contentId: NO_CONTENT_VALUE,
            zoomMode: ZoomType.original,
            deactivate: false
        },

        WidgetClass = SuperClass.extend(function ContentControl() {
            SuperClass.apply(this, arguments);
        }, defaultSettings),

        p = WidgetClass.prototype;

    WidgetClass.NO_CONTENT_VALUE = NO_CONTENT_VALUE;

    p.init = function () {
        this.data = {
            contentId: '' // data.contentId is assigned when the content is loaded so the method getContentId
            // will return no content value if widget is initially hidden and deactivate is set to true
        };   
        this.internalData.parentWidgetState = HideableWidgetState.OPEN;
        this.el.attr('data-brease-layoutId', this.elem.id);

        if (brease.config.editMode === true) {
            SuperClass.prototype.init.apply(this, arguments);
            _addPlaceholderImage.call(this);
        } else {
            SuperClass.prototype.init.call(this, true);
        }
    };

    /**
     * @method loadContent
     * @iatStudioExposed
     * Asynchronous method to load a content into the widget.  
     * @param {ContentReference} contentId id of content  
     * @return {brease.core.libs.Deferred}  
     * If actions (=method with iatStudioExposed) use a deferred object as return value, ActionController expects the deferred object to be resolved in any case.  
     * Return values in deferred.resolve(success, result) are:  
     * {Boolean} success: indicator if method was successful  
     * {Boolean} result: the actual return value of the method (in our case result == success)  
     * {Object} contentData: additional info about contents to be activated or deactivated  
     * {ContentReference[]} contentData.activate: contents to be activated  
     * {ContentReference[]} contentData.deactivate: contents to be deactivated  
     */
    p.loadContent = function (contentId, force) {
        var widget = this,
            def = new Deferred(Deferred.TYPE_SINGLE);

        if (brease.config.preLoadingState === true) {
            def.resolve(false, false);
            console.warn('client in preloading state -> "ContentControl.loadContent" rejected');
        } else {
            if (contentId !== NO_CONTENT_VALUE && contentId !== this.data.contentInProcess) {
                var hasUnreliableDimension = this.isHidden && _hasSizeDependentContent.call(this);
                if (this.size === undefined) {
                    _updateSize.call(this);
                }
                this.settings.contentId = contentId;
                this.data.previousState = undefined;
                this.data.contentInProcess = contentId;
                brease.pageController.loadContentInWidget(this.elem.id, contentId, this.settings.parentContentId, this.settings.zoomMode, this.size, _findLayoutArea.call(this), force).done(function successHandler(success, areaId) {
                    widget.data.contentInProcess = undefined;
                    //console.log('successHandler:', success, areaId)
                    if (areaId) {
                        widget.settings.areaId = areaId;
                    }
                    if (hasUnreliableDimension) {
                        widget.size = undefined;
                    }
                    widget.loader = _findContentLoader.call(widget);
                    if (success === true) {
                        widget.data.contentId = contentId;
                        if (hasUnreliableDimension && !widget.isHidden) {
                            _updateContentSize.call(widget);
                        }
                        def.resolve(true, true, { activate: [contentId] });
                    } else {
                        def.resolve(false, false);
                    }
                    widget.startRefresh();
                });
            } else {
                def.resolve(false, false);
            }
        }

        return def;
    };

    /**
     * @method unloadContent
     * @iatStudioExposed
     * Asynchronous method to unload the current content of the widget.  
     * @return {brease.core.libs.Deferred}  
     * If actions (=method with iatStudioExposed) use a deferred object as return value, ActionController expects the deferred object to be resolved in any case.  
     * Return values in deferred.resolve(success, result, contentData) are:  
     * {Boolean} success: indicator if method was successful  
     * {Boolean} result: the actual return value of the method (in our case result == success)  
     * {Object} contentData: additional info about contents to be activated or deactivated  
     * {ContentReference[]} contentData.activate: contents to be activated  
     * {ContentReference[]} contentData.deactivate: contents to be deactivated  
     */
    p.unloadContent = function () {
        var def = new Deferred(Deferred.TYPE_SINGLE),
            oldContentId = this.data.contentId;

        this.loader = undefined;
        this.data.contentId = NO_CONTENT_VALUE;
        this.settings.contentId = NO_CONTENT_VALUE;
        var $areaDiv = _findLayoutArea.call(this);
        if ($areaDiv.length > 0) {
            brease.pageController.emptyContainer($areaDiv[0]);
            ScrollManager.remove($areaDiv[0].id);
        }
        def.resolve(true, true, { deactivate: [oldContentId] });
        return def;
    };

    /**
     * @method getContentId
     * @iatStudioExposed
     * Returns the contentId of the current loaded content.  
     * Returns empty string, if no content is loaded.  
     * @return {ContentReference}
     */
    p.getContentId = function () {
        return this.data.contentId;
    };

    // property is not bindable and widget does not display content in edit mode: this would mean that we don't need a setter
    // but property can be set via a CompoundWidget
    p.setContentId = function (value) {
        var widget = this;
        this.settings.contentId = value;
        // if content is not yet loaded via initialValues, but set via CompoundWidget
        if (brease.config.preLoadingState !== true) {
            if (!this.loader && this.settings.contentId !== NO_CONTENT_VALUE) {
                window.setTimeout(function () {
                    widget.loadContent(widget.settings.contentId);
                }, 0); // workaround if both, contentId and zoomMode are set via a CompoundWidget
            }
        }
    };

    p.setZoomMode = function (value) {
        this.settings.zoomMode = value;
    };

    p.setDeactivate = function (value) {
        this.settings.deactivate = value;
    };

    p.dispose = function () {
        document.body.removeEventListener(BreaseEvent.FRAGMENT_SHOW, this._bind('_onFragmentShow'));
        this.resetTimer();
        this.loader = undefined;
        _disposeObservation.call(this);
        brease.pageController.disposeContentInWidget(this.elem.id);
        SuperClass.prototype.dispose.apply(this, arguments);
    };

    p.suspend = function () {
        //console.log('%c' + this.elem.id + '.suspend', 'color:#cc00cc;');
        document.body.removeEventListener(BreaseEvent.FRAGMENT_SHOW, this._bind('_onFragmentShow'));
        this.resetTimer();
        this.data.previousState = undefined;
        _pauseObservation.call(this);
        _suspendLoader.call(this);
        SuperClass.prototype.suspend.apply(this, arguments);
    };

    p.wake = function () {
        //console.log('%c' + this.elem.id + '.wake,hidden:' + this.isHidden + ',deactivate:' + this.settings.deactivate, 'color:#00cccc;');
        if (this.internalData.preLoaded === true) {
            this.internalData.preLoaded = false;
            _showInitialValues.call(this);
        } else {
            if (this.isAllowedToLoad()) {
                if (this.loader) {
                    _wakeLoader.call(this);
                } else if (this.settings.contentId) {
                    this.loadContent(this.settings.contentId);
                }
            }
            _startObservation.call(this);
        }
        this.data.previousState = undefined;
        SuperClass.prototype.wake.apply(this, arguments);
    };

    p.reset = function () {
        this.loader = undefined;
        if (!this.data.previousState) {
            this.data.previousState = {
                contentId: this.settings.contentId,
                loadedContentId: this.data.contentId,
                state: this.state
            };
        }
        this.data.contentId = NO_CONTENT_VALUE;
        this.resetTimer();
    };

    p.getPreviousState = function () {
        return this.data.previousState;
    };

    p.startRefresh = function () {
        if (brease.config.editMode !== true) {
            this.resetTimer();
            this.timer = window.setTimeout(this._bind('refreshContentScroller'), 100);
        }
    };

    p.refreshContentScroller = function () {
        if (!this.isHidden) {
            //console.log(this.elem.id + '.refreshContentScroller');
            brease.pageController.refreshArea(this.settings.areaId);
        }
    };

    p.resetTimer = function () {
        window.clearTimeout(this.timer);
    };

    /**
     * @event VisibilityChanged
     * Fired when visibility of widget changes.
     * @iatStudioExposed
     * @param {Boolean} visibility
     * @deprecated 5.24 This event will be removed in mapp View 6.0; use VisibleChanged event instead!
     * @eventComment
     */
    p.updateVisibility = function () {
        var oldValue = this.isHidden;
        SuperClass.prototype.updateVisibility.apply(this, arguments);
        if (oldValue !== this.isHidden) {
            this.dispatchServerEvent('VisibilityChanged', { visibility: !this.isHidden });
            //suspend loader if deactivate is true and widget is hidden
            if (!this.isAllowedToLoad()) {
                _suspendLoader.call(this);
            } else {
                if (!this.isHidden && this.size === undefined && this.getContentId() !== NO_CONTENT_VALUE) {
                    _updateContentSize.call(this);
                }
                _wakeLoader.call(this);
            }
            if (!this.isHidden) {
                this.startRefresh();
            }
        }
    };

    p._clickHandler = function () {

    };

    p._initialValueHandling = function () {
        SuperClass.prototype._initialValueHandling.apply(this, arguments);

        if (brease.config.preLoadingState === true) {
            this._defer('_dispatchReady'); // we have to defer the call, otherwise the widgetcontroller would change state to initialized
        } else {
            //A&P 658680 zoom mode not applied correctly if widget size is defined in %
            if (_hasPercentageWidth.call(this) || _hasPercentageHeight.call(this)) {
                //_showInitialValues.call(this);
                document.body.addEventListener(BreaseEvent.FRAGMENT_SHOW, this._bind('_onFragmentShow'));
            } else {
                _showInitialValues.call(this);
            }

            this._defer('_dispatchReady');
        }
    };

    p._onFragmentShow = function (e) {
        if (e.detail.contentId === this.settings.parentContentId) {
            _showInitialValues.call(this);
            document.body.removeEventListener(BreaseEvent.FRAGMENT_SHOW, this._bind('_onFragmentShow'));
        }
    };

    p.isAllowedToLoad = function () {
        return _isVisible.call(this) === true || this.getSettings().deactivate === false;
    };

    function _isVisible() {
        return this.isVisible() && this.internalData.parentWidgetState === HideableWidgetState.OPEN;
    }

    function findParentHideableWidget() {
        if (!this.internalData.parentWidgetChecked) {
            this.internalData.parentWidgetChecked = true;
            // currently FlyOut and InfoBanner are breaseHideableContentControlContainer
            var parentHideableWidgetElem = this.elem.closest('.breaseHideableContentControlContainer');
            if (parentHideableWidgetElem) {
                // if we find the flyOutwrapper, we have to search for the corresponding widget elem
                if (!Utils.hasClass(parentHideableWidgetElem, 'breaseWidget')) {
                    var parentWidgetId = $(parentHideableWidgetElem).data('widgetid');
                    parentHideableWidgetElem = document.getElementById(parentWidgetId);
                } 
                if (parentHideableWidgetElem) {
                    parentHideableWidgetElem.addEventListener(HideableWidgetEvents.CLOSED, setParentWidgetState.bind(this));
                    parentHideableWidgetElem.addEventListener(HideableWidgetEvents.BEFORE_OPEN, setParentWidgetState.bind(this));
                    this.internalData.parentWidgetType = parentHideableWidgetElem.getAttribute('data-brease-widget');
                    const parentWidget = brease.callWidget(parentHideableWidgetElem.id, 'widget');
                    if (parentWidget) {
                        this.internalData.parentWidgetState = (parentWidget.internal.state === HideableWidgetState.CLOSED) ? HideableWidgetState.CLOSED : HideableWidgetState.OPEN; 
                    }
                }
            } 
        }
    }

    function setParentWidgetState(e) {
        if (e.type === HideableWidgetEvents.CLOSED) {
            this.internalData.parentWidgetState = HideableWidgetState.CLOSED;
            if (this.getSettings().deactivate === true) {
                _suspendLoader.call(this);
            } 
        }
        if (e.type === HideableWidgetEvents.BEFORE_OPEN) {
            this.internalData.parentWidgetState = HideableWidgetState.OPEN;
            if (this.getSettings().deactivate === true && this.isVisible()) {
                _wakeLoader.call(this);
            } 
        }
    }

    function _showInitialValues() {
        //prevent the widget from loading the configured content if its not allowed to (=deactivate is true and the widget is hidden)
        //(called when wake method is invoked after preloading) 
        
        findParentHideableWidget.call(this);
        if (!this.isAllowedToLoad()) {
            return;
        }
        if (this.settings.contentId !== NO_CONTENT_VALUE) {
            this.loadContent(this.settings.contentId);
            _addResizeObservation.call(this);
        }
    }

    function _findContentLoader() {
        var loader = this.elem.querySelector('.systemContentLoader');
        if (loader !== null) {
            return brease.callWidget(loader.id, 'widget');
        } else {
            return undefined;
        }
    }

    function _findLayoutArea() {
        return this.el.find('> .LayoutArea');
    }

    function _suspendLoader() {
        if (this.loader && this.loader.suspended !== true) {
            this.loader.onBeforeSuspend();
            this.loader.suspend();
        }
    }

    function _wakeLoader() {
        // _wakeLoader might be called from updateVisibility method during preloading
        // so the ContentLoader is created if not in preloading state anymore
        if (this.loader && this.loader.suspended === true) {
            this.loader.wake();
        } else if (!brease.config.preLoadingState && !this.loader) {
            //create loader if widget was initially hidden and preloadingState is not active 
            _showInitialValues.call(this);
        }
    }

    function _addPlaceholderImage() {
        this.el.css({
            'background-image': 'url("widgets/brease/ContentControl/assets/EditorPlaceholder.svg")',
            'background-repeat': 'no-repeat',
            'background-position': 'center center',
            'background-size': 'contain'
        });
    }

    function _disposeObservation() {
        if (this.observer) {
            this.observer.disconnect();
            this.observer = undefined;
        } else if (this.parentFlexBox) {
            this.parentFlexBox.removeEventListener(BreaseEvent.VISIBILITY_CHANGED, this._bind(_visibilityChangeListener), true);
            this.parentFlexBox = undefined;
        }
    }

    function _pauseObservation() {
        if (this.observer) {
            this.observer.unobserve(this.elem);
        } else if (this.parentFlexBox) {
            this.parentFlexBox.removeEventListener(BreaseEvent.VISIBILITY_CHANGED, this._bind(_visibilityChangeListener), true);
        }
    }

    function _startObservation() {
        if (this.observer) {
            this.observer.observe(this.elem);
        } else if (this.parentFlexBox) {
            this.parentFlexBox.addEventListener(BreaseEvent.VISIBILITY_CHANGED, this._bind(_visibilityChangeListener), true);
        }
    }

    function _needsObservation(parentType) {
        return parentType === 'widgets/brease/FlexBoxItem' || 
                parentType === 'widgets/brease/TabItem' || 
                (parentType === 'widgets/brease/FlyOut' && _hasSizeDependentContent.call(this) && this.settings.deactivate === false);
    }

    function _getParentWidgetType(widgetParents) {
        var parentType;
        if (this.internalData.parentWidgetType) {
            // if we already found a parentHideableWidget, we take its type
            parentType = this.internalData.parentWidgetType;
        } else {
            // otherwise take parent widget
            var parentWidgetEl = widgetParents.eq(0);
            parentType = parentWidgetEl.data('brease-widget');
        }
        return parentType;
    }

    function _addResizeObservation() {
        var alreadyAdded = !!this.observer || !!this.parentFlexBox;
        if (!alreadyAdded) {
            var widgetParents = this.el.parents('[data-brease-widget]'),
                parentType = _getParentWidgetType.call(this, widgetParents);
            if (_needsObservation.call(this, parentType)) {
                if (typeof window.ResizeObserver === 'function') {
                    this.observer = new ResizeObserver(this._bind(_resizeListener)); 
                } else {
                    this.parentFlexBox = widgetParents.eq(1)[0]; 
                }
                _startObservation.call(this);
            } 
        }
    }

    function _visibilityChangeListener() {
        this.startRefresh();
    }

    function _resizeListener(entries) {
        if (entries[0].target.id === this.elem.id && entries[0].contentRect.width > 0) {
            this.startRefresh();
            _updateContentSize.call(this);
        }
    }

    // updates the scalefactor and the dimension of the loaded content if size values were unreliable due to 
    // widget not being visible and width or height was defined in % and zoomType.cover or zoomType.contain is used
    function _updateContentSize() {
        var oldSize = {
            width: (this.size) ? this.size.realWidth : undefined,
            height: (this.size) ? this.size.realHeight : undefined
        };
        _updateSize.call(this);
        if (oldSize.width !== this.size.realWidth || oldSize.height !== this.size.realHeight) {
            brease.pageController.updateContentSizeInWidget(this.elem.id, this.size);
            // as a FlyOut is not resizable like a FlexBoxItem, we only need one update of content size
            if (this.internalData.parentWidgetType === 'widgets/brease/FlyOut') {
                _disposeObservation.call(this);
            }
        }
    }

    function _updateSize() {
        var dimension = Utils.getDimension(this.el),
            realWidth = dimension.width,
            realHeight = dimension.height;

        this.size = {
            cssWidth: _hasPercentageWidth.call(this) ? '100%' : '' + realWidth,
            cssHeight: _hasPercentageHeight.call(this) ? '100%' : '' + realHeight,
            realWidth: realWidth,
            realHeight: realHeight
        };
    }

    // used to detect if the size of the widget needs to be updated in order to scale the loaded content correctly
    function _hasSizeDependentContent() {
        return this.settings.zoomMode !== ZoomType.original && (_hasPercentageWidth.call(this) || _hasPercentageHeight.call(this));
    }

    function _hasPercentageHeight() {
        return (this.settings.height + '').indexOf('%') !== -1;
    }

    function _hasPercentageWidth() {
        return (this.settings.width + '').indexOf('%') !== -1;
    }

    return dragAndDropCapability.decorate(WidgetClass, false);

});
