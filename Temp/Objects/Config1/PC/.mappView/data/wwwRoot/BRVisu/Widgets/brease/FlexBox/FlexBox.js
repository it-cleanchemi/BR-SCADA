define(['brease/core/ContainerWidget',
    'brease/enum/Enum',
    'brease/decorators/DragAndDropCapability',
    'widgets/brease/common/DragDropProperties/libs/DroppablePropertiesEvents'
], function (SuperClass, Enum, dragAndDropCapability) {

    'use strict';

    /**
     * @class widgets.brease.FlexBox
     * #Description
     * widget to group widgets with Label.   
     * @breaseNote 
     * @extends brease.core.ContainerWidget
     * @iatMeta studio:license
     * licensed
     * @iatMeta studio:isContainer
     * true
     *
     * @mixins widgets.brease.common.DragDropProperties.libs.DroppablePropertiesEvents
     *
     * @iatMeta category:Category
     * Container
     * @iatMeta description:short
     * Container Widget
     * @iatMeta description:de
     * Definiert einen Bereich in dem ein FlexBoxItem Widget platziert werden kann
     * @iatMeta description:en
     * Defines an area in which a FlexBoxItem widget can be placed
     */

    /**
     * @cfg {brease.enum.Direction} alignment='vertical'
     * @iatStudioExposed
     * @iatCategory Appearance
     * Alignment of the FlexBoxItems
     * horizontal: elements aligned from left to right.
     * vertical: elements aligned from top to bottom.
     */

    /**
     * @cfg {UInteger} transitionTime=0
     * @iatStudioExposed
     * @iatCategory Behavior
     * Animation time (in ms) for the transition on size change of items - 0 disabled
     */

    /**
     * @property {WidgetList} children=["widgets.brease.FlexBoxItem"]
     * @inheritdoc  
     */

    var defaultSettings = {
            alignment: Enum.Direction.vertical,
            transitionTime: 0
        },

        WidgetClass = SuperClass.extend(function FlexBox() {
            SuperClass.apply(this, arguments);
        }, defaultSettings),

        p = WidgetClass.prototype;

    p.init = function () {

        if (this.settings.omitClass !== true) {
            this.addInitialClass('breaseFlexBox');
        }

        SuperClass.prototype.init.call(this);

        _setAlignmentClass(this);

        _applyTransitionTime(this);

    };

    /**
     * @method setAlignment
     * Sets alignment
     * @param {brease.enum.Direction} alignment
     */
    p.setAlignment = function (alignment) {
        this.settings.alignment = alignment;
        _setAlignmentClass(this);
    };

    /**
     * @method getAlignment 
     * Returns alignment.
     * @return {brease.enum.Direction}
     */
    p.getAlignment = function () {
        return this.settings.alignment;
    };

    /**
     * @method setTransitionTime
     * Sets the transition time
     * @param {UInteger} transitionTime
     */
    p.setTransitionTime = function (transitionTime) {
        this.settings.transitionTime = transitionTime;
        _applyTransitionTime(this);
    };

    /**
     * @method getTransitionTime 
     * Returns the transition time
     * @return {UInteger}
     */
    p.getTransitionTime = function () {
        return this.settings.transitionTime;
    };

    // override method called in BaseWidget.init
    p._initEditor = function () {
        var widget = this;
        require(['widgets/brease/FlexBox/libs/EditorHandles', 'brease/events/BreaseEvent'], function (EditorHandles, BreaseEvent) {
            var editorHandles = new EditorHandles(widget);
            widget.getHandles = function () {
                return editorHandles.getHandles();
            };
            widget.dispatchEvent(new CustomEvent(BreaseEvent.WIDGET_EDITOR_IF_READY, { bubbles: true }));
        });
    };

    //Private

    function _setAlignmentClass(widget) {
        widget.container.removeClass('vertical horizontal');
        if (widget.settings.alignment === Enum.Direction.horizontal) {
            widget.container.addClass('horizontal');
        } else {
            widget.container.addClass('vertical');
        }
    }

    function _applyTransitionTime(widget) {
        if (brease.config.editMode) { return; }
        var selector = '#' + widget.elem.id + '> .container';
        $(selector).children().each(function () {
            if ($(this).attr('data-brease-widget') === 'widgets/brease/FlexBoxItem') {
                $(this).css('transition', 'flex-grow ' + widget.getTransitionTime() / 1000 + 's');
            }
        });
    }

    return dragAndDropCapability.decorate(WidgetClass, false);

});
