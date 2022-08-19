import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:gauges/linear_gauge/linear_gauge_label.dart';

class RenderLinearGauge extends RenderBox {
  RenderLinearGauge(
      {required this.start,
      required this.end,
      required this.steps,
      required this.showLinearGaugeContainer,
      required this.gaugeOrientation,
      required this.rulerPadding,
      required this.textStyle,
      required this.primaryRulersWidth,
      required this.primaryRulersHeight,
      required this.secondaryRulersHeight,
      required this.secondaryRulersWidth,
      required this.labelTopMargin,
      required this.primaryRulerColor,
      required this.secondaryRulerColor,
      required this.linearGaugeBoxDecoration})
      : assert(start < end, "Start should be grater then end"),
        _start = start,
        _end = end,
        _steps = steps,
        _showLinearGaugeContainer = showLinearGaugeContainer,
        _gaugeOrientation = gaugeOrientation,
        _rulerPadding = rulerPadding,
        _textStyle = textStyle,
        _primaryRulerColor = primaryRulerColor,
        _primaryRulersWidth = primaryRulersWidth,
        _primaryRulersHeight = primaryRulersHeight,
        _secondaryRulerColor = secondaryRulerColor,
        _secondaryRulersHeight = secondaryRulersHeight,
        _secondaryRulersWidth = secondaryRulersWidth,
        _labelTopMargin = labelTopMargin,
        _linearGaugeBoxDecoration = linearGaugeBoxDecoration;

  double start;
  double end;
  double steps;
  bool showLinearGaugeContainer;
  GaugeOrientation gaugeOrientation;
  Padding rulerPadding;
  TextStyle textStyle;
  double primaryRulersWidth;
  double primaryRulersHeight;
  double secondaryRulersHeight;
  double secondaryRulersWidth;
  double labelTopMargin;
  Color primaryRulerColor;
  Color secondaryRulerColor;
  LinearGaugeBoxDecoration linearGaugeBoxDecoration;

  ///
  /// Getter and Setter for the [start] parameter.
  ///
  double get getStart => _start;
  double _start;
  set setStart(double start) {
    if (_start == start) return;

    _start = start;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [end] parameter.
  ///
  get getEnd => _end;
  double _end;
  set setEnd(end) {
    if (_end == end) return;

    _end = end;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [steps] parameter.
  ///
  get getSteps => steps;
  double _steps;
  set setSteps(steps) {
    if (_steps == steps) return;

    _steps = steps;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [showLinearGaugeContainer] parameter.
  ///
  get getShowLinearGaugeContainer => showLinearGaugeContainer;
  bool _showLinearGaugeContainer;
  set setShowLinearGaugeContainer(showLinearGaugeContainer) {
    if (_showLinearGaugeContainer == showLinearGaugeContainer) return;

    _showLinearGaugeContainer = showLinearGaugeContainer;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [gaugeOrientation] parameter.
  ///
  get getGaugeOrientation => gaugeOrientation;
  GaugeOrientation _gaugeOrientation;

  set setGaugeOrientation(gaugeOrientation) {
    if (_gaugeOrientation == gaugeOrientation) return;

    _gaugeOrientation = gaugeOrientation;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [rulerPadding] parameter.
  ///
  get getRulerPadding => rulerPadding;
  Padding _rulerPadding;

  set setRulerPadding(rulerPadding) {
    if (_rulerPadding == rulerPadding) return;

    _rulerPadding = rulerPadding;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [textStyle] parameter.
  ///
  get getTextStyle => textStyle;
  TextStyle _textStyle;
  set setTextStyle(textStyle) {
    if (_textStyle == textStyle) return;

    _textStyle = textStyle;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulersWidth] parameter.
  ///
  get getPrimaryRulersWidth => primaryRulersWidth;
  double _primaryRulersWidth;
  set setPrimaryRulersWidth(primaryRulersWidth) {
    if (_primaryRulersWidth == primaryRulersWidth) return;

    _primaryRulersWidth = primaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulersHeight] parameter.
  ///
  get getPrimaryRulersHeight => primaryRulersHeight;

  double _primaryRulersHeight;

  set setPrimaryRulersHeight(primaryRulersHeight) {
    if (_primaryRulersHeight == primaryRulersHeight) return;

    _primaryRulersHeight = primaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulersHeight] parameter.
  ///
  get getSecondaryRulersHeight => secondaryRulersHeight;

  double _secondaryRulersHeight;

  set setSecondaryRulersHeight(secondaryRulersHeight) {
    if (_secondaryRulersHeight == secondaryRulersHeight) return;

    _secondaryRulersHeight = secondaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulersWidth] parameter.
  ///

  get getSecondaryRulersWidth => secondaryRulersWidth;
  double _secondaryRulersWidth;
  set setSecondaryRulersWidth(secondaryRulersWidth) {
    if (_secondaryRulersWidth == secondaryRulersWidth) return;

    _secondaryRulersWidth = secondaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [labelTopMargin] parameter.
  ///
  get getLabelTopMargin => labelTopMargin;
  double _labelTopMargin;

  set setLabelTopMargin(labelTopMargin) {
    if (_labelTopMargin == labelTopMargin) return;

    _labelTopMargin = labelTopMargin;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulerColor] parameter.
  ///
  get getPrimaryRulerColor => primaryRulerColor;
  Color _primaryRulerColor;

  set setPrimaryRulerColor(primaryRulerColor) {
    if (_primaryRulerColor == primaryRulerColor) return;
    _primaryRulerColor = primaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulerColor] parameter.
  ///
  get getSecondaryRulerColor => secondaryRulerColor;
  Color _secondaryRulerColor;

  set setSecondaryRulerColor(secondaryRulerColor) {
    if (_secondaryRulerColor == secondaryRulerColor) return;
    _secondaryRulerColor = secondaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [linearGaugeBoxDecoration] parameter.
  ///
  get getLinearGaugeBoxDecoration => linearGaugeBoxDecoration;

  LinearGaugeBoxDecoration _linearGaugeBoxDecoration;
  set setLinearGaugeBoxDecoration(linearGaugeBoxDecoration) {
    if (_linearGaugeBoxDecoration == linearGaugeBoxDecoration) return;
    _linearGaugeBoxDecoration = linearGaugeBoxDecoration;
    markNeedsPaint();
  }

  final Paint _linearGaugeContainerPaint = Paint();

  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();

  late Size _startLabelSize, _endLabelSize;

  double getRulerHeight() {
    late double rulerHeight;
    final double rulerPadding = this.rulerPadding.padding.vertical;
    final double singleRulerHeight =
        math.max(primaryRulersHeight, secondaryRulersHeight) +
            this.rulerPadding.padding.vertical;
    final double labelSize = _linearGaugeLabel.getMaxLabelSize(
        textStyle: textStyle,
        gaugeOrientation: gaugeOrientation,
        labelTopMargin: labelTopMargin);
    final double rulerSize =
        showLinearGaugeContainer ? linearGaugeBoxDecoration.height : 0;
    rulerHeight = rulerSize + singleRulerHeight + labelSize;

    if (rulerPadding > labelSize) {
      rulerHeight += rulerPadding - labelSize;
    }

    return rulerHeight;
  }

  double getLabelSizePadding(double value) {
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      return value == start
          ? _startLabelSize.width / 2
          : _endLabelSize.width / 2;
    } else {
      return value == start
          ? _startLabelSize.height / 2
          : _endLabelSize.height / 2;
    }
  }

  void _calculateRulerPoints() {
    late double interval = (end - start) / ((3 * size.width) / 100);
    final List<double> intervalDivisions = <double>[10, 5, 2, 1];
    late double currentInterval;
    for (final double intervalDivision in intervalDivisions) {
      currentInterval = (size.width > 400 ? 1 : 10) * intervalDivision;
      if ((3 * size.width / 100) < ((end - start) / currentInterval)) {
        break;
      }

      interval = currentInterval;
    }

    _linearGaugeLabel.addLabels(
      distanceValueInRangeOfHundred: steps == 0 ? interval : steps,
      start: start,
      end: end,
    );

    _startLabelSize =
        _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: start);

    _endLabelSize =
        _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: start);

    _linearGaugeLabel.generateOffSetsForLabel(_startLabelSize, _endLabelSize,
        size, end, primaryRulersHeight, linearGaugeBoxDecoration.height);
  }

  void _drawLabels(Canvas canvas, String text, List<Offset> list) {
    final ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final String labelText = text;
    final double? value = double.tryParse(text);
    final ui.TextStyle labelTextStyle = ui.TextStyle(
      color: Colors.black,
      fontSize: 11.0,
    );
    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(labelTextStyle)
          ..addText(labelText);
    final ui.Paragraph paragraph = paragraphBuilder.build();
    final Size labelSize =
        _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: value);

    // ignore: todo
    /// TODO:: Hardcoded value
    paragraph.layout(ui.ParagraphConstraints(width: labelSize.width));

    canvas.drawParagraph(
        paragraph,
        Offset(
            list[0].dx - (labelSize.width / 2), list[0].dy + labelTopMargin));
  }

  void _paintGaugeContainer(Canvas canvas, Size size) {
    double startLabelPadding = getLabelSizePadding(start);
    double endLabelPadding = getLabelSizePadding(end);
    if (startLabelPadding > rulerPadding.padding.horizontal) {
      startLabelPadding = startLabelPadding - rulerPadding.padding.horizontal;
    } else {
      startLabelPadding = 0;
    }

    if (endLabelPadding > rulerPadding.padding.horizontal) {
      endLabelPadding = endLabelPadding - rulerPadding.padding.horizontal;
    } else {
      endLabelPadding = 0;
    }
    Offset offset = const Offset(0, 0);

    late Rect gaugeContainer;
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      gaugeContainer = Rect.fromLTWH(
          (offset.dx + _startLabelSize.width / 2),
          offset.dy,
          size.width - (_startLabelSize.width + _endLabelSize.width / 2),
          linearGaugeBoxDecoration.height);
    }

    if (linearGaugeBoxDecoration.borderRadius != null) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(gaugeContainer,
              Radius.circular(linearGaugeBoxDecoration.borderRadius!)),
          _linearGaugeContainerPaint);
    } else {
      canvas.drawRect(gaugeContainer, _linearGaugeContainerPaint);
    }
  }

  void _drawPrimaryRulers(Canvas canvas) {
    _linearGaugeLabel.getPrimaryRulersOffset.forEach((key, value) {
      _linearGaugeContainerPaint.color = Colors.blueAccent;
      canvas.drawLine(value[0], value[1], _linearGaugeContainerPaint);
      _drawLabels(canvas, key, value);
    });
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = constraints.maxWidth;
    final desiredHeight = constraints.minHeight;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, (offset.dy));
    _calculateRulerPoints();
    _drawPrimaryRulers(canvas);
    // _setPrimaryRulerPaint();
    // _paintPrimaryRulers(canvas);
    if (showLinearGaugeContainer) _paintGaugeContainer(canvas, size);
  }
}
