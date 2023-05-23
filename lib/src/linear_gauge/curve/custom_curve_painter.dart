import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/gauge_container/linear_gauge_container.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/linear_gauge_label.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/linear_gauge_painter.dart';

import '../../../geekyants_flutter_gauges.dart';

class RenderCurve extends RenderBox {
  RenderCurve({
    Key? key,
    double? startHeight,
    double? endHeight,
    double? midHeight,
    required PaintStyle paintStyle,
    required CurveStyle curveStyle,
    Color? color,
    double? start,
    required CurvePosition curvePosition,
    double? end,
    required LinearGauge linearGauge,
    required double midPoint,
  })  : _linearGauge = linearGauge,
        _start = start,
        _end = end,
        _startHeight = startHeight,
        _endHeight = endHeight,
        _color = color,
        _midHeight = midHeight,
        _midPoint = midPoint,
        _curveStyle = curveStyle,
        _curvePosition = curvePosition,
        _paintStyle = paintStyle;

  double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;

  LinearGauge get linearGauge => _linearGauge;
  LinearGauge _linearGauge;
  set setLinearGAuge(LinearGauge linearGauge) {
    if (_linearGauge == linearGauge) {
      return;
    }
    _linearGauge = linearGauge;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_start] parameter.
  ///
  double? get start => _start;
  double? _start;
  set setStart(double? start) {
    if (_start == start) return;
    _start = start;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_end] parameter.
  ///
  double? get end => _end;
  double? _end;
  set setEnd(double end) {
    if (_end == end) return;
    _end = end;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_startHeight] parameter.
  ///
  double? get startHeight => _startHeight;
  double? _startHeight;
  set setStartHeight(double? val) {
    if (_startHeight == val) return;
    _startHeight = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_endHeight] parameter.
  ///
  double? get endHeight => _endHeight;
  double? _endHeight;
  set setEndHeight(double val) {
    if (_endHeight == val) return;
    _endHeight = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_midPoint] parameter.
  ///
  double get midPoint => _midPoint;
  double _midPoint;
  set setMidPoint(double val) {
    if (_midPoint == val) return;
    _midPoint = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_midHeight] parameter.
  ///
  double? get midHeight => _midHeight;
  double? _midHeight;
  set setMidHeight(double? val) {
    if (_midHeight == val) return;
    _midHeight = val;
    markNeedsPaint();
  }

  /// Gets the color assigned to [RenderCurve].
  Color? get color => _color;
  Color? _color;

  /// Sets the color for [RenderCurve].
  set setColor(Color? value) {
    if (value == _color) {
      return;
    }

    _color = value;
    markNeedsPaint();
  }

  /// Gets the curveStyle assigned to [RenderCurve].
  CurveStyle get curveStyle => _curveStyle;
  CurveStyle _curveStyle;

  /// Sets the curveStyle for [RenderCurve].
  set setCurveStyle(CurveStyle value) {
    if (value == _curveStyle) {
      return;
    }

    _curveStyle = value;
    markNeedsPaint();
  }

  /// Gets the paintStyle assigned to [RenderCurve].
  PaintStyle get paintStyle => _paintStyle;
  PaintStyle _paintStyle;

  /// Sets the paintStyle for [RenderCurve].
  set setPaintStyle(PaintStyle value) {
    if (value == _paintStyle) {
      return;
    }

    _paintStyle = value;
    markNeedsPaint();
  }

  /// Gets the CurvePosition assigned to [RenderCurve].
  CurvePosition get curvePosition => _curvePosition;
  CurvePosition _curvePosition;

  /// Sets the CurvePosition for [RenderCurve].
  set setCurvePosition(CurvePosition value) {
    if (value == _curvePosition) {
      return;
    }

    _curvePosition = value;
    markNeedsPaint();
  }

  double getLinearGaugeStart() {
    if (linearGauge.customLabels!.isNotEmpty) {
      return linearGauge.customLabels!.first.value!;
    }
    return linearGauge.start!;
  }

  double getLinearGaugeEnd() {
    if (linearGauge.customLabels!.isNotEmpty) {
      return linearGauge.customLabels!.last.value!;
    }
    return linearGauge.end!;
  }

  // Method to Calculate the First & Last Offsets of the Curve
  OffsetTuple? getStartAndEndOffsets(
    GaugeOrientation orientation,
    CurvePosition position,
    Offset offset,
    double thickness,
    double getEnd,
    double gStart,
    double linearGaugeContainerXHeight,
    double linearGaugeContainerYHeight,
    LinearGauge linearGauge,
  ) {
    final double startInPX = valueToPixel(start!);
    final double extendLinearGauge = linearGauge.extendLinearGauge!;
    switch (position) {
      case CurvePosition.top:
        return OffsetTuple(
          Offset(
            offset.dx + startInPX,
            offset.dy + linearGaugeContainerYHeight - thickness,
          ),
          Offset(getEnd - extendLinearGauge,
              offset.dy + linearGaugeContainerYHeight - thickness),
        );
      case CurvePosition.bottom:
        return OffsetTuple(
          Offset(
            offset.dx + startInPX,
            offset.dy + linearGaugeContainerYHeight,
          ),
          Offset(getEnd - extendLinearGauge,
              offset.dy + linearGaugeContainerYHeight),
        );
      case CurvePosition.right:
        return OffsetTuple(
          Offset(
            offset.dx + linearGaugeContainerXHeight,
            offset.dy - startInPX,
          ),
          Offset(offset.dx + linearGaugeContainerXHeight,
              gStart + extendLinearGauge),
        );
      case CurvePosition.left:
        return OffsetTuple(
          Offset(
            offset.dx + linearGaugeContainerXHeight - thickness,
            offset.dy - startInPX,
          ),
          Offset(offset.dx + linearGaugeContainerXHeight - thickness,
              gStart + extendLinearGauge),
        );
    }
  }

  void drawCurve(
    Canvas canvas,
    LinearGauge linearGauge,
    double valueInPX,
    Offset offset,
  ) {
    final GaugeOrientation orientation = linearGauge.gaugeOrientation!;
    final bool isHorizontal =
        (orientation == GaugeOrientation.horizontal) ? true : false;

    // Throw Assert if Invalid Position
    assert(
      isHorizontal &&
              (curvePosition == CurvePosition.top ||
                  curvePosition == CurvePosition.bottom) ||
          !isHorizontal &&
              (curvePosition == CurvePosition.left ||
                  curvePosition == CurvePosition.right),
      'Invalid curve position for the current orientation',
    );
    if (linearGauge.rulers!.inverseRulers!) {
      double temp = 0;
      temp = startHeight!;
      setStartHeight = endHeight;
      setEndHeight = temp;

      // temp = start!;
      // start = end;
      // end = temp;
    }
    double calculatedValue = isHorizontal ? midPoint : end! - midPoint;
    if (linearGauge.rulers!.inverseRulers!) {
      calculatedValue = end! - calculatedValue;
    }

    final double midPointInPixel = valueToPixel(calculatedValue) +
        RenderLinearGaugeContainer.gaugeStart +
        linearGauge.extendLinearGauge!;
    final double endValueInPX =
        RenderLinearGaugeContainer.gaugeEnd - valueToPixel(end!);

    final OffsetTuple? tuple = getStartAndEndOffsets(
      linearGauge.gaugeOrientation!,
      curvePosition,
      offset,
      linearGauge.linearGaugeBoxDecoration!.thickness!,
      RenderLinearGaugeContainer.gaugeEnd +
          RenderLinearGaugeContainer.gaugeStart,
      RenderLinearGaugeContainer.gaugeStart,
      xAxisForGaugeContainer,
      yAxisForGaugeContainer,
      linearGauge,
    );

    final Offset startOffset = tuple!.start;
    final Offset endOffset = tuple.end;

    late double leftHeight;
    late double rightHeight;
    late double controlPoint;
    if (orientation == GaugeOrientation.horizontal) {
      if (curvePosition == CurvePosition.bottom ||
          curvePosition == CurvePosition.left) {
        leftHeight = startHeight!;
        rightHeight = endHeight!;
        controlPoint = midHeight!;
      } else {
        leftHeight = -startHeight!;
        rightHeight = -endHeight!;
        controlPoint = -midHeight!;
      }
    } else {
      if (curvePosition == CurvePosition.right ||
          curvePosition == CurvePosition.bottom) {
        leftHeight = startHeight!;
        rightHeight = endHeight!;
        controlPoint = midHeight!;
      } else {
        leftHeight = -startHeight!;
        rightHeight = -endHeight!;
        controlPoint = -midHeight!;
      }
    }

    final Paint curvePaint = Paint()
      ..color = color ?? Colors.red
      ..style = paintStyle == PaintStyle.fill
          ? PaintingStyle.fill
          : PaintingStyle.stroke
      ..strokeWidth = 3;
    final Path path = Path();

    void drawCustomCurvePath() {
      if (curveStyle == CurveStyle.bezier) {
        orientation == GaugeOrientation.horizontal
            ? path.quadraticBezierTo(
                valueInPX,
                startOffset.dy + controlPoint,
                endOffset.dx - endValueInPX,
                endOffset.dy + rightHeight,
              )
            : path.quadraticBezierTo(
                startOffset.dx + controlPoint,
                start! + midPointInPixel,
                endOffset.dx + rightHeight,
                endOffset.dy + endValueInPX,
              );
      } else {
        if (orientation == GaugeOrientation.horizontal) {
          path.lineTo(midPointInPixel, startOffset.dy + controlPoint);
          path.lineTo(endOffset.dx - endValueInPX, endOffset.dy + rightHeight);
        } else {
          path.lineTo(startOffset.dx + controlPoint, midPointInPixel);
          path.lineTo(endOffset.dx + rightHeight, endOffset.dy + endValueInPX);
        }
      }
    }

    // Method to draw bezier Curve
    void drawBezierCurve() {
      path.moveTo(startOffset.dx, startOffset.dy);
      orientation == GaugeOrientation.horizontal
          ? path.lineTo(startOffset.dx, startOffset.dy + leftHeight)
          : path.lineTo(startOffset.dx + leftHeight, startOffset.dy);
      drawCustomCurvePath();
      orientation == GaugeOrientation.horizontal
          ? path.lineTo(
              endOffset.dx - endValueInPX,
              endOffset.dy + rightHeight,
            )
          : path.lineTo(
              endOffset.dx + rightHeight,
              endOffset.dy + endValueInPX,
            );
      if (orientation == GaugeOrientation.horizontal) {
        path.lineTo(endOffset.dx - endValueInPX, endOffset.dy);
      } else {
        path.lineTo(endOffset.dx, endOffset.dy + endValueInPX);
      }
      path.close();
      canvas.drawPath(path, curvePaint);
    }

    drawBezierCurve();
  }

  double valueToPixel(double value) {
    final double pixel = ((value - getLinearGaugeStart()) /
            (getLinearGaugeEnd() - getLinearGaugeStart())) *
        RenderLinearGaugeContainer.gaugeEnd;
    return pixel;
  }

  @override
  void performLayout() {
    double greatestHeight = 0;
    double currentGreatestHeight = startHeight!;
    if (midHeight! > currentGreatestHeight) {
      currentGreatestHeight = midHeight!;
    }
    if (endHeight! > currentGreatestHeight) {
      currentGreatestHeight = endHeight!;
    }

    if (currentGreatestHeight > greatestHeight) {
      greatestHeight = currentGreatestHeight;
    }

    double startInPixel = valueToPixel(start!);
    double endInPixel = valueToPixel(end!);
    double totalWidth = endInPixel - startInPixel;

    Size widgetSize;

    if (linearGauge.gaugeOrientation == GaugeOrientation.horizontal) {
      widgetSize = Size(totalWidth, greatestHeight);
    } else {
      widgetSize = Size(greatestHeight, totalWidth);
    }

    size = widgetSize;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    xAxisForGaugeContainer = RenderLinearGauge.xAxisForGaugeContainer;
    yAxisForGaugeContainer = RenderLinearGauge.yAxisForGaugeContainer;

    var firstOff =
        LinearGaugeLabel.primaryRulers[getLinearGaugeStart().toString()]![0];

    // Drawing CustomCurves

    if (linearGauge.rulers!.inverseRulers!) {
      if (linearGauge.gaugeOrientation == GaugeOrientation.horizontal) {
        firstOff = Offset(
            RenderLinearGaugeContainer.gaugeEnd -
                firstOff.dx +
                RenderLinearGaugeContainer.gaugeStart * 2,
            firstOff.dy);
      } else {
        firstOff = Offset(
            firstOff.dx,
            RenderLinearGaugeContainer.gaugeEnd -
                firstOff.dy +
                RenderLinearGaugeContainer.gaugeStart * 2);
      }
    }
    double value = valueToPixel(midPoint);
    if (linearGauge.rulers!.inverseRulers!) {
      value = RenderLinearGaugeContainer.gaugeEnd -
          value +
          RenderLinearGaugeContainer.gaugeStart * 2;
    }
    drawCurve(canvas, linearGauge, value, firstOff);
  }
}

class OffsetTuple {
  final Offset start;
  final Offset end;

  OffsetTuple(this.start, this.end);
}
