import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:geekyants_flutter_gauges/linear_gauge/linear_gauge_label.dart';
import 'package:geekyants_flutter_gauges/linear_gauge/value_bar/value_bar.dart';

const _kDefaultLinearGaugeHeight = 200;

class RenderLinearGauge extends RenderBox {
  RenderLinearGauge({
    required Pointer pointer,
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
    required double valueBarOffset,
    required List<ValueBar> valueBar,
    required bool inversedRulers,
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
        _pointer = pointer,
        _rangeLinearGauge = rangeLinearGauge,
        _customLabels = customLabels,
        _rulersOffset = rulersOffset,
        _inversedRulers = inversedRulers,
        _valueBarPosition = valueBarPosition,
        _valueBarOffset = valueBarOffset,
        _valueBar = valueBar;

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
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_primaryRulersWidth] parameter.
  ///
  get getPrimaryRulersWidth => _primaryRulersWidth;
  double _primaryRulersWidth;
  set setPrimaryRulersWidth(primaryRulersWidth) {
    if (_primaryRulersWidth == primaryRulersWidth) return;

    _primaryRulersWidth = primaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_primaryRulersHeight] parameter.
  ///
  get getPrimaryRulersHeight => _primaryRulersHeight;

  double _primaryRulersHeight;

  set setPrimaryRulersHeight(primaryRulersHeight) {
    if (_primaryRulersHeight == primaryRulersHeight) return;

    _primaryRulersHeight = primaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_secondaryRulersHeight] parameter.
  ///

  get getSecondaryRulersHeight => _secondaryRulersHeight;

  double _secondaryRulersHeight;

  set setSecondaryRulersHeight(secondaryRulersHeight) {
    if (_secondaryRulersHeight == secondaryRulersHeight) return;

    _secondaryRulersHeight = secondaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_secondaryRulersWidth] parameter.
  ///
  get getSecondaryRulersWidth => _secondaryRulersWidth;
  double _secondaryRulersWidth;
  set setSecondaryRulersWidth(secondaryRulersWidth) {
    if (_secondaryRulersWidth == secondaryRulersWidth) return;

    _secondaryRulersWidth = secondaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_pointer] parameter.
  ///
  Pointer get getPointer => _pointer;
  Pointer _pointer;

  set setPointer(linearGaugeIndicator) {
    _pointer = linearGaugeIndicator;

    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [labelTopMargin] parameter.
  ///
  get getLabelTopMargin => _labelTopMargin;
  double _labelTopMargin;

  set setLabelTopMargin(labelTopMargin) {
    if (_labelTopMargin == labelTopMargin) return;

    _labelTopMargin = labelTopMargin;
    markNeedsPaint();
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
    markNeedsPaint();
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
    markNeedsPaint();
  }

  double get getLabelOffset => _labelOffset;
  double _labelOffset;
  set setLabelOffset(double val) {
    if (_labelOffset == val) return;
    _labelOffset = val;
    markNeedsPaint();
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
    markNeedsPaint();
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
  ValueBarPosition get valueBarPosition => _valueBarPosition;
  ValueBarPosition _valueBarPosition;
  set setValueBarPosition(ValueBarPosition val) {
    if (_valueBarPosition == val) return;
    _valueBarPosition = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [valueBarOffset] parameter.
  ///
  double get valueBarOffset => _valueBarOffset;
  double _valueBarOffset;
  set setValueBarOffset(double val) {
    if (_valueBarOffset == val) return;
    _valueBarOffset = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [valueBar] parameter.
  ///
  List<ValueBar> get getValueBar => _valueBar;
  List<ValueBar> _valueBar = <ValueBar>[];
  set setValueBar(List<ValueBar> val) {
    if (_valueBar == val) return;
    _valueBar = val;
    markNeedsPaint();
  }

  final Paint _linearGaugeContainerPaint = Paint();
  final Paint _primaryRulersPaint = Paint();
  final Paint _secondaryRulersPaint = Paint();
  final Paint _linearGaugeContainerValuePaint = Paint();
  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();

  late Size _startLabelSize, _endLabelSize;

  double _valueInPixel = 0;

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
            ? getStart.toInt().toString()
            : getEnd.toInt().toString());

    _endLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle,
        value: !getInversedRulers
            ? getEnd.toInt().toString()
            : getStart.toInt().toString());

    _linearGaugeLabel.generateOffSetsForLabel(
        _startLabelSize,
        _endLabelSize,
        size,
        getEnd,
        getPrimaryRulersHeight,
        getLinearGaugeBoxDecoration,
        getLabelTopMargin,
        _pointer,
        getCustomLabels!.isNotEmpty,
        getInversedRulers,
        getGaugeOrientation);
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
      return getTextStyle.color;
    }

    final ui.TextStyle labelTextStyle = ui.TextStyle(
      // color: getTextStyle.color,
      color: getRangeColor(text),
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
              labelSize.height +
              2),
        );
        break;
      case RulerPosition.center:
        if (getGaugeOrientation == GaugeOrientation.horizontal) {
          double labelOffset =
              (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
          labelPosition = Offset(
            (list[0].dx - (labelSize.width / 2)),
            (list[0].dy + getPrimaryRulersHeight + labelOffset),
          );
        } else {
          double labelOffset =
              (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
          labelPosition = Offset(
            (list[0].dx + getPrimaryRulersHeight + labelOffset),
            (list[0].dy - (labelSize.height / 2)),
          );
        }
        break;
      case RulerPosition.bottom:
        double labelOffset =
            (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
        labelPosition = Offset(
          (list[0].dx - (labelSize.width / 2)),
          (list[0].dy + getPrimaryRulersHeight + labelOffset + getRulersOffset),
        );
        break;
      case RulerPosition.right:
        double labelOffset =
            (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
        labelPosition = Offset(
          (list[0].dx +
              (getPrimaryRulersHeight + labelOffset + getRulersOffset)),
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
              labelSize.width),
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
      assert(rangeLinearGauge!.last.end <= getEnd,
          'The end value of the range should be less than the end value of the gauge.');
      assert(rangeLinearGauge!.first.start >= getStart,
          'The start value of the range should be less than the start value of the gauge.');
    }

    Offset offset = const Offset(0, 0);
    late double end;
    late double start;

    if (showLabel) {
      end = GaugeOrientation.horizontal == getGaugeOrientation
          ? size.width -
              ((_endLabelSize.width / 2) +
                  (_startLabelSize.width / 2) +
                  (_pointer.width!))
          : (size.height -
              ((_endLabelSize.height / 2) +
                  (_startLabelSize.height / 2) +
                  (_pointer.width!)));

      start = GaugeOrientation.horizontal == getGaugeOrientation
          ? (offset.dx + (_startLabelSize.width / 2) + (_pointer.width! / 2))
          : (offset.dx + (_startLabelSize.height / 2) + (_pointer.width! / 2));
    } else {
      end = GaugeOrientation.horizontal == getGaugeOrientation
          ? size.width
          : size.height;
      start = offset.dx;
    }

    late Rect gaugeContainer;
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      gaugeContainer = Rect.fromLTWH(
        start,
        offset.dy,
        end,
        getLinearGaugeBoxDecoration.height,
      );
    } else {
      gaugeContainer = Rect.fromLTWH(
        offset.dy,
        start,
        getLinearGaugeBoxDecoration.width,
        end,
      );
    }

    double totalWidth = end;
    double totalValOnPixel;

    if (getValue < getStart) {
      totalValOnPixel = 0.0;
    } else {
      totalValOnPixel =
          ((getValue - getStart) / (getEnd - getStart)) * totalWidth;
    }

    // if pointer value is null then draw the value in the gauge container
    if (_pointer.value == null) {
      _valueInPixel = totalValOnPixel;
    } else {
      double pointerValue = _pointer.value ?? getValue;
      double pointerValueInPx =
          ((pointerValue - getStart) / (getEnd - getStart)) * totalWidth;
      _valueInPixel = pointerValueInPx;
    }

    if (getLinearGaugeBoxDecoration.borderRadius != null) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
            gaugeContainer,
            Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
          ),
          _linearGaugeContainerPaint);

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;

      gaugeContainer = Rect.fromLTWH(
        !getInversedRulers ? start : (start + end),
        offset.dy,
        !getInversedRulers ? totalValOnPixel : -totalValOnPixel,
        getLinearGaugeBoxDecoration.height,
      );

      if (getLinearGaugeBoxDecoration.linearGradient != null) {
        _linearGaugeContainerValuePaint.shader = getLinearGaugeBoxDecoration
            .linearGradient!
            .createShader(gaugeContainer);
      }
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
        ),
        _linearGaugeContainerValuePaint,
      );
    } else {
      canvas.drawRect(gaugeContainer, _linearGaugeContainerPaint);

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;
      if (getGaugeOrientation == GaugeOrientation.horizontal) {
        gaugeContainer = Rect.fromLTWH(
          !getInversedRulers ? start : (start + end),
          offset.dy,
          !getInversedRulers ? totalValOnPixel : -totalValOnPixel,
          getLinearGaugeBoxDecoration.height,
        );
      } else {
        gaugeContainer = Rect.fromLTWH(
          offset.dy,
          !getInversedRulers ? start : (start + end),
          getLinearGaugeBoxDecoration.height,
          !getInversedRulers ? totalValOnPixel : -totalValOnPixel,
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

      // For loop for drawing value bar in [LinearGauge]
      for (int j = 0; j < getValueBar.length; j++) {
        getValueBar[j].drawValueBar(canvas, start, end, totalWidth, this);
      }

      /// For loop for calculating colors in [RangeLinearGauge]
      for (int i = 0; i < rangeLinearGauge!.length; i++) {
        // Method to cal exact width
        double calculateValuePixelWidth(double value) {
          return ((value - getStart) / (getEnd - getStart)) * totalWidth;
        }

        // width of the colorRange
        double colorRangeWidth =
            calculateValuePixelWidth(rangeLinearGauge![i].end) -
                calculateValuePixelWidth(rangeLinearGauge![i].start);

        // Start of the ColorRange

        double colorRangeStart = !getInversedRulers
            ? (calculateValuePixelWidth(rangeLinearGauge![i].start) + start)
            : ((start + end) -
                calculateValuePixelWidth(rangeLinearGauge![i].start));

        _linearGaugeContainerValuePaint.color = rangeLinearGauge![i].color;
        gaugeContainer = Rect.fromLTWH(
          colorRangeStart,
          offset.dy,
          (!getInversedRulers) ? colorRangeWidth : -colorRangeWidth,
          getLinearGaugeBoxDecoration.height,
        );

        _linearGaugeContainerValuePaint.color = rangeLinearGauge![i].color;
        canvas.drawRect(
          gaugeContainer,
          _linearGaugeContainerValuePaint,
        );
      }
    }
  }

  void _drawPrimaryRulers(Canvas canvas) {
    _setPrimaryRulersPaint();
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
          y = -(value[1].dy + getRulersOffset);
          x = value[1].dx;
          primaryRulerStartPoint = Offset(value[0].dx, -getRulersOffset);
          break;
        case RulerPosition.center:
          if (getGaugeOrientation == GaugeOrientation.horizontal) {
            //the y co-ordinate of the ending point is halved from it's original position

            y = (value[1].dy + getLinearGaugeBoxDecoration.height) / 2;
            x = value[1].dx;
            //the staring point is shifted half of the primary ruler height from the
            //center of the gauge container
            primaryRulerStartPoint = Offset(
                value[0].dx, value[0].dy / 2 - getPrimaryRulersHeight / 2);
          } else {
            y = value[1].dy;
            x = (value[1].dx + getLinearGaugeBoxDecoration.width) / 2;
            primaryRulerStartPoint = Offset(
                value[0].dx / 2 - getPrimaryRulersHeight / 2, value[0].dy);
          }
          break;
        case RulerPosition.bottom:
          //there is need to adjust y co-ordinate by adding the height of gauge container
          //bcz line will start drawing from behind of gauge container
          y = value[1].dy +
              getLinearGaugeBoxDecoration.height +
              getRulersOffset;
          x = value[1].dx;
          primaryRulerStartPoint =
              Offset(value[0].dx, value[0].dy + getRulersOffset);
          break;
        case RulerPosition.right:
          if (GaugeOrientation.vertical == getGaugeOrientation) {
            y = value[1].dy;
            x = value[1].dx +
                getLinearGaugeBoxDecoration.width +
                getRulersOffset;
            primaryRulerStartPoint =
                Offset(value[0].dx + getRulersOffset, value[0].dy);
          }

          break;
        case RulerPosition.left:
          if (GaugeOrientation.vertical == getGaugeOrientation) {
            y = value[1].dy;
            x = -(value[1].dx + getRulersOffset);
            primaryRulerStartPoint = Offset(-getRulersOffset, value[0].dy);
          }

          break;
      }

      //the ending point of the primary ruler

      Offset a = Offset(x!, y!);
      _primaryRulersPaint.color = primaryRulerColor!;

      canvas.drawLine(primaryRulerStartPoint!, a, _primaryRulersPaint);
      if (showLabel) {
        _drawLabels(canvas, _linearGaugeLabel.getListOfLabel[count].text!,
            _linearGaugeLabel.getListOfLabel[count].value!, value);
      }
      count++;
    });
  }

  void _drawSecondaryRulers(Canvas canvas) {
    _linearGaugeLabel.generateSecondaryRulers(
        getSecondaryRulerPerInterval,
        canvas,
        _secondaryRulersPaint,
        getSecondaryRulersHeight +
            (getGaugeOrientation == GaugeOrientation.horizontal
                ? getLinearGaugeBoxDecoration.height
                : getLinearGaugeBoxDecoration.width),
        rulerPosition,
        _pointer,
        rangeLinearGauge!,
        getRulersOffset,
        getGaugeOrientation,
        getGaugeOrientation == GaugeOrientation.horizontal
            ? getLinearGaugeBoxDecoration.height
            : getLinearGaugeBoxDecoration.width);
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
    _linearGaugeContainerPaint.color = getLinearGaugeContainerBgColor;
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = getGaugeOrientation == GaugeOrientation.vertical
        ? constraints.minWidth
        : constraints.maxWidth;
    final desiredHeight = getGaugeOrientation == GaugeOrientation.horizontal
        ? constraints.minHeight
        : constraints.maxHeight;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    _setLinearGaugeContainerPaint();
    _setSecondaryRulersPaint();

    _calculateRulerPoints();

    if (rulerPosition == RulerPosition.center) {
      if (getShowLinearGaugeContainer) {
        _paintGaugeContainer(canvas, size);
      }
    }

    if (showPrimaryRulers) {
      _drawPrimaryRulers(canvas);
    }

    if (showSecondaryRulers) {
      _drawSecondaryRulers(canvas);
    }

    if (rulerPosition != RulerPosition.center) {
      if (getShowLinearGaugeContainer) {
        _paintGaugeContainer(canvas, size);
      }
    }

    double value = getPointer.value ?? _valueInPixel;

    var firstOffset = (!getInversedRulers)
        ? Offset(_valueInPixel, 0.0)
        : -Offset(_valueInPixel, 0.0);
    if (_pointer.value == null) {
      _pointer.setPointerValue = value;
    }

    var firstOff =
        _linearGaugeLabel.getPrimaryRulersOffset[getStart.toString()]![0] +
            firstOffset;

    // Drawing the Pointer
    getPointer.drawPointer(
      _pointer.shape,
      canvas,
      firstOff,
      this,
    );
    canvas.restore();
  }
}
