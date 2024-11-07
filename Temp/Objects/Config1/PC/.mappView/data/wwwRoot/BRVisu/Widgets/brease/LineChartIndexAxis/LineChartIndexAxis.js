define([
    'widgets/brease/ChartXAxisWidget/ChartXAxisWidget',
    'brease/decorators/LanguageDependency'
], function (SuperClass, languageDependency) {

    'use strict';

    /**
     * @class widgets.brease.LineChartIndexAxis
     * #Description
     * x-Axis for chart container to show index of historic data
     * @extends widgets.brease.ChartXAxisWidget
     * @iatMeta studio:isContainer
     * true
     * @iatMeta category:Category
     * Chart,Container
     *
     * @iatMeta description:short
     * X-Axis for LineChart container
     * @iatMeta description:de
     * X-Achse des LineChart Containers zur Anzeige der historischen Daten über Indizes
     * @iatMeta description:en
     * X-Axis for LineChart container to show index of historic data
     */

    /**
     * @property {WidgetList} children=["widgets.brease.LineChartXAxisIndexCursor"]
     * @inheritdoc  
     */

    /**
     * @property {WidgetList} parents=["widgets.brease.LineChart"]
     * @inheritdoc  
     */

    /**
     * @cfg {UInteger} minValue=0
     * @iatStudioExposed
     * @iatCategory Behavior
     * Minimum index for Axis
     */

    var defaultSettings = {
            minValue: 0,
            labelTextKey: undefined
        },

        WidgetClass = SuperClass.extend(function LineChartIndexAxis() {
            SuperClass.apply(this, arguments);
        }, defaultSettings),

        p = WidgetClass.prototype;

    p.init = function () {

        this.addInitialClass('breaseLineChartIndexAxis');

        this.axisType = 'index';

        SuperClass.prototype.init.call(this);

        if (brease.config.editMode !== true) {
            this.el.height(0);
        }

        this.setAxisLabel(this.getAxisLabel());
    };

    p._chartItemsReadyHandler = function () {

    };

    /**
     * @method setMinValue
     * Sets minimum value
     * @param {Number} value
     */
    p.setMinValue = function (value) {

        var self = this;

        $.when(this.allChartItemsInitializedDeferred).done(function () {
            self.settings.minValue = value;
            self._generateXPositions();
        });
    };

    /**
     * @method getMinValue 
     * Returns minimum value.
     * @return {Number}
     */
    p.getMinValue = function () {

        return this.settings.minValue;
    };

    /**
     * @method setAxisLabel
     * Sets Description text of axis
     * @param {String} axisLabel
     */
    p.setAxisLabel = function (axisLabel) {

        var self = this;

        $.when(this.allChartItemsInitializedDeferred).done(function () {
            var validLabelTextKeyFlag = true;

            if (brease.language.isKey(axisLabel) === false) {
                self.settings.axisLabel = axisLabel;
                self.settings.axisLabelTextKey = undefined;
            } else {
                validLabelTextKeyFlag = self.setPropertyKey(brease.language.parseKey(axisLabel), 'axisLabel');
            }

            if (brease.config.editMode) {
                self.editorGrid.configuration.axisLabel = self.settings.axisLabel;
                self.editorGrid.updateAxis();
            } else if (validLabelTextKeyFlag) {
                self._isDirty();
                self.chartWidget._valueListIsDirty();
            }
        });
    };

    /**
     * @method getAxisLabel
     * Returns Description text of axis
     * @return {String}
     */
    p.getAxisLabel = function () {

        return this.settings.axisLabel;
    };

    p.setPropertyKey = function (key, property) {

        if (key !== undefined) {
            this.settings[property + 'TextKey'] = key;
            this.setLangDependency(true);
            var textFromTextKey = brease.language.getTextByKey(this.settings[property + 'TextKey']);
            if (textFromTextKey !== 'undefined key') {
                this.settings[property] = textFromTextKey;
                return true;
            } else {
                console.iatWarn(this.elem.id + ': ' + property + ' textKey not found: ' + key);
                return false;
            }
        } else {
            this.settings[property + 'TextKey'] = undefined;
            console.iatWarn(this.elem.id + ': The text key is not valid : ' + key);
            return false;
        }
    };

    p.currentFormat = function () {

        return { decimalPlaces: 0, minimumIntegerDigits: 1 };
    };

    p.langChangeHandler = function (e) {

        if (e === undefined || e.detail === undefined ||
            e.detail.textkey === undefined ||
            e.detail.textkey === this.settings.formatTextKey ||
            e.detail.textkey === this.settings.axisLabelTextKey) {

            if (this.settings.formatTextKey !== undefined) {
                this.setPropertyKey(this.settings.formatTextKey, 'format');
            }

            if (this.settings.axisLabelTextKey !== undefined) {
                this.setPropertyKey(this.settings.axisLabelTextKey, 'axisLabel');
            }

            if ((this.settings.formatTextKey !== undefined) || (this.settings.axisLabelTextKey !== undefined)) {
                this._isDirty();
                this.chartWidget._valueListIsDirty();
                this.chartWidget._cursorIsDirty();
            }
        }
    };

    p._registerGraphArraySize = function (widgetId, size) {
        var oldMaxArraySize = this.data.maxArraySize;

        SuperClass.prototype._registerGraphArraySize.apply(this, arguments);

        if (oldMaxArraySize !== this.data.maxArraySize) {
            this._generateXPositions();
        }

        this._isDirty();
    };

    p._getMinValue = function () {

        return this.getMinValue();
    };

    p._getMaxValue = function () {

        return this.getMinValue() + this.data.maxArraySize - 1;
    };

    p._xPositions = function () {

        return this.data.xPositions;
    };

    p._getAxisType = function () {

        return this.axisType;
    };

    p._generateXPositions = function () {

        this.data.xPositions = [];

        for (var i = this._getMinValue(); i <= this._getMaxValue(); i += 1) {

            this.data.xPositions.push(i);
        }
    };

    p.dispose = function () {

        SuperClass.prototype.dispose.apply(this, arguments);
    };

    return languageDependency.decorate(WidgetClass, true);
});
