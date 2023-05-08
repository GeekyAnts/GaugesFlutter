import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

import '../../../geekyants_flutter_gauges.dart';
import '../linear_gauge_label.dart';

class RenderRulers extends RenderBox {
  RenderRulers({
    required double thickness,
    required List<RangeLinearGauge> rangeLinearGauge,
    required GaugeOrientation gaugeOrientation,
    required Animation<double>? gaugeAnimation,
    required double primaryRulersWidth,
    required double primaryRulersHeight,
    required double secondaryRulersHeight,
    required double secondaryRulersWidth,
    required Color primaryRulerColor,
    required Color secondaryRulerColor,
    required double secondaryRulerPerInterval,
    required RulerPosition rulerPosition,
    required bool showSecondaryRulers,
    required bool showPrimaryRulers,
    required double rulersOffset,
    required bool inversedRulers,
    required bool fillExtend,
    required double extendLinearGauge,
  })  : _gaugeOrientation = gaugeOrientation,
        _gaugeAnimation = gaugeAnimation,
        _primaryRulersWidth = primaryRulersWidth,
        _primaryRulersHeight = primaryRulersHeight,
        _secondaryRulersWidth = secondaryRulersWidth,
        _secondaryRulersHeight = secondaryRulersHeight,
        _primaryRulerColor = primaryRulerColor,
        _secondaryRulerColor = secondaryRulerColor,
        _secondaryRulerPerInterval = secondaryRulerPerInterval,
        _rulerPosition = rulerPosition,
        _rulersOffset = rulersOffset,
        _thickness = thickness,
        _inversedRulers = inversedRulers,
        _rangeLinearGauge = rangeLinearGauge,
        _showPrimaryRulers = showPrimaryRulers,
        _showSecondaryRulers = showSecondaryRulers,
        _extendLinearGauge = extendLinearGauge,
        _isHorizontalOrientation =
            gaugeOrientation == GaugeOrientation.horizontal,
        _fillExtend = fillExtend;

  late bool _isHorizontalOrientation;
  final Paint _primaryRulersPaint = Paint();
  final Paint _secondaryRulersPaint = Paint();
  late double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;
  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();

  ///
  /// Getter and Setter for the [_thickness] parameter.
  ///
  double get getThickness => _thickness;
  double _thickness;
  set setThickness(double val) {
    if (_thickness == val) return;
    _thickness = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [rangeLinearGauge] parameter.
  ///
  List<RangeLinearGauge>? get rangeLinearGauge => _rangeLinearGauge;
  List<RangeLinearGauge>? _rangeLinearGauge = <RangeLinearGauge>[];
  set setRangeLinearGauge(List<RangeLinearGauge>? val) {
    if (_rangeLinearGauge == val) return;
    _rangeLinearGauge = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_gaugeAnimation] parameter.
  ///
  Animation<double>? get getGaugeAnimation => _gaugeAnimation;
  Animation<double>? _gaugeAnimation;
  set setGaugeAnimation(Animation<double>? gaugeAnimation) {
    if (_gaugeAnimation == gaugeAnimation) return;
    _gaugeAnimation = gaugeAnimation;
    _removeAnimationListeners();
    _addAnimationListener();
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_gaugeOrientation] parameter.
  ///
  get getGaugeOrientation => _gaugeOrientation;
  GaugeOrientation _gaugeOrientation;

  set setGaugeOrientation(gaugeOrientation) {
    _isHorizontalOrientation = gaugeOrientation == GaugeOrientation.horizontal;

    if (_gaugeOrientation == gaugeOrientation) return;

    _gaugeOrientation = gaugeOrientation;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_primaryRulersWidth] parameter.
  ///
  get getPrimaryRulersWidth => _primaryRulersWidth;
  double _primaryRulersWidth;
  set setPrimaryRulersWidth(primaryRulersWidth) {
    if (_primaryRulersWidth == primaryRulersWidth) return;

    _primaryRulersWidth = primaryRulersWidth;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_primaryRulersHeight] parameter.
  ///
  get getPrimaryRulersHeight => _primaryRulersHeight;

  double _primaryRulersHeight;

  set setPrimaryRulersHeight(primaryRulersHeight) {
    if (_primaryRulersHeight == primaryRulersHeight) return;

    _primaryRulersHeight = primaryRulersHeight;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_secondaryRulersHeight] parameter.
  ///

  get getSecondaryRulersHeight => _secondaryRulersHeight;

  double _secondaryRulersHeight;

  set setSecondaryRulersHeight(secondaryRulersHeight) {
    if (_secondaryRulersHeight == secondaryRulersHeight) return;

    _secondaryRulersHeight = secondaryRulersHeight;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_secondaryRulersWidth] parameter.
  ///
  get getSecondaryRulersWidth => _secondaryRulersWidth;
  double _secondaryRulersWidth;
  set setSecondaryRulersWidth(secondaryRulersWidth) {
    if (_secondaryRulersWidth == secondaryRulersWidth) return;

    _secondaryRulersWidth = secondaryRulersWidth;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_primaryRulerColor] parameter.
  ///
  Color get getPrimaryRulerColor => _primaryRulerColor;
  Color _primaryRulerColor;

  set setPrimaryRulerColor(primaryRulerColor) {
    if (_primaryRulerColor == primaryRulerColor) return;
    _primaryRulerColor = primaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_secondaryRulerColor] parameter.
  ///
  Color get getSecondaryRulerColor => _secondaryRulerColor;
  Color _secondaryRulerColor;

  set setSecondaryRulerColor(secondaryRulerColor) {
    if (_secondaryRulerColor == secondaryRulerColor) return;
    _secondaryRulerColor = secondaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_secondaryRulerPerInterval] parameter.
  ///
  double get getSecondaryRulerPerInterval => _secondaryRulerPerInterval;
  double _secondaryRulerPerInterval;

  set setSecondaryRulerPerInterval(secondaryRulerPerInterval) {
    if (_secondaryRulerPerInterval == secondaryRulerPerInterval) {
      return;
    }
    _secondaryRulerPerInterval = secondaryRulerPerInterval;
    markNeedsPaint();
  }

  bool get fillExtend => _fillExtend;
  bool _fillExtend;
  set setFillExtend(bool val) {
    if (_fillExtend == val) return;
    _fillExtend = val;
    markNeedsPaint();
  }

  RulerPosition get rulerPosition => _rulerPosition;
  RulerPosition _rulerPosition;
  set setRulerPosition(RulerPosition val) {
    if (_rulerPosition == val) return;
    _rulerPosition = val;
    markNeedsLayout();
  }

  bool get showSecondaryRulers => _showSecondaryRulers;
  bool _showSecondaryRulers;
  set setShowSecondaryRulers(bool val) {
    if (_showSecondaryRulers == val) return;
    _showSecondaryRulers = val;
    markNeedsPaint();
  }

  bool get showPrimaryRulers => _showPrimaryRulers;
  bool _showPrimaryRulers;
  set setShowPrimaryRulers(bool val) {
    if (_showPrimaryRulers == val) return;
    _showPrimaryRulers = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_rulersOffset] parameter.
  ///

  double get getRulersOffset => _rulersOffset;
  double _rulersOffset;
  set setRulersOffset(double val) {
    if (_rulersOffset == val) return;
    _rulersOffset = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_inversedRulers] parameter.
  ///

  bool get getInversedRulers => _inversedRulers;
  bool _inversedRulers;
  set setInversedRulers(bool val) {
    if (_inversedRulers == val) return;
    _inversedRulers = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_extendLinearGauge] parameter.
  ///
  double get getExtendLinearGauge => _extendLinearGauge;
  double _extendLinearGauge;
  set setExtendLinearGauge(double val) {
    if (_extendLinearGauge == val) return;
    _extendLinearGauge = val;
    markNeedsPaint();
  }

  void _addAnimationListener() {
    if (_gaugeAnimation != null) {
      _gaugeAnimation!.addListener(markNeedsPaint);
    }
  }

  void _removeAnimationListeners() {
    if (_gaugeAnimation != null) {
      _gaugeAnimation!.removeListener(markNeedsPaint);
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _addAnimationListener();
  }

  @override
  void detach() {
    _removeAnimationListeners();
    super.detach();
  }

  void _setPrimaryRulersPaint() {
    _primaryRulersPaint.color = getPrimaryRulerColor;
    _primaryRulersPaint.strokeWidth = getPrimaryRulersWidth;
  }

  void _setSecondaryRulersPaint() {
    _secondaryRulersPaint.color = getSecondaryRulerColor;
    _secondaryRulersPaint.strokeWidth = getSecondaryRulersWidth;
  }

  void _drawPrimaryRulers(Canvas canvas, Offset offset) {
    _linearGaugeLabel.getPrimaryRulersOffset.forEach((key, value) {
      double? y;
      double? x;
      Offset? primaryRulerStartPoint;
      Color? primaryRulerColor = getPrimaryRulerColor;

      for (int i = 0; i < rangeLinearGauge!.length; i++) {
        var range = rangeLinearGauge![i].end;
        var offset = double.parse(key);
        if (offset >= rangeLinearGauge![i].start && offset <= range) {
          primaryRulerColor = rangeLinearGauge![i].color;
          break;
        }
      }
      switch (rulerPosition) {
        case RulerPosition.top:
          //y co-ordinate will be simply inverted on negative side by adding -ve sign
          //no need to adjust y co-ordinate by adding the height of gauge container
          y = -(value[1].dy + getRulersOffset - yAxisForGaugeContainer);
          x = value[1].dx;
          primaryRulerStartPoint =
              Offset(value[0].dx, -getRulersOffset + yAxisForGaugeContainer);
          break;
        case RulerPosition.center:
          if (getGaugeOrientation == GaugeOrientation.horizontal) {
            //the y co-ordinate of the ending point is halved from it's original position

            y = ((value[1].dy + getThickness) / 2) + yAxisForGaugeContainer;
            x = value[1].dx;
            //the staring point is shifted half of the primary ruler height from the
            //center of the gauge container
            primaryRulerStartPoint = Offset(
                value[0].dx,
                value[0].dy / 2 -
                    getPrimaryRulersHeight / 2 +
                    yAxisForGaugeContainer);
          } else {
            y = value[1].dy;
            x = (value[1].dx + getThickness) / 2 + xAxisForGaugeContainer;
            primaryRulerStartPoint = Offset(
                value[0].dx / 2 -
                    (getPrimaryRulersHeight / 2) +
                    xAxisForGaugeContainer,
                value[0].dy);
          }
          break;
        case RulerPosition.bottom:
          //there is need to adjust y co-ordinate by adding the height of gauge container
          //bcz line will start drawing from behind of gauge container
          y = value[1].dy +
              getThickness +
              getRulersOffset +
              yAxisForGaugeContainer;
          x = value[1].dx;
          primaryRulerStartPoint = Offset(value[0].dx,
              value[0].dy + getRulersOffset + yAxisForGaugeContainer);
          break;
        case RulerPosition.right:
          y = value[1].dy;
          x = value[1].dx +
              getThickness +
              getRulersOffset +
              xAxisForGaugeContainer;
          primaryRulerStartPoint = Offset(
              value[0].dx + getRulersOffset + xAxisForGaugeContainer,
              value[0].dy);

          break;
        case RulerPosition.left:
          y = value[1].dy;
          x = -(value[1].dx + getRulersOffset - xAxisForGaugeContainer);
          primaryRulerStartPoint =
              Offset(-getRulersOffset + xAxisForGaugeContainer, value[0].dy);

          break;
      }

      //the ending point of the primary ruler

      Offset a = Offset(x, y);
      _primaryRulersPaint.color = setAnimatedColor(primaryRulerColor!);

      if (showPrimaryRulers) {
        canvas.drawLine(primaryRulerStartPoint, a, _primaryRulersPaint);
      }
    });
  }

  void _drawSecondaryRulers(Canvas canvas) {
    _linearGaugeLabel.generateSecondaryRulers(
        getSecondaryRulerPerInterval,
        canvas,
        _secondaryRulersPaint,
        getSecondaryRulersHeight + getThickness,
        rulerPosition,
        rangeLinearGauge!,
        getRulersOffset,
        getGaugeOrientation,
        getThickness,
        this);
  }

  Color setAnimatedColor(Color paintColor) {
    double animationValue = 1;
    if (_gaugeAnimation != null) {
      animationValue = _gaugeAnimation!.value;
    }

    return paintColor.withOpacity(animationValue * paintColor.opacity);
  }

  @override
  void performLayout() {
    size = Size(math.max(_primaryRulersWidth, _secondaryRulersWidth),
        math.max(_primaryRulersHeight, _secondaryRulersHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    xAxisForGaugeContainer = offset.dx;
    yAxisForGaugeContainer = offset.dy;
    _setPrimaryRulersPaint();
    _setSecondaryRulersPaint();

    _drawPrimaryRulers(canvas, offset);
    if (showSecondaryRulers) {
      _drawSecondaryRulers(canvas);
    }
  }
}
