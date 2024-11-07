define(function () {
    'use strict';
    var Gesture = function () {
        this.reset();
    }; 
    var p = Gesture.prototype;
    p.setStartX = function (startX) {
        this.startX = startX;
    };
    p.getStartX = function () {
        return this.startX;
    };
    p.setDeltaX = function (deltaX) {
        this.deltaX = deltaX / this.scaleFactor;
    };
    p.getDeltaX = function () {
        return this.deltaX;
    };
    p.setStartY = function (startY) {
        this.startY = startY;
    };
    p.getStartY = function () {
        return this.startY;
    };
    p.setDeltaY = function (deltaY) {
        this.deltaY = deltaY / this.scaleFactor;
    };
    p.getDeltaY = function () {
        return this.deltaY;
    };
    p.setScaleFactor = function (scaleFactor) {
        this.scaleFactor = scaleFactor;
    };
    p.getScaleFactor = function () {
        return this.scaleFactor;
    };
    p.setDeltaScale = function (deltaScale) {
        this.deltaScale = deltaScale;
    };
    p.getDeltaScale = function () {
        return this.deltaScale;
    };
    p.reset = function () {
        this.startX = 0;
        this.startY = 0;
        this.deltaY = 0;
        this.deltaX = 0;
        this.deltaScale = 0;
        this.scaleFactor = 1;
    };
    return Gesture;
});
