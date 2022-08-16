import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:gauges/linear_gauge/linear_gauge_label.dart';

class LinearGaugePainter extends CustomPainter {
  LinearGaugePainter({
    required this.color,
    required this.start,
    required this.end,
    required this.steps,
    required this.height,
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
  });

  Color color;
  double start;
  double end;
  double steps;
  double height;
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
    _startLabelSize =
        _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: start);
    _endLabelSize =
        _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: end);

    _size = size;
  }

  void _setGaugeContainerPaint() {
    _linearGaugeContainerPaint.color = color;
    _linearGaugeContainerPaint.strokeWidth = height;
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
    final double rulerSize = showLinearGaugeContainer ? height : 0;
    rulerHeight = rulerSize + singleRulerHeight + labelSize;

    if (rulerPadding > labelSize) {
      rulerHeight += rulerPadding - labelSize;
    }

    return rulerHeight;
  }

  double getLabelSizePadding(double value) {
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      return value == start ? _startLabelSize.width / 2 : _endLabelSize.width;
    } else {
      return value == start ? _startLabelSize.height / 2 : _endLabelSize.height;
    }
  }

  double _getDistanceByHundred() {
    final double distanceInHundred;
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      distanceInHundred = math.max((3 * _size.width) / 100, 1.0);
    } else {
      distanceInHundred = math.max((3 * _size.height) / 100, 1.0);
    }
    return distanceInHundred;
  }

  void _calculateRulerPoints() {
    // distance between point a and b irrespective of the sign
    final double distance = (end - start).abs();

    double distanceValueInRangeOfHundred = distance / _getDistanceByHundred();
    final num minDistance = math.pow(
      10,
      (math.log(distanceValueInRangeOfHundred) / math.log(10)).floor(),
    );

    final List<double> labelsInterval = [10, 5, 2, 1];

    for (final division in labelsInterval) {
      final double currentDivision = minDistance * division;
      if (_getDistanceByHundred() < (distance / currentDivision)) {
        break;
      }
      distanceValueInRangeOfHundred = currentDivision;
    }

    print(distanceValueInRangeOfHundred);

    _linearGaugeLabel.addLabels(
        distanceValueInRangeOfHundred: distanceValueInRangeOfHundred,
        start: start,
        end: end);

    _linearGaugeLabel.addLabelsToMap();

    _startLabelSize =
        _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: start);
    _endLabelSize =
        _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: end);
  }

  double _convertValueToPercentage(double? value) {
    if (value! > end) {
      value = end;
    } else if (value < start) {
      value = start;
    }

    // TODO:: What if value is in negative
    double valueInPercent = (value - start) / (end - start);

    return valueInPercent;
  }

  double _convertPercentageToValue(double percentage) {
    // TODO:: What if value is in negative
    return (percentage * (end - start)) + start;
  }

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

  void _drawLabels(Canvas canvas, int majorTickIndex,
      double majorTickLeftPosition, double top) {
    final ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
        textDirection: TextDirection.ltr, textAlign: TextAlign.left);
    final String labelText = _linearGaugeLabel.getMappedLabel[
        _linearGaugeLabel.getListOfLabel[majorTickIndex].value]!;
    final double? value =
        _linearGaugeLabel.getListOfLabel[majorTickIndex].value;
    final ui.TextStyle labelTextStyle = ui.TextStyle(color: Colors.black);
    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(labelTextStyle)
          ..addText(labelText);
    final ui.Paragraph paragraph = paragraphBuilder.build();
    final Size labelSize =
        _linearGaugeLabel.getLabelSize(textStyle: textStyle, value: value);
    paragraph.layout(ui.ParagraphConstraints(width: labelSize.width + 10));

    Offset labelOffset;

    // This needs to be changed when its vertical
    final double labelLeftPosition =
        majorTickLeftPosition - (labelSize.width / 2);
    labelOffset = Offset(labelLeftPosition, primaryRulersHeight);

    canvas.drawParagraph(paragraph, labelOffset);
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
      Offset startPoint =
          Offset(pixelValue, height + rulerPadding.padding.vertical);
      Offset endPoint = Offset(pixelValue, primaryRulersHeight);

      if (gaugeOrientation == GaugeOrientation.vertical) {
        startPoint = Offset(startPoint.dy, startPoint.dx);
        endPoint = Offset(endPoint.dy, endPoint.dx);
      }

      canvas.drawLine(startPoint, endPoint, _primaryRulerPaint);
      _paintSecondaryRulers(startPoint, index, canvas);
      _drawLabels(canvas, index, startPoint.dx, startPoint.dy);
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
            Offset(secondaryRulerStartPoint, secondaryRulersHeight + 10),
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
      gaugeContainer = Rect.fromLTWH((offset.dx + startLabelPadding), offset.dy,
          size.width - (startLabelPadding + endLabelPadding), height);
    }

    canvas.drawRect(gaugeContainer, _linearGaugeContainerPaint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _setUp(size);
    _setGaugeContainerPaint();
    _calculateRulerPoints();
    _setPrimaryRulerPaint();
    _paintPrimaryRulers(canvas);
    if (showLinearGaugeContainer) _paintGaugeContainer(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
