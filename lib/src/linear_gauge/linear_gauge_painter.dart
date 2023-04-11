import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/object.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:geekyants_flutter_gauges/src/linear_gauge/linear_gauge_label.dart';

class RenderLinearGauge extends RenderBox {
  RenderLinearGauge({
    required double start,
    required double end,
    required double steps,
    required bool showLinearGaugeContainer,
    required GaugeOrientation gaugeOrientation,
    required TextStyle textStyle,
    required double primaryRulersWidth,
    required double primaryRulersHeight,
    required double secondaryRulersHeight,
    required double secondaryRulersWidth,
    required double labelTopMargin,
    required Color primaryRulerColor,
    required Color secondaryRulerColor,
    required LinearGaugeBoxDecoration linearGaugeBoxDecoration,
    required double secondaryRulerPerInterval,
    required Color linearGaugeContainerBgColor,
    required Color linearGaugeContainerValueColor,
    required bool showLabel,
    required RulerPosition rulerPosition,
    required double labelOffset,
    required bool showSecondaryRulers,
    required bool showPrimaryRulers,
    required double value,
    required List<RangeLinearGauge> rangeLinearGauge,
    required List<CustomRulerLabel> customLabels,
    required double rulersOffset,
    required ValueBarPosition valueBarPosition,
    required List<ValueBar> valueBar,
    required bool inversedRulers,
    required List<Pointer> pointers,
    required Animation<double>? gaugeAnimation,
    required double thickness,
    required double extendLinearGauge,
    required bool fillExtend,
    required List<Animation<double>> pointerAnimation,
    required List<Animation<double>> valueBarAnimation,
  })  : assert(start < end, "Start should be grater then end"),
        _start = start,
        _end = end,
        _steps = steps,
        _showLinearGaugeContainer = showLinearGaugeContainer,
        _gaugeOrientation = gaugeOrientation,
        _textStyle = textStyle,
        _primaryRulerColor = primaryRulerColor,
        _primaryRulersWidth = primaryRulersWidth,
        _primaryRulersHeight = primaryRulersHeight,
        _secondaryRulerColor = secondaryRulerColor,
        _secondaryRulersHeight = secondaryRulersHeight,
        _secondaryRulersWidth = secondaryRulersWidth,
        _labelTopMargin = labelTopMargin,
        _linearGaugeBoxDecoration = linearGaugeBoxDecoration,
        _secondaryRulerPerInterval = secondaryRulerPerInterval,
        _linearGaugeContainerBgColor = linearGaugeBoxDecoration.backgroundColor,
        _linearGaugeContainerValueColor = linearGaugeContainerValueColor,
        _showLabel = showLabel,
        _rulerPosition = rulerPosition,
        _labelOffset = labelOffset,
        _showSecondaryRulers = showSecondaryRulers,
        _showPrimaryRulers = showPrimaryRulers,
        _value = value,
        _rangeLinearGauge = rangeLinearGauge,
        _customLabels = customLabels,
        _rulersOffset = rulersOffset,
        _inversedRulers = inversedRulers,
        // _valueBarPosition = valueBarPosition,
        _valueBar = valueBar,
        _pointers = pointers,
        _gaugeAnimation = gaugeAnimation,
        _thickness = thickness,
        _extendLinearGauge = extendLinearGauge,
        _fillExtend = fillExtend,
        _pointerAnimation = pointerAnimation,
        _valueBarAnimation = valueBarAnimation;

  // For getting Gauge Values
  double gaugeStart = 0;
  double gaugeEnd = 0;
  double? topPointerHeight,
      bottomPointerHeight,
      centerPointerHeight,
      pointerMaxOfBottomAndCenter,
      pointerMaxOfTopAndCenter = 0;
  double? topValueBarOffset,
      bottomValueBarOffset,
      centerValueBarOffset,
      leftValueBarOffset,
      rightValueBarOffset,
      valueBarMaxOfBottomAndCenter,
      valueBarMaxOfLeftAndCenter,
      valueBarMaxOfRightAndCenter,
      valueBarMaxOfTopAndCenter = 0;
  double? rightPointerHeight,
      leftPointerHeight,
      pointerMaxOfRightAndCenter,
      pointerMaxOfLeftAndCenter = 0;
  double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;
  double spacingForGauge = 0;

  ///
  /// Getter and Setter for the [_animationValue] parameter.
  ///
  Animation<double>? get getGaugeAnimation => _gaugeAnimation;
  Animation<double>? _gaugeAnimation;
  set setGaugeAnimation(Animation<double>? gaugeAnimation) {
    if (_gaugeAnimation == gaugeAnimation) return;
    _gaugeAnimation = gaugeAnimation;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_start] parameter.
  ///
  double get getStart => _start;
  double _start;
  set setStart(double start) {
    if (_start == start) return;
    _start = start;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_end] parameter.
  ///
  get getEnd => _end;
  double _end;
  set setEnd(end) {
    if (_end == end) return;
    _end = end;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_steps] parameter.
  ///
  get getSteps => _steps;
  double _steps;
  set setSteps(steps) {
    if (_steps == steps) return;

    _steps = steps;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_showLinearGaugeContainer] parameter.
  ///
  get getShowLinearGaugeContainer => _showLinearGaugeContainer;
  bool _showLinearGaugeContainer;
  set setShowLinearGaugeContainer(showLinearGaugeContainer) {
    if (_showLinearGaugeContainer == showLinearGaugeContainer) return;

    _showLinearGaugeContainer = showLinearGaugeContainer;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [gaugeOrientation] parameter.
  ///
  get getGaugeOrientation => _gaugeOrientation;
  GaugeOrientation _gaugeOrientation;

  set setGaugeOrientation(gaugeOrientation) {
    if (_gaugeOrientation == gaugeOrientation) return;

    _gaugeOrientation = gaugeOrientation;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_textStyle] parameter.
  ///
  get getTextStyle => _textStyle;
  TextStyle _textStyle;
  set setTextStyle(textStyle) {
    if (_textStyle == textStyle) return;

    _textStyle = textStyle;
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
  /// Getter and Setter for the [labelTopMargin] parameter.
  ///
  get getLabelTopMargin => _labelTopMargin;
  double _labelTopMargin;

  set setLabelTopMargin(labelTopMargin) {
    if (_labelTopMargin == labelTopMargin) return;

    _labelTopMargin = labelTopMargin;
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
  /// Getter and Setter for the [secondaryRulerColor] parameter.
  ///
  Color get getSecondaryRulerColor => _secondaryRulerColor;
  Color _secondaryRulerColor;

  set setSecondaryRulerColor(secondaryRulerColor) {
    if (_secondaryRulerColor == secondaryRulerColor) return;
    _secondaryRulerColor = secondaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [linearGaugeBoxDecoration] parameter.
  ///
  LinearGaugeBoxDecoration get getLinearGaugeBoxDecoration =>
      _linearGaugeBoxDecoration;

  LinearGaugeBoxDecoration _linearGaugeBoxDecoration;
  set setLinearGaugeBoxDecoration(linearGaugeBoxDecoration) {
    if (_linearGaugeBoxDecoration == linearGaugeBoxDecoration) return;
    _linearGaugeBoxDecoration = linearGaugeBoxDecoration;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [SecondaryRulerPerInterval] parameter.
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

  ///
  /// Getter and Setter for the [LinearGaugeContainerBgColor] parameter.
  ///
  Color get getLinearGaugeContainerBgColor => _linearGaugeContainerBgColor;
  Color _linearGaugeContainerBgColor;
  set setLinearGaugeContainerBgColor(Color linearGaugeContainerBgColor) {
    if (_linearGaugeContainerBgColor == linearGaugeContainerBgColor) {
      return;
    }
    _linearGaugeContainerBgColor = linearGaugeContainerBgColor;
    markNeedsPaint();
  }

  Color get getLinearGaugeContainerValueColor =>
      _linearGaugeContainerValueColor;
  Color _linearGaugeContainerValueColor;
  set setLinearGaugeContainerValueColor(Color linearGaugeContainerValueColor) {
    if (_linearGaugeContainerValueColor == linearGaugeContainerValueColor) {
      return;
    }
    _linearGaugeContainerValueColor = linearGaugeContainerValueColor;
    markNeedsPaint();
  }

  double get getValue => _value;
  double _value;
  set setValue(double val) {
    if (_value == val) {
      return;
    }
    _value = val;
    markNeedsPaint();
  }

  bool get showLabel => _showLabel;
  bool _showLabel;
  set setShowLabel(bool val) {
    if (_showLabel == val) return;
    _showLabel = val;
    markNeedsPaint();
  }

  RulerPosition get rulerPosition => _rulerPosition;
  RulerPosition _rulerPosition;
  set setRulerPosition(RulerPosition val) {
    if (_rulerPosition == val) return;
    _rulerPosition = val;
    markNeedsLayout();
  }

  double get getLabelOffset => _labelOffset;
  double _labelOffset;
  set setLabelOffset(double val) {
    if (_labelOffset == val) return;
    _labelOffset = val;
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
  /// Getter and Setter for the [rangeLinearGauge] parameter.
  ///
  List<RangeLinearGauge>? get rangeLinearGauge => _rangeLinearGauge;
  List<RangeLinearGauge>? _rangeLinearGauge = <RangeLinearGauge>[];
  set setRangeLinearGauge(List<RangeLinearGauge>? val) {
    if (_rangeLinearGauge == val) return;
    _rangeLinearGauge = val;
    markNeedsPaint();
  }

  List<CustomRulerLabel>? get getCustomLabels => _customLabels;
  List<CustomRulerLabel>? _customLabels = <CustomRulerLabel>[];
  set setCustomLabels(List<CustomRulerLabel>? val) {
    if (_customLabels == val) return;
    _customLabels = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [rulersOffset] parameter.
  ///

  double get getRulersOffset => _rulersOffset;
  double _rulersOffset;
  set setRulersOffset(double val) {
    if (_rulersOffset == val) return;
    _rulersOffset = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [inversedRulers] parameter.
  ///

  bool get getInversedRulers => _inversedRulers;
  bool _inversedRulers;
  set setInversedRulers(bool val) {
    if (_inversedRulers == val) return;
    _inversedRulers = val;
    markNeedsPaint();
  }

  LinearGaugeLabel get getLinearGaugeLabel {
    return _linearGaugeLabel;
  }

  ///
  /// Getter and Setter for the [valueBarPosition] parameter.
  ///
  // ValueBarPosition get valueBarPosition => _valueBarPosition;
  // ValueBarPosition _valueBarPosition;
  // set setValueBarPosition(ValueBarPosition val) {
  //   if (_valueBarPosition == val) return;
  //   _valueBarPosition = val;
  //   markNeedsPaint();
  // }

  ///
  /// Getter and Setter for the [valueBar] parameter.
  ///
  List<ValueBar> get getValueBar => _valueBar;
  List<ValueBar> _valueBar = <ValueBar>[];
  set setValueBar(List<ValueBar> val) {
    if (_valueBar == val) return;
    _valueBar = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [Pointer] parameter.
  ///
  List<Pointer> get getPointers => _pointers;
  List<Pointer> _pointers = <Pointer>[];
  set setPointers(List<Pointer> val) {
    if (_pointers == val) return;
    _pointers = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [thickness] parameter.
  ///
  double get getThickness => _thickness;
  double _thickness;
  set setThickness(double val) {
    if (_thickness == val) return;
    _thickness = val;
    markNeedsLayout();
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

  ///
  /// Getter and Setter for the [fillExtend] parameter.
  ///
  bool get getFillExtend => _fillExtend;
  bool _fillExtend;
  set setFillExtend(bool val) {
    if (_fillExtend == val) return;
    _fillExtend = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [pointerAnimation] parameter.
  ///
  List<Animation<double>> get getPointerAnimation => _pointerAnimation;
  List<Animation<double>> _pointerAnimation;
  set setPointerAnimation(List<Animation<double>> val) {
    if (_pointerAnimation == val) return;
    _pointerAnimation = val;
    _removeAnimationListeners();
    _addAnimationListener();
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [valueBarAnimation] parameter.
  ///
  List<Animation<double>> get getValueBarAnimation => _valueBarAnimation;
  List<Animation<double>> _valueBarAnimation;
  set setValueBarAnimation(List<Animation<double>> val) {
    if (_valueBarAnimation == val) return;
    _valueBarAnimation = val;
    _removeAnimationListeners();
    _addAnimationListener();
    markNeedsLayout();
  }

  void _addAnimationListener() {
    if (_pointerAnimation != null) {
      for (final Animation<double> animation in _pointerAnimation) {
        animation.addListener(markNeedsPaint);
      }
    }
    if (_valueBarAnimation != null) {
      for (final Animation<double> animation in _valueBarAnimation) {
        animation.addListener(markNeedsPaint);
      }
    }
    if (_gaugeAnimation != null) {
      _gaugeAnimation!.addListener(markNeedsPaint);
    }
  }

  void _removeAnimationListeners() {
    if (_pointerAnimation.isNotEmpty) {
      for (final Animation<double> animation in _pointerAnimation) {
        animation.removeListener(markNeedsPaint);
      }
    }
    if (_valueBarAnimation != null) {
      for (final Animation<double> animation in _valueBarAnimation) {
        animation.removeListener(markNeedsPaint);
      }
    }
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

  ///
  /// Getter and Setter for the [_pointerSpace] parameter.
  ///
  double get getPointerSpace => _pointerSpace;
  final double _pointerSpace = 0;

  final Paint _linearGaugeContainerPaint = Paint();
  final Paint _primaryRulersPaint = Paint();
  final Paint _secondaryRulersPaint = Paint();
  final Paint _linearGaugeContainerValuePaint = Paint();
  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();

  late Size _startLabelSize, _endLabelSize, _axisActualSize;

  final double _valueInPixel = 0;

  void _calculateRulerPoints() {
    if (getCustomLabels!.isEmpty) {
      double screenSize = getGaugeOrientation == GaugeOrientation.horizontal
          ? 3 * size.width
          : 3 * size.height;

      final double count = math.max(screenSize / 100, 1.0);
      double interval = (getEnd - getStart) / (screenSize / 100);
      final List<double> intervalDivisions = <double>[10, 5, 2, 1];
      late double currentInterval;
      num v = math.pow(10, (math.log(interval) / math.log(10)).floor());

      for (final double intervalDivision in intervalDivisions) {
        currentInterval = v * intervalDivision;

        if (count < ((getEnd - getStart) / currentInterval)) {
          break;
        }
        interval = currentInterval;
      }

      _linearGaugeLabel.addLabels(
        distanceValueInRangeOfHundred: getSteps == 0.0 ? interval : getSteps,
        start: getStart,
        end: getEnd,
      );
    } else {
      _start = getCustomLabels!.first.value!;
      _end = getCustomLabels!.last.value!;
      _linearGaugeLabel.addCustomLabels(labelList: getCustomLabels!);
    }

    _startLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle,
        value: !getInversedRulers
            ? getCustomLabels!.isEmpty
                ? getStart.toInt().toString()
                : getCustomLabels!.first.text
            : getCustomLabels!.isEmpty
                ? getEnd.toInt().toString()
                : getCustomLabels!.last.text);

    _endLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle,
        value: !getInversedRulers
            ? getCustomLabels!.isEmpty
                ? getEnd.toInt().toString()
                : getCustomLabels!.last.text
            : getCustomLabels!.isEmpty
                ? getStart.toInt().toString()
                : getCustomLabels!.first.text);

    _linearGaugeLabel.generateOffSetsForLabel(
        _startLabelSize,
        _endLabelSize,
        size,
        getEnd,
        getPrimaryRulersHeight,
        getThickness,
        getLabelTopMargin,
        getCustomLabels!.isNotEmpty,
        getInversedRulers,
        getGaugeOrientation,
        getExtendLinearGauge,
        this);
  }

  void _drawLabels(
    Canvas canvas,
    String text,
    double? value,
    List<Offset> list,
  ) {
    final ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );

    // calculator method to get the text style based on the range
    Color getRangeColor(String text) {
      for (int i = 0; i < rangeLinearGauge!.length; i++) {
        if (value! >= rangeLinearGauge![i].start &&
            value <= rangeLinearGauge![i].end) {
          return rangeLinearGauge![i].color;
        }
      }
      // Return a default style if no range color is found
      return getTextStyle.color ?? Colors.black;
    }

    final ui.TextStyle labelTextStyle = ui.TextStyle(
      // color: getTextStyle.color,
      color: setAnimatedColor(getRangeColor(text)),
      fontSize: getTextStyle.fontSize,
      background: getTextStyle.background,
      decoration: getTextStyle.decoration,
      decorationColor: getTextStyle.decorationColor,
      decorationStyle: getTextStyle.decorationStyle,
      decorationThickness: getTextStyle.decorationThickness,
      fontFamily: getTextStyle.fontFamily,
      fontFamilyFallback: getTextStyle.fontFamilyFallback,
      fontFeatures: getTextStyle.fontFeatures,
      fontStyle: getTextStyle.fontStyle,
      fontVariations: getTextStyle.fontVariations,
      fontWeight: getTextStyle.fontWeight,
      foreground: getTextStyle.foreground,
      height: getTextStyle.height,
      leadingDistribution: getTextStyle.leadingDistribution,
      letterSpacing: getTextStyle.letterSpacing,
      locale: getTextStyle.locale,
      shadows: getTextStyle.shadows,
      textBaseline: getTextStyle.textBaseline,
      wordSpacing: getTextStyle.wordSpacing,
    );

    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(labelTextStyle)
          ..addText(text);
    final ui.Paragraph paragraph = paragraphBuilder.build();
    final Size labelSize =
        _linearGaugeLabel.getLabelSize(textStyle: getTextStyle, value: text);

    paragraph.layout(ui.ParagraphConstraints(width: labelSize.width));

    // offset for drawing the label on the canvas
    Offset labelPosition;

    switch (rulerPosition) {
      case RulerPosition.top:
        labelPosition = Offset(
          (list[0].dx - (labelSize.width / 2)),
          -(getPrimaryRulersHeight +
              getLabelOffset +
              getRulersOffset +
              labelSize.height -
              yAxisForGaugeContainer +
              2),
        );
        break;
      case RulerPosition.center:
        if (getGaugeOrientation == GaugeOrientation.horizontal) {
          double labelOffset =
              (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
          labelPosition = Offset(
            (list[0].dx - (labelSize.width / 2)),
            (list[0].dy / 2 +
                getPrimaryRulersHeight / 2 +
                labelOffset +
                yAxisForGaugeContainer),
          );
        } else {
          double labelOffset =
              (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
          labelPosition = Offset(
            (list[0].dx / 2 +
                getPrimaryRulersHeight / 2 +
                labelOffset +
                xAxisForGaugeContainer),
            (list[0].dy - (labelSize.height / 2)),
          );
        }
        break;
      case RulerPosition.bottom:
        double labelOffset =
            (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
        labelPosition = Offset(
          (list[0].dx - (labelSize.width / 2)),
          (list[0].dy +
              getPrimaryRulersHeight +
              labelOffset +
              getRulersOffset +
              yAxisForGaugeContainer),
        );
        break;
      case RulerPosition.right:
        double labelOffset =
            (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
        labelPosition = Offset(
          (list[0].dx +
              (getPrimaryRulersHeight +
                  labelOffset +
                  getRulersOffset +
                  xAxisForGaugeContainer)),
          (list[0].dy - (labelSize.height / 2)),
        );
        break;
      case RulerPosition.left:
        double labelOffset =
            (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
        labelPosition = Offset(
          -(getPrimaryRulersHeight +
              labelOffset +
              getRulersOffset +
              labelSize.width -
              xAxisForGaugeContainer),
          (list[0].dy - (labelSize.height / 2)),
        );
        break;
    }

    canvas.drawParagraph(
      paragraph,
      labelPosition,
    );
  }

  void _paintGaugeContainer(Canvas canvas, Size size) {
    if (rangeLinearGauge!.isNotEmpty) {
      assert(rangeLinearGauge!.every((element) => element.start >= getStart),
          'The start value of the range should be less than the start value of the gauge.');
      assert(rangeLinearGauge!.every((element) => element.end <= getEnd),
          'The end value of the range should be less than the end value of the gauge.');
      assert(rangeLinearGauge!.every((element) => element.start <= element.end),
          'The start value of the range should be less than the end value of the range.');
    }

    Offset offset = Offset(
      0,
      getGaugeOrientation == GaugeOrientation.horizontal
          ? yAxisForGaugeContainer
          : xAxisForGaugeContainer,
    );
    late double end;
    late double start;

    double largestPointerWidth = getLargestPointerSize();

    if (showLabel) {
      end = GaugeOrientation.horizontal == getGaugeOrientation
          ? size.width -
              ((_endLabelSize.width / 2) +
                  (_startLabelSize.width / 2) +
                  (largestPointerWidth))
          : (size.height -
              ((_endLabelSize.height / 2) +
                  (_startLabelSize.height / 2) +
                  (largestPointerWidth)));

      start = GaugeOrientation.horizontal == getGaugeOrientation
          ? (offset.dx +
              (_startLabelSize.width / 2) +
              (largestPointerWidth / 2))
          : (offset.dx +
              (_startLabelSize.height / 2) +
              (largestPointerWidth / 2));
    } else {
      end = GaugeOrientation.horizontal == getGaugeOrientation
          ? size.width - (largestPointerWidth)
          : size.height - (largestPointerWidth);
      start = offset.dx + (largestPointerWidth / 2);
    }

    late Rect gaugeContainer;
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      gaugeContainer = Rect.fromLTWH(
        start,
        offset.dy,
        end,
        getThickness,
      );
    } else {
      gaugeContainer = Rect.fromLTWH(
        offset.dy,
        start,
        getThickness,
        end,
      );
    }

    double totalWidth = end;
    double totalValOnPixel;

    if (getValue < getStart) {
      totalValOnPixel = 0.0;
    } else {
      totalValOnPixel =
          (((getValue) - getStart) / (getEnd - getStart)) * totalWidth;

      totalValOnPixel = getGaugeAnimation != null
          ? totalValOnPixel * getGaugeAnimation!.value
          : totalValOnPixel;
    }

    gaugeStart = start;
    gaugeEnd = end;
    if (getLinearGaugeBoxDecoration.linearGradient != null) {
      _linearGaugeContainerPaint.shader = getLinearGaugeBoxDecoration
          .linearGradient!
          .createShader(gaugeContainer);
    }

    if (getLinearGaugeBoxDecoration.borderRadius != null) {
      var rectangularBox = _getRoundedContainer(
        gaugeContainer: gaugeContainer,
        borderRadius: getLinearGaugeBoxDecoration.borderRadius,
        edgeStyle: getLinearGaugeBoxDecoration.edgeStyle,
      );

      if (_showLinearGaugeContainer) {
        canvas.drawRRect(rectangularBox, _linearGaugeContainerPaint);
      }

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;

      if (getGaugeOrientation == GaugeOrientation.horizontal) {
        gaugeContainer = Rect.fromLTWH(
          !getInversedRulers ? start : (start + end),
          offset.dy,
          !getInversedRulers ? totalValOnPixel : -totalValOnPixel,
          getThickness,
        );
      } else {
        gaugeContainer = Rect.fromLTWH(
          offset.dy,
          !getInversedRulers ? (start + end) : start,
          getThickness,
          !getInversedRulers ? -totalValOnPixel : totalValOnPixel,
        );
      }

      if (_showLinearGaugeContainer) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            gaugeContainer,
            Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
          ),
          _linearGaugeContainerValuePaint,
        );
      }

      _drawValueBars(
        canvas: canvas,
        start: start,
        totalWidth: totalWidth,
        end: end,
      );
      _drawRangeBars(
        start: start,
        end: end,
        canvas: canvas,
        totalWidth: totalWidth,
        gaugeContainer: gaugeContainer,
        offset: offset,
      );
    } else {
      if (_showLinearGaugeContainer) {
        canvas.drawRect(gaugeContainer, _linearGaugeContainerPaint);
      }

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;
      if (getGaugeOrientation == GaugeOrientation.horizontal) {
        gaugeContainer = Rect.fromLTWH(
          !getInversedRulers ? start : (start + end),
          offset.dy,
          !getInversedRulers ? totalValOnPixel : -totalValOnPixel,
          getThickness,
        );
      } else {
        gaugeContainer = Rect.fromLTWH(
          offset.dy,
          !getInversedRulers ? (start + end) : start,
          getThickness,
          !getInversedRulers ? -totalValOnPixel : totalValOnPixel,
        );
      }

      if (getLinearGaugeBoxDecoration.linearGradient != null) {
        _linearGaugeContainerValuePaint.shader = getLinearGaugeBoxDecoration
            .linearGradient!
            .createShader(gaugeContainer);
      }

      // Draw the value bar in the gauge container for @deprecated value
      canvas.drawRect(
        gaugeContainer,
        _linearGaugeContainerValuePaint,
      );

      _drawValueBars(
        canvas: canvas,
        start: start,
        totalWidth: totalWidth,
        end: end,
      );
      _drawRangeBars(
        start: start,
        end: end,
        canvas: canvas,
        totalWidth: totalWidth,
        gaugeContainer: gaugeContainer,
        offset: offset,
      );
    }
  }

  void _drawValueBars(
      {required Canvas canvas,
      required double start,
      required double end,
      required double totalWidth}) {
    // For loop for drawing value bar in [LinearGauge]
    for (int j = 0; j < getValueBar.length; j++) {
      getValueBar[j].drawValueBar(
        canvas,
        start,
        end,
        totalWidth,
        j,
        this,
      );
    }
  }

  void _drawRangeBars({
    required Canvas canvas,
    required double start,
    required double end,
    required double totalWidth,
    required Offset offset,
    required Rect gaugeContainer,
  }) {
    RRect roundedGaugeContainer;

    /// For loop for calculating colors in [RangeLinearGauge]
    /// 2 is hardcoded beacuse extend is happeing from both the end of the gauge
    for (int i = 0; i < rangeLinearGauge!.length; i++) {
      // Method to cal exact width
      double calculateValuePixelWidth(double value) {
        return ((value - getStart) / (getEnd - getStart)) *
            (totalWidth - 2 * getExtendLinearGauge);
      }

      // width of the colorRange
      double colorRangeWidth =
          calculateValuePixelWidth(rangeLinearGauge![i].end) -
              calculateValuePixelWidth(rangeLinearGauge![i].start);

      // Start of the ColorRange

      double colorRangeStart;
      if (getGaugeOrientation == GaugeOrientation.horizontal) {
        colorRangeStart = !getInversedRulers
            ? (calculateValuePixelWidth(rangeLinearGauge![i].start) +
                start +
                getExtendLinearGauge)
            : ((start + end) -
                calculateValuePixelWidth(rangeLinearGauge![i].start) -
                getExtendLinearGauge);

        if (getFillExtend) {
          if (rangeLinearGauge![i].start == getStart) {
            if (!getInversedRulers) {
              colorRangeStart = colorRangeStart - getExtendLinearGauge;
              colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
            } else {
              colorRangeStart = colorRangeStart + getExtendLinearGauge;
              colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
            }
          }
          if (rangeLinearGauge![i].end == getEnd) {
            colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
          }
        }

        gaugeContainer = Rect.fromLTWH(
          colorRangeStart,
          offset.dy,
          !getInversedRulers ? colorRangeWidth : -colorRangeWidth,
          getThickness,
        );
      } else {
        colorRangeStart = !getInversedRulers
            ? ((start + end) -
                calculateValuePixelWidth(rangeLinearGauge![i].start) -
                getExtendLinearGauge)
            : (calculateValuePixelWidth(rangeLinearGauge![i].start) +
                start +
                getExtendLinearGauge);

        if (getFillExtend) {
          if (rangeLinearGauge![i].start == getStart) {
            if (!getInversedRulers) {
              colorRangeStart = colorRangeStart + getExtendLinearGauge;
              colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
            } else {
              colorRangeStart = colorRangeStart - getExtendLinearGauge;
              colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
            }
          }
          if (rangeLinearGauge![i].end == getEnd) {
            colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
          }
        }
        gaugeContainer = Rect.fromLTWH(
          offset.dy,
          colorRangeStart,
          getThickness,
          !getInversedRulers ? -colorRangeWidth : colorRangeWidth,
        );
      }

      _linearGaugeContainerValuePaint.color =
          setAnimatedColor(rangeLinearGauge![i].color);
      if (rangeLinearGauge![i].borderRadius != null) {
        roundedGaugeContainer = _getRoundedContainer(
          gaugeContainer: gaugeContainer,
          borderRadius: rangeLinearGauge![i].borderRadius,
          edgeStyle: rangeLinearGauge![i].edgeStyle,
        );
        canvas.drawRRect(
          roundedGaugeContainer,
          _linearGaugeContainerValuePaint,
        );
      } else {
        canvas.drawRect(
          gaugeContainer,
          _linearGaugeContainerValuePaint,
        );
      }
    }
  }

  RRect _getRoundedContainer({
    required Rect gaugeContainer,
    required borderRadius,
    required edgeStyle,
  }) {
    RRect rectangularBox;
    switch (edgeStyle) {
      case LinearEdgeStyle.startCurve:
        rectangularBox = RRect.fromRectAndCorners(
          gaugeContainer,
          topLeft: Radius.circular(borderRadius!),
          bottomLeft: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.circular(borderRadius!)
              : Radius.zero,
          topRight: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.zero
              : Radius.circular(borderRadius!),
        );
        break;
      case LinearEdgeStyle.endCurve:
        rectangularBox = RRect.fromRectAndCorners(
          gaugeContainer,
          topRight: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.circular(borderRadius!)
              : Radius.zero,
          bottomLeft: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.zero
              : Radius.circular(borderRadius!),
          bottomRight: Radius.circular(borderRadius!),
        );
        break;

      default:
        rectangularBox = RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(borderRadius!),
        );
        break;
    }

    return rectangularBox;
  }

  double getLargestPointerSize() {
    if (getPointers.isNotEmpty) {
      Pointer? largestPointer = getLargestPointer(getPointers);

      if ((largestPointer?.shape == PointerShape.rectangle ||
              largestPointer?.shape == PointerShape.diamond) &&
          getGaugeOrientation == GaugeOrientation.vertical) {
        return largestPointer?.height ?? 0;
      } else {
        if (largestPointer?.shape == PointerShape.circle) {
          return largestPointer?.height ?? 0;
        } else {
          return largestPointer?.width ?? 0;
        }
      }
    } else {
      return 10;
    }
  }

  Pointer? getLargestPointer(List<Pointer>? pointers) {
    Pointer? largestPointer = pointers?.reduce(
        (current, next) => getGaugeOrientation == GaugeOrientation.vertical
            ? current.height! > next.height!
                ? current
                : next
            : current.width! > next.width!
                ? current
                : next);
    return largestPointer;
  }

  ValueBar? getLargestValueBarOffset(List<ValueBar>? valueBars) {
    ValueBar? largestValueBarWithOffset = valueBars?.reduce(
        (current, next) => current.offset > next.offset ? current : next);
    return largestValueBarWithOffset;
  }

  Pointer? getLargestPointerForLayout(List<Pointer>? pointers) {
    Pointer? largestPointer = pointers?.reduce(
        (current, next) => getGaugeOrientation == GaugeOrientation.horizontal
            ? current.height! > next.height!
                ? current
                : next
            : current.width! > next.width!
                ? current
                : next);
    return largestPointer;
  }

  ValueBar? getLargestValueBarForLayout(List<ValueBar>? valueBars) {
    ValueBar? largestValueBar = valueBars?.reduce((current, next) =>
        (current.valueBarThickness + current.offset) >
                (next.valueBarThickness + next.offset)
            ? current
            : next);
    return largestValueBar;
  }

  void _drawPrimaryRulers(Canvas canvas) {
    int count = 0;

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

      if (showLabel) {
        _drawLabels(canvas, _linearGaugeLabel.getListOfLabel[count].text!,
            _linearGaugeLabel.getListOfLabel[count].value!, value);
      }

      if (showPrimaryRulers) {
        canvas.drawLine(primaryRulerStartPoint, a, _primaryRulersPaint);
      }
      count++;
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

  void _setPrimaryRulersPaint() {
    _primaryRulersPaint.color = getPrimaryRulerColor;
    _primaryRulersPaint.strokeWidth = getPrimaryRulersWidth;
  }

  void _setSecondaryRulersPaint() {
    _secondaryRulersPaint.color = getSecondaryRulerColor;
    _secondaryRulersPaint.strokeWidth = getSecondaryRulersWidth;
  }

  void _setLinearGaugeContainerPaint() {
    _linearGaugeContainerPaint.color =
        setAnimatedColor(getLinearGaugeContainerBgColor);
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
    size = computeDryLayout(constraints);
  }

  List<Pointer> getPointersByPosition(
      List<Pointer> pointerList, PointerPosition position) {
    List<Pointer> result = [];
    for (Pointer pointer in pointerList) {
      if (pointer.pointerPosition == position) {
        result.add(pointer);
      }
    }
    return result;
  }

  List<ValueBar> getValueBarByPosition(
      List<ValueBar> valueBarList, ValueBarPosition position) {
    List<ValueBar> result = [];
    for (ValueBar valueBar in valueBarList) {
      if (valueBar.position == position) {
        result.add(valueBar);
      }
    }
    return result;
  }

  getLinearGaugeThickness() {
    List<Pointer> centerPointers = [],
        bottomPointers = [],
        topPointers = [],
        leftPointers = [],
        rightPointers = [];

    List<ValueBar> topValueBars = [],
        bottomValueBars = [],
        centerValueBar = [],
        leftValueBars = [],
        rightValueBars = [];

    double linearGaugeContainerThickness =
        getLinearGaugeBoxDecoration.thickness!;

    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      return layoutHorizontalGauge(
        topPointers,
        bottomPointers,
        centerPointers,
        linearGaugeContainerThickness,
        topValueBars,
        bottomValueBars,
        centerValueBar,
      );
    } else {
      return layoutVerticalGauge(
        rightPointers,
        leftPointers,
        centerPointers,
        linearGaugeContainerThickness,
        leftValueBars,
        rightValueBars,
        centerValueBar,
      );
    }
  }

  double layoutVerticalGauge(
    List<Pointer> rightPointers,
    List<Pointer> leftPointers,
    List<Pointer> centerPointers,
    double linearGaugeContainerThickness,
    List<ValueBar> leftValueBars,
    List<ValueBar> rightValueBars,
    List<ValueBar> centerValueBars,
  ) {
    double getEffectiveRulersWidth = getMaxRulerHeight();
    double labelThickness = getLabelWidth();
    double rulersOffset = getRulersOffset;
    double labelsOffset = getLabelOffset;
    _layoutRightPointers(rightPointers);
    _layoutLeftPointers(leftPointers);
    _layoutCenterPointers(centerPointers);
    _initMaxWidthPointerFromRightAndCenter(linearGaugeContainerThickness);
    _initMaxWidthPointerFromLeftAndCenter(linearGaugeContainerThickness);
    _layoutLeftValueBar(leftValueBars);
    _layoutRightValueBar(rightValueBars);
    _layoutCenterValueBar(centerValueBars);
    _initMaxValueBarFromLeftAndCenter(linearGaugeContainerThickness);
    _initMaxValueBarFromRightAndCenter(linearGaugeContainerThickness);
    spacingForGauge = getEffectiveRulersWidth + rulersOffset;
    if (rulerPosition == RulerPosition.right) {
      xAxisForGaugeContainer = pointerMaxOfLeftAndCenter!;

      if (valueBarMaxOfLeftAndCenter! <= pointerMaxOfLeftAndCenter!) {
        valueBarMaxOfLeftAndCenter = 0;
      } else {
        xAxisForGaugeContainer = valueBarMaxOfLeftAndCenter!;
        pointerMaxOfLeftAndCenter = 0;
      }
      if (valueBarMaxOfRightAndCenter! <=
          pointerMaxOfRightAndCenter! + spacingForGauge) {
        valueBarMaxOfRightAndCenter = 0;
      } else {
        valueBarMaxOfRightAndCenter =
            valueBarMaxOfRightAndCenter! - spacingForGauge;
        pointerMaxOfRightAndCenter = 0;
      }

      if (pointerMaxOfRightAndCenter! <= spacingForGauge) {
        pointerMaxOfRightAndCenter = 0;
      } else {
        getEffectiveRulersWidth = 0;
        rulersOffset = 0;
      }
    } else if (rulerPosition == RulerPosition.left) {
      /// This statement add the ruler and label when pointer height is less
      /// ruler and label
      xAxisForGaugeContainer = spacingForGauge;
      if (valueBarMaxOfLeftAndCenter! <= pointerMaxOfLeftAndCenter!) {
        valueBarMaxOfLeftAndCenter = 0;
      } else {
        pointerMaxOfLeftAndCenter = valueBarMaxOfLeftAndCenter!;
        valueBarMaxOfLeftAndCenter = 0;
      }
      if (valueBarMaxOfRightAndCenter! <= pointerMaxOfRightAndCenter!) {
        valueBarMaxOfRightAndCenter = 0;
      } else {
        pointerMaxOfRightAndCenter = valueBarMaxOfRightAndCenter!;
        valueBarMaxOfRightAndCenter = 0;
      }

      if (pointerMaxOfLeftAndCenter! < spacingForGauge) {
        pointerMaxOfLeftAndCenter = 0;
      } else {
        xAxisForGaugeContainer = pointerMaxOfLeftAndCenter!;
        getEffectiveRulersWidth = 0;
        rulersOffset = 0;
      }
    } else if (rulerPosition == RulerPosition.center) {
      getEffectiveRulersWidth = getMaxRulerHeightForCenter();
      getEffectiveRulersWidth =
          getEffectiveRulersWidth > 0 ? getEffectiveRulersWidth : 0;
      xAxisForGaugeContainer = 0;
      rulersOffset = 0;

      double centerAdjustment = labelThickness + labelsOffset;

      if (valueBarMaxOfLeftAndCenter! <= pointerMaxOfLeftAndCenter!) {
        valueBarMaxOfLeftAndCenter = 0;
      } else {
        pointerMaxOfLeftAndCenter = valueBarMaxOfLeftAndCenter;
        valueBarMaxOfLeftAndCenter = 0;
      }

      if (valueBarMaxOfRightAndCenter! <= pointerMaxOfRightAndCenter!) {
        valueBarMaxOfRightAndCenter = 0;
      } else {
        pointerMaxOfRightAndCenter = valueBarMaxOfRightAndCenter;
        valueBarMaxOfRightAndCenter = 0;
      }

      double leftEffectiveRulerWidth = getEffectiveRulersWidth / 2;

      if (pointerMaxOfLeftAndCenter! <= leftEffectiveRulerWidth) {
        xAxisForGaugeContainer = leftEffectiveRulerWidth;
        pointerMaxOfLeftAndCenter = 0;
      } else {
        xAxisForGaugeContainer = pointerMaxOfLeftAndCenter!;
        leftEffectiveRulerWidth = 0;
      }

      double rightEffectiveRulerWidth = getEffectiveRulersWidth / 2;

      if (getEffectiveRulersWidth == 0) {
        rightEffectiveRulerWidth =
            (getPrimaryRulersHeight / 2 + centerAdjustment) - getThickness / 2;
        rightEffectiveRulerWidth =
            (rightEffectiveRulerWidth > 0) ? rightEffectiveRulerWidth : 0;
      } else {
        if (getPrimaryRulersHeight - getThickness == getEffectiveRulersWidth) {
          rightEffectiveRulerWidth =
              getEffectiveRulersWidth / 2 + centerAdjustment;
        } else if (((getPrimaryRulersHeight / 2 + centerAdjustment) -
                getThickness / 2) >
            getEffectiveRulersWidth / 2) {
          rightEffectiveRulerWidth =
              (getPrimaryRulersHeight / 2 + centerAdjustment) -
                  getThickness / 2;
        }
      }

      if (pointerMaxOfRightAndCenter! <= rightEffectiveRulerWidth) {
        pointerMaxOfRightAndCenter = 0;
      } else {
        rightEffectiveRulerWidth = 0;
      }

      getEffectiveRulersWidth =
          leftEffectiveRulerWidth + rightEffectiveRulerWidth;
    }
    return getEffectiveRulersWidth +
        pointerMaxOfLeftAndCenter! +
        pointerMaxOfRightAndCenter! +
        valueBarMaxOfLeftAndCenter! +
        valueBarMaxOfRightAndCenter! +
        getThickness +
        rulersOffset;
  }

  double layoutHorizontalGauge(
    List<Pointer> topPointers,
    List<Pointer> bottomPointers,
    List<Pointer> centerPointers,
    double linearGaugeContainerThickness,
    List<ValueBar> topValueBars,
    List<ValueBar> bottomValueBars,
    List<ValueBar> centerValueBars,
  ) {
    double getEffectiveRulersHeight = getMaxRulerHeight();
    double labelThickness = getLabelHeight();
    double rulersOffset = getRulersOffset;
    double labelsOffset = getLabelOffset;
    _layoutTopPointers(topPointers);
    _layoutBottomPointers(bottomPointers);
    _layoutCenterPointers(centerPointers);
    _initMaxHeightPointerFromTopAndCenter(linearGaugeContainerThickness);
    _initMaxHeightPointerFromBottomAndCenter(linearGaugeContainerThickness);
    _layoutTopValueBar(topValueBars);
    _layoutBottomValueBar(bottomValueBars);
    _layoutCenterValueBar(centerValueBars);
    _initMaxValueBarFromTopAndCenter(linearGaugeContainerThickness);
    _initMaxValueBarFromBottomAndCenter(linearGaugeContainerThickness);

    spacingForGauge = getEffectiveRulersHeight + rulersOffset;
    if (rulerPosition == RulerPosition.top) {
      /// This statement add the ruler and label when pointer height is less
      /// ruler and label
      yAxisForGaugeContainer = spacingForGauge;

      if (valueBarMaxOfTopAndCenter! <= pointerMaxOfTopAndCenter!) {
        valueBarMaxOfTopAndCenter = 0;
      } else {
        pointerMaxOfTopAndCenter = valueBarMaxOfTopAndCenter!;
        valueBarMaxOfTopAndCenter = 0;
      }

      if (valueBarMaxOfBottomAndCenter! <= pointerMaxOfBottomAndCenter!) {
        valueBarMaxOfBottomAndCenter = 0;
      } else {
        pointerMaxOfBottomAndCenter = valueBarMaxOfBottomAndCenter!;
        valueBarMaxOfBottomAndCenter = 0;
      }

      if (pointerMaxOfTopAndCenter! <= spacingForGauge) {
        pointerMaxOfTopAndCenter = 0;
      } else {
        yAxisForGaugeContainer = pointerMaxOfTopAndCenter!;
        getEffectiveRulersHeight = 0;
        rulersOffset = 0;
      }
    } else if (rulerPosition == RulerPosition.bottom) {
      yAxisForGaugeContainer = pointerMaxOfTopAndCenter!;

      if (valueBarMaxOfTopAndCenter! <= pointerMaxOfTopAndCenter!) {
        valueBarMaxOfTopAndCenter = 0;
      } else {
        yAxisForGaugeContainer = valueBarMaxOfTopAndCenter!;
        pointerMaxOfTopAndCenter = 0;
      }

      if (valueBarMaxOfBottomAndCenter! <=
          pointerMaxOfBottomAndCenter! + spacingForGauge) {
        valueBarMaxOfBottomAndCenter = 0;
      } else {
        valueBarMaxOfBottomAndCenter =
            valueBarMaxOfBottomAndCenter! - spacingForGauge;
        pointerMaxOfBottomAndCenter = 0;
      }

      if (pointerMaxOfBottomAndCenter! <= spacingForGauge) {
        pointerMaxOfBottomAndCenter = 0;
      } else {
        getEffectiveRulersHeight = 0;
        rulersOffset = 0;
      }
    } else if (rulerPosition == RulerPosition.center) {
      getEffectiveRulersHeight = getMaxRulerHeightForCenter();
      getEffectiveRulersHeight =
          getEffectiveRulersHeight > 0 ? getEffectiveRulersHeight : 0;
      yAxisForGaugeContainer = 0;
      rulersOffset = 0;

      double centerAdjustment = labelThickness + labelsOffset;

      if (valueBarMaxOfTopAndCenter! <= pointerMaxOfTopAndCenter!) {
        valueBarMaxOfTopAndCenter = 0;
      } else {
        pointerMaxOfTopAndCenter = valueBarMaxOfTopAndCenter;
        valueBarMaxOfTopAndCenter = 0;
      }

      if (valueBarMaxOfBottomAndCenter! <= pointerMaxOfBottomAndCenter!) {
        valueBarMaxOfBottomAndCenter = 0;
      } else {
        pointerMaxOfBottomAndCenter = valueBarMaxOfBottomAndCenter;
        valueBarMaxOfBottomAndCenter = 0;
      }

      double upperEffectiveRulerHeight = getEffectiveRulersHeight / 2;

      if (pointerMaxOfTopAndCenter! <= upperEffectiveRulerHeight) {
        yAxisForGaugeContainer = upperEffectiveRulerHeight;
        pointerMaxOfTopAndCenter = 0;
      } else {
        yAxisForGaugeContainer = pointerMaxOfTopAndCenter!;
        upperEffectiveRulerHeight = 0;
      }

      double bottomEffectiveRulerHeight = getEffectiveRulersHeight / 2;

      if (getEffectiveRulersHeight == 0) {
        bottomEffectiveRulerHeight =
            (getPrimaryRulersHeight / 2 + centerAdjustment) - getThickness / 2;
        bottomEffectiveRulerHeight =
            (bottomEffectiveRulerHeight > 0) ? bottomEffectiveRulerHeight : 0;
      } else {
        if (getPrimaryRulersHeight - getThickness == getEffectiveRulersHeight) {
          bottomEffectiveRulerHeight =
              getEffectiveRulersHeight / 2 + centerAdjustment;
        } else if (((getPrimaryRulersHeight / 2 + centerAdjustment) -
                getThickness / 2) >
            getEffectiveRulersHeight / 2) {
          bottomEffectiveRulerHeight =
              (getPrimaryRulersHeight / 2 + centerAdjustment) -
                  getThickness / 2;
        }
      }

      if (pointerMaxOfBottomAndCenter! <= bottomEffectiveRulerHeight) {
        pointerMaxOfBottomAndCenter = 0;
      } else {
        bottomEffectiveRulerHeight = 0;
      }

      getEffectiveRulersHeight =
          upperEffectiveRulerHeight + bottomEffectiveRulerHeight;
    }
    return getEffectiveRulersHeight +
        pointerMaxOfTopAndCenter! +
        pointerMaxOfBottomAndCenter! +
        getThickness +
        rulersOffset +
        valueBarMaxOfBottomAndCenter! +
        valueBarMaxOfTopAndCenter!;
  }

  double getMaxRulerHeight() {
    double effectiveSize = (getGaugeOrientation == GaugeOrientation.horizontal)
        ? getLabelHeight()
        : getLabelWidth();
    double getEffectiveRulersHeight = math.max(
        getPrimaryRulersHeight + getLabelOffset + effectiveSize,
        getSecondaryRulersHeight);
    return getEffectiveRulersHeight;
  }

  double getMaxRulerHeightForCenter() {
    double getEffectiveRulersHeight = math.max(
        getPrimaryRulersHeight - getThickness,
        getSecondaryRulersHeight - getThickness);
    return getEffectiveRulersHeight;
  }

  double getMaxRulerWidth() {
    double getEffectiveRulersWidth =
        math.max(getPrimaryRulersWidth, getSecondaryRulersWidth);
    return getEffectiveRulersWidth;
  }

  double getLabelHeight() {
    double labelThickness = _linearGaugeLabel
        .getLabelSize(textStyle: getTextStyle, value: getStart.toString())
        .height;
    return labelThickness;
  }

  double getLabelWidth() {
    double labelThickness = _linearGaugeLabel
        .getLabelSize(textStyle: getTextStyle, value: getEnd.toString())
        .width;
    return labelThickness;
  }

  void _initMaxHeightPointerFromBottomAndCenter(
      double linearGaugeContainerThickness) {
    pointerMaxOfBottomAndCenter = math.max((bottomPointerHeight!),
        ((centerPointerHeight! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxWidthPointerFromLeftAndCenter(
      double linearGaugeContainerThickness) {
    pointerMaxOfLeftAndCenter = math.max((leftPointerHeight!),
        ((centerPointerHeight! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxHeightPointerFromTopAndCenter(
      double linearGaugeContainerThickness) {
    pointerMaxOfTopAndCenter = math.max((topPointerHeight!),
        ((centerPointerHeight! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxValueBarFromTopAndCenter(double linearGaugeContainerThickness) {
    valueBarMaxOfTopAndCenter = math.max((topValueBarOffset!),
        ((centerValueBarOffset! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxValueBarFromBottomAndCenter(
      double linearGaugeContainerThickness) {
    valueBarMaxOfBottomAndCenter = math.max((bottomValueBarOffset!),
        ((centerValueBarOffset! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxValueBarFromLeftAndCenter(double linearGaugeContainerThickness) {
    valueBarMaxOfLeftAndCenter = math.max((leftValueBarOffset!),
        ((centerValueBarOffset! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxValueBarFromRightAndCenter(
      double linearGaugeContainerThickness) {
    valueBarMaxOfRightAndCenter = math.max((rightValueBarOffset!),
        ((centerValueBarOffset! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxWidthPointerFromRightAndCenter(
      double linearGaugeContainerThickness) {
    pointerMaxOfRightAndCenter = math.max((rightPointerHeight!),
        ((centerPointerHeight! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _layoutCenterPointers(List<Pointer> centerPointers) {
    centerPointers = getPointersByPosition(getPointers, PointerPosition.center);

    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      centerPointerHeight = centerPointers.isNotEmpty
          ? getLargestPointerForLayout(centerPointers)?.height ?? 0
          : 0;
    } else {
      if (centerPointers.isNotEmpty) {
        var lPointer = getLargestPointerForLayout(centerPointers);
        if (lPointer?.shape == PointerShape.rectangle ||
            lPointer?.shape == PointerShape.diamond) {
          centerPointerHeight = lPointer?.width;
        } else {
          centerPointerHeight = lPointer?.height;
        }
      } else {
        centerPointerHeight = 0;
      }
    }
  }

  void _layoutBottomPointers(List<Pointer> bottomPointers) {
    bottomPointers = getPointersByPosition(getPointers, PointerPosition.bottom);
    bottomPointerHeight = bottomPointers.isNotEmpty
        ? getLargestPointerForLayout(bottomPointers)?.height ?? 0
        : 0;
  }

  void _layoutLeftPointers(List<Pointer> leftPointers) {
    leftPointers = getPointersByPosition(getPointers, PointerPosition.left);
    if (leftPointers.isNotEmpty) {
      var lPointer = getLargestPointerForLayout(leftPointers);
      if (lPointer?.shape == PointerShape.rectangle ||
          lPointer?.shape == PointerShape.diamond) {
        leftPointerHeight = lPointer?.width;
      } else {
        leftPointerHeight = lPointer?.height;
      }
    } else {
      leftPointerHeight = 0;
    }
  }

  void _layoutTopPointers(List<Pointer> topPointers) {
    topPointers = getPointersByPosition(getPointers, PointerPosition.top);
    topPointerHeight = topPointers.isNotEmpty
        ? getLargestPointerForLayout(topPointers)?.height ?? 0
        : 0;
  }

  void _layoutRightPointers(List<Pointer> rightPointers) {
    rightPointers = getPointersByPosition(getPointers, PointerPosition.right);
    if (rightPointers.isNotEmpty) {
      var lPointer = getLargestPointerForLayout(rightPointers);
      if (lPointer?.shape == PointerShape.rectangle ||
          lPointer?.shape == PointerShape.diamond) {
        rightPointerHeight = lPointer?.width;
      } else {
        rightPointerHeight = lPointer?.height;
      }
    } else {
      rightPointerHeight = 0;
    }
    // rightPointerHeight = rightPointers.isNotEmpty
    //     ? getLargestPointerForLayout(rightPointers)?.height ?? 0
    //     : 0;
  }

  void _layoutTopValueBar(List<ValueBar> topValueBars) {
    topValueBars = getValueBarByPosition(getValueBar, ValueBarPosition.top);
    if (topValueBars.isNotEmpty) {
      ValueBar? topLargestValueBar = getLargestValueBarForLayout(topValueBars);
      topValueBarOffset =
          topLargestValueBar!.valueBarThickness + topLargestValueBar.offset;
    } else {
      topValueBarOffset = 0;
    }
  }

  void _layoutBottomValueBar(List<ValueBar> bottomValueBars) {
    bottomValueBars =
        getValueBarByPosition(getValueBar, ValueBarPosition.bottom);
    if (bottomValueBars.isNotEmpty) {
      ValueBar? bottomLargestValueBar =
          getLargestValueBarForLayout(bottomValueBars);
      bottomValueBarOffset = bottomLargestValueBar!.valueBarThickness +
          bottomLargestValueBar.offset;
    } else {
      bottomValueBarOffset = 0;
    }
  }

  void _layoutCenterValueBar(List<ValueBar> centerValueBars) {
    centerValueBars =
        getValueBarByPosition(getValueBar, ValueBarPosition.center);
    if (centerValueBars.isNotEmpty) {
      ValueBar? centerLargestValueBar =
          getLargestValueBarForLayout(centerValueBars);
      centerValueBarOffset = centerLargestValueBar!.valueBarThickness;
    } else {
      centerValueBarOffset = 0;
    }
  }

  void _layoutLeftValueBar(List<ValueBar> leftValueBars) {
    leftValueBars = getValueBarByPosition(getValueBar, ValueBarPosition.left);
    if (leftValueBars.isNotEmpty) {
      ValueBar? leftLargestValueBar =
          getLargestValueBarForLayout(leftValueBars);
      leftValueBarOffset =
          leftLargestValueBar!.valueBarThickness + leftLargestValueBar.offset;
    } else {
      leftValueBarOffset = 0;
    }
  }

  void _layoutRightValueBar(List<ValueBar> rightValueBars) {
    rightValueBars = getValueBarByPosition(getValueBar, ValueBarPosition.right);
    if (rightValueBars.isNotEmpty) {
      ValueBar? rightLargestValueBar =
          getLargestValueBarForLayout(rightValueBars);
      rightValueBarOffset =
          rightLargestValueBar!.valueBarThickness + rightLargestValueBar.offset;
    } else {
      rightValueBarOffset = 0;
    }
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    double parentWidgetSize;

    final double actualParentWidth = constraints.maxWidth;
    final double actualParentHeight = constraints.maxHeight;

    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      parentWidgetSize = actualParentWidth;
    } else {
      parentWidgetSize = actualParentHeight;
    }
    final widgetThickness = getLinearGaugeThickness();
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      _axisActualSize = Size(parentWidgetSize, widgetThickness);
    } else {
      _axisActualSize = Size(widgetThickness, parentWidgetSize);
    }

    return constraints.constrain(_axisActualSize);
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    _setLinearGaugeContainerPaint();
    _setPrimaryRulersPaint();
    _setSecondaryRulersPaint();

    _calculateRulerPoints();
    if (rulerPosition == RulerPosition.center) {
      _paintGaugeContainer(canvas, size);
    }

    _drawPrimaryRulers(canvas);

    if (showSecondaryRulers) {
      _drawSecondaryRulers(canvas);
    }

    if (rulerPosition != RulerPosition.center) {
      _paintGaugeContainer(canvas, size);
    }

    var firstOffset = (!getInversedRulers)
        ? Offset(_valueInPixel, 0.0)
        : -Offset(_valueInPixel, 0.0);

    var firstOff =
        _linearGaugeLabel.getPrimaryRulersOffset[getStart.toString()]![0] +
            firstOffset;

    var verticalFirstOffset =
        _linearGaugeLabel.getPrimaryRulersOffset[getStart.toString()]!;

    Offset vert = verticalFirstOffset.first;
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      firstOff = vert;
    } else {
      firstOff = vert;
    }
    // Drawing Pointers based on list of pointers added to the gauge
    for (int i = 0; i < getPointers.length; i++) {
      if (getPointerAnimation[i].value <= 0) {
        return;
      }
      getPointers[i].drawPointer(
        getPointers[i].shape,
        canvas,
        gaugeStart,
        gaugeEnd,
        firstOff,
        i,
        this,
      );
    }

    canvas.restore();
  }

  double valueToPixel(double value) {
    final double pixel = ((value - getStart) / (getEnd - getStart)) * gaugeEnd;
    return pixel;
  }
}
