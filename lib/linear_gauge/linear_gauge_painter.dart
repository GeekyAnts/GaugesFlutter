import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:geekyants_flutter_gauges/linear_gauge/linear_gauge_label.dart';

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
    required double labelSize,
    required Color labelColor,
    required double value,
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
        _linearGaugeContainerBgColor = linearGaugeBoxDecoration.color,
        _linearGaugeContainerValueColor = linearGaugeContainerValueColor,
        _labelSize = labelSize,
        _labelColor = labelColor,
        _value = value;

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
  /// Getter and Setter for the [textStyle] parameter.
  ///
  get getTextStyle => _textStyle;
  TextStyle _textStyle;
  set setTextStyle(textStyle) {
    if (_textStyle == textStyle) return;

    _textStyle = textStyle;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulersWidth] parameter.
  ///
  get getPrimaryRulersWidth => _primaryRulersWidth;
  double _primaryRulersWidth;
  set setPrimaryRulersWidth(primaryRulersWidth) {
    if (_primaryRulersWidth == primaryRulersWidth) return;

    _primaryRulersWidth = primaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulersHeight] parameter.
  ///
  get getPrimaryRulersHeight => _primaryRulersHeight;

  double _primaryRulersHeight;

  set setPrimaryRulersHeight(primaryRulersHeight) {
    if (_primaryRulersHeight == primaryRulersHeight) return;

    _primaryRulersHeight = primaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulersHeight] parameter.
  ///
  get getSecondaryRulersHeight => _secondaryRulersHeight;

  double _secondaryRulersHeight;

  set setSecondaryRulersHeight(secondaryRulersHeight) {
    if (_secondaryRulersHeight == secondaryRulersHeight) return;

    _secondaryRulersHeight = secondaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulersWidth] parameter.
  ///

  get getSecondaryRulersWidth => _secondaryRulersWidth;
  double _secondaryRulersWidth;
  set setSecondaryRulersWidth(secondaryRulersWidth) {
    if (_secondaryRulersWidth == secondaryRulersWidth) return;

    _secondaryRulersWidth = secondaryRulersWidth;
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
  /// Getter and Setter for the [primaryRulerColor] parameter.
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
  ///
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
  ///
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

  double get getLabelSize => _labelSize;
  double _labelSize;
  set setLabelSize(double val) {
    if (_labelSize == val) return;
    _labelSize = val;
    markNeedsPaint();
  }

  Color get getLabelColor => _labelColor;
  Color _labelColor;
  set setLabelColor(Color val) {
    if (_labelColor == val) return;
    _labelColor = val;
    markNeedsPaint();
  }

  LinearGaugeLabel get getLinearGaugeLabel {
    return _linearGaugeLabel;
  }

  final Paint _linearGaugeContainerPaint = Paint();
  final Paint _primaryRulersPaint = Paint();
  final Paint _secondaryRulersPaint = Paint();
  final Paint _linearGaugeContainerValuePaint = Paint();

  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();

  late Size _startLabelSize, _endLabelSize;

  void _calculateRulerPoints() {
    double screenSize = 3 * size.width;
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

    _startLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle, value: getStart);

    _endLabelSize =
        _linearGaugeLabel.getLabelSize(textStyle: getTextStyle, value: getEnd);

    _linearGaugeLabel.generateOffSetsForLabel(
        _startLabelSize,
        _endLabelSize,
        size,
        getEnd,
        getPrimaryRulersHeight,
        getLinearGaugeBoxDecoration.height,
        getLabelTopMargin);
  }

  void _drawLabels(Canvas canvas, String text, List<Offset> list) {
    final ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final String labelText = text;
    final double? value = double.tryParse(text);
    final ui.TextStyle labelTextStyle = ui.TextStyle(
      color: _labelColor,
      fontSize: _labelSize,
    );
    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(labelTextStyle)
          ..addText(labelText);
    final ui.Paragraph paragraph = paragraphBuilder.build();
    final Size labelSize =
        _linearGaugeLabel.getLabelSize(textStyle: getTextStyle, value: value);

    // ignore: todo
    /// TODO:: Hardcoded value
    paragraph.layout(ui.ParagraphConstraints(width: labelSize.width));

    canvas.drawParagraph(
        paragraph,
        Offset((list[0].dx - (labelSize.width / 2)),
            list[0].dy + getPrimaryRulersHeight + getLabelTopMargin));
  }

  void _paintGaugeContainer(Canvas canvas, Size size) {
    Offset offset = const Offset(0, 0);

    late Rect gaugeContainer;
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      gaugeContainer = Rect.fromLTWH(
          (offset.dx + _startLabelSize.width / 2),
          offset.dy,
          size.width -
              ((_endLabelSize.width / 2) + (_startLabelSize.width / 2)),
          getLinearGaugeBoxDecoration.height);
    }

    // get 50 % of total width;
    double removeStartPercentage = (getStart * 100) / getEnd;

    double totalWidth =
        size.width - ((_endLabelSize.width / 2) + (_startLabelSize.width / 2));
    double percentageInVal = (getValue * 100) / (getEnd);

    double totalValOnPixel = ((totalWidth * percentageInVal) / 100) -
        ((totalWidth * removeStartPercentage) / 100);

    if (getLinearGaugeBoxDecoration.borderRadius != null) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
            gaugeContainer,
            Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
          ),
          _linearGaugeContainerPaint);

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;
      gaugeContainer = Rect.fromLTWH((offset.dx + _startLabelSize.width / 2),
          offset.dy, totalValOnPixel, getLinearGaugeBoxDecoration.height);
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
      gaugeContainer = Rect.fromLTWH((offset.dx + _startLabelSize.width / 2),
          offset.dy, totalValOnPixel, getLinearGaugeBoxDecoration.height);
      if (getLinearGaugeBoxDecoration.linearGradient != null) {
        _linearGaugeContainerValuePaint.shader = getLinearGaugeBoxDecoration
            .linearGradient!
            .createShader(gaugeContainer);
      }
      canvas.drawRect(
        gaugeContainer,
        _linearGaugeContainerValuePaint,
      );
    }
  }

  void _drawPrimaryRulers(Canvas canvas) {
    _setPrimaryRulersPaint();
    _linearGaugeLabel.getPrimaryRulersOffset.forEach((key, value) {
      double y = value[1].dy + getLinearGaugeBoxDecoration.height;
      double x = value[1].dx;
      Offset a = Offset(x, y);
      canvas.drawLine(value[0], a, _primaryRulersPaint);
      _drawLabels(canvas, key, value);
    });
  }

  void _drawSecondaryRulers(Canvas canvas) {
    _linearGaugeLabel.generateSecondaryRulers(
        getSecondaryRulerPerInterval,
        canvas,
        _secondaryRulersPaint,
        getSecondaryRulersHeight + getLinearGaugeBoxDecoration.height);
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
    final desiredWidth = constraints.maxWidth;
    //final desiredHeight = constraints.maxHeight;
    final desiredSize = Size(desiredWidth, 50);
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
    _drawPrimaryRulers(canvas);
    _drawSecondaryRulers(canvas);
    if (getShowLinearGaugeContainer) _paintGaugeContainer(canvas, size);
    canvas.restore();
  }
}
