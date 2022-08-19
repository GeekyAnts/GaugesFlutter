import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:gauges/linear_gauge/linear_gauge_label.dart';

class LinearGaugePainter extends CustomPainter {
  LinearGaugePainter(
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
      required this.secondaryRulerWidth,
      required this.labelTopMargin,
      required this.primaryRulerColor,
      required this.secondaryRulerColor,
      required this.linearGaugeBoxDecoration})
      : assert(start <= end, "Start should be grater then end");

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
  double secondaryRulerWidth;
  double labelTopMargin;
  Color primaryRulerColor;
  Color secondaryRulerColor;
  LinearGaugeBoxDecoration linearGaugeBoxDecoration;

  final Paint _linearGaugeContainerPaint = Paint();
  final Paint _primaryRulerPaint = Paint();
  final Paint _secondaryRulerPaint = Paint();
  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();
  late Size _size;
  late Size _finalRulerSize;

  late Size _startLabelSize, _endLabelSize;

  void _setUp(Size size) {
    final double linearGaugeHeight = getRulerHeight();

    if (gaugeOrientation == GaugeOrientation.horizontal) {
      _finalRulerSize = Size(size.width, linearGaugeHeight);
    } else {
      _finalRulerSize = Size(linearGaugeHeight, linearGaugeHeight);
    }
    // _startLabelSize = _linearGaugeLabel.getLabelSize(
    //     textStyle: textStyle, value: int.parse(start.toString()).toString());
    // _endLabelSize = _linearGaugeLabel.getLabelSize(
    //     textStyle: textStyle, value: int.parse(end.toString()).toString());

    _size = size;
  }

  void _setGaugeContainerPaint(Rect rect) {
    _linearGaugeContainerPaint.color = linearGaugeBoxDecoration.color;
    _linearGaugeContainerPaint.strokeWidth = linearGaugeBoxDecoration.height;
    _linearGaugeContainerPaint.shader =
        linearGaugeBoxDecoration.linearGradient?.createShader(rect);
  }

  void _setPrimaryRulerPaint() {
    _primaryRulerPaint.color = primaryRulerColor;
    _primaryRulerPaint.strokeWidth = primaryRulersWidth;
  }

  void _setSecondaryRulerPaint() {
    _secondaryRulerPaint.color = secondaryRulerColor;
    _secondaryRulerPaint.strokeWidth = secondaryRulerWidth;
  }

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

  double _getDistanceByHundred() {
    final double distanceInHundred;
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      distanceInHundred = math.max((3 * _size.width) / 100, 1.0);
    } else {
      distanceInHundred = math.max((_size.height) / 100, 1.0);
    }
    return distanceInHundred;
  }

  void _calculateRulerPoints() {
    late double interval = (end - start) / ((3 * _size.width) / 100);
    final List<double> intervalDivisions = <double>[10, 5, 2, 1];
    late double currentInterval;
    for (final double intervalDivision in intervalDivisions) {
      currentInterval = (_size.width > 400 ? 1 : 10) * intervalDivision;
      if ((3 * _size.width / 100) < ((end - start) / currentInterval)) {
        break;
      }

      interval = currentInterval;
    }

    print(_size.width); // 20.97

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
        _size, end, primaryRulersHeight, linearGaugeBoxDecoration.height);

    // _linearGaugeLabel.addLabelsToMap();

    // _startLabelSize =
    //     _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: start);
    // _endLabelSize =
    //     _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: end);
  }

  double _convertValueToPercentage(double? value) {
    if (value! > end) {
      value = end;
    } else if (value < start) {
      value = start;
    }

    // ignore: todo
    // TODO:: What if value is in negative
    double valueInPercent = (value - start) / (end - start);

    return valueInPercent;
  }

  // double _convertPercentageToValue(double percentage) {
  //   // TODO:: What if value is in negative
  //   return (percentage * (end - start)) + start;
  // }

  double _convertValueToPixel(double? value) {
    final double percentage = _convertValueToPercentage(value);

    double? startPadding = getLabelSizePadding(start);
    double? endPadding = getLabelSizePadding(end);
    double? totalPaddingAroundLabel = startPadding + endPadding;
    if (rulerPadding.padding.horizontal > 0) {
      if (rulerPadding.padding.horizontal >= startPadding) {
        startPadding = rulerPadding.padding.horizontal;
      }

      if (rulerPadding.padding.horizontal >= endPadding) {
        endPadding = rulerPadding.padding.horizontal;
      }
    }
    bool isHorizontal = gaugeOrientation == GaugeOrientation.horizontal;
    return percentage *
        ((isHorizontal ? _finalRulerSize.width : _finalRulerSize.height) -
            (totalPaddingAroundLabel));
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

    // This needs to be changed when its vertical
    //final double labelLeftPosition =
    //     majorTickLeftPosition - (labelSize.width / 2);
    // labelOffset = Offset(labelLeftPosition,
    //     primaryRulersHeight + linearGaugeBoxDecoration.height);

    canvas.drawParagraph(
        paragraph,
        Offset(
            list[0].dx - (labelSize.width / 2), list[0].dy + labelTopMargin));
  }

  void _paintPrimaryRulers(Canvas canvas) {
    final double startRulerPosition =
        math.max(getLabelSizePadding(start), rulerPadding.padding.horizontal);

    for (int index = 0;
        index < _linearGaugeLabel.getListOfLabel.length;
        index++) {
      final double pixelValue =
          _convertValueToPixel(_linearGaugeLabel.getListOfLabel[index].value) +
              startRulerPosition;
      Offset startPoint = Offset(pixelValue,
          linearGaugeBoxDecoration.height + rulerPadding.padding.vertical);
      Offset endPoint = Offset(
          pixelValue, primaryRulersHeight + linearGaugeBoxDecoration.height);

      if (gaugeOrientation == GaugeOrientation.vertical) {
        startPoint = Offset(startPoint.dy, startPoint.dx);
        endPoint = Offset(endPoint.dy, endPoint.dx);
      }

      canvas.drawLine(startPoint, endPoint, _primaryRulerPaint);
      _paintSecondaryRulers(startPoint, index, canvas);
      //_drawLabels(canvas, index, startPoint.dx, startPoint.dy);
    }
  }

  void _paintSecondaryRulers(Offset startPoint, int index, Canvas canvas) {
    _setSecondaryRulerPaint();
    double targetLabel;

    double secondaryRulerStartPoint = startPoint.dx;

    if (index == _linearGaugeLabel.getListOfLabel.length - 1) {
      targetLabel = 0;
    } else {
      targetLabel = _convertValueToPixel(
          _linearGaugeLabel.getListOfLabel[index + 1].value);
    }

    final double length = (targetLabel -
                _convertValueToPixel(
                    _linearGaugeLabel.getListOfLabel[index].value))
            .abs() /
        (steps + 1);

    if (targetLabel != 0) {
      for (int i = 1; i <= steps; i++) {
        secondaryRulerStartPoint += length;
        canvas.drawLine(
            Offset(secondaryRulerStartPoint, 0),
            Offset(
                secondaryRulerStartPoint,
                secondaryRulersHeight +
                    linearGaugeBoxDecoration.height +
                    labelTopMargin),
            _secondaryRulerPaint);
      }
    }
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
    //_setGaugeContainerPaint(gaugeContainer);
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
  void paint(Canvas canvas, Size size) {
    _setUp(size);
    _calculateRulerPoints();
    _drawPrimaryRulers(canvas);
    // _setPrimaryRulerPaint();
    // _paintPrimaryRulers(canvas);
    if (showLinearGaugeContainer) _paintGaugeContainer(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // ignore: todo
    // TODO: implement shouldRepaint
    return true;
  }
}
