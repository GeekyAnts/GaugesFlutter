import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/linear_gauge_painter.dart';

/// A [CustomCurve] is a class that is used to draw custom Section or
///  Zones  on the gauge.
/// These custom Section or zones can have a bezier curve or be in a straight line.
///
///  * [midPoint] is the control point of the bezier curve.
///

class CustomCurve {
  CustomCurve({
    this.startHeight = 0,
    this.endHeight = 0,
    this.midHeight = 10,
    this.paintStyle = PaintStyle.fill,
    this.curveStyle = CurveStyle.bezier,
    this.color,
    this.start = 0,
    this.curvePosition = CurvePosition.bottom,
    this.end = 100,
    required this.midPoint,
  });

  ///
  /// [midPoint] is the control point of the Bezier curve.
  ///
  final double midPoint;

  ///
  /// [startHeight] is the height of the curve at the start point.
  ///
  double? startHeight;

  ///
  /// [start] is the start value of the curve.
  ///
  double? start;

  ///
  /// [end] is the end value of the curve.
  ///
  double? end;

  ///
  /// [endHeight] is the height of the curve at the end point.
  ///
  double? endHeight;

  ///
  /// [color] is the color of the curve.
  ///
  final Color? color;

  ///
  /// [midHeight] is the height of the curve at the mid point.
  ///
  final double? midHeight;

  ///
  /// [isBezierCurve] is a boolean value that determines whether the curve is a Bezier curve or not.
  ///
  // final bool? isBezierCurve;
  final CurveStyle curveStyle;

  ///
  /// [curvePosition] is the position of the curve on the LinearGauge.
  ///
  late CurvePosition curvePosition = CurvePosition.bottom;

  ///
  /// [paintStyle] is the style of paint of the curve.
  ///
  final PaintStyle paintStyle;

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
    RenderLinearGauge linearGauge,
  ) {
    final double startInPX = linearGauge.valueToPixel(start!);
    final double extendLinearGauge = linearGauge.getExtendLinearGauge;
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
    RenderLinearGauge linearGauge,
    double valueInPX,
    Offset offset,
  ) {
    final GaugeOrientation orientation = linearGauge.getGaugeOrientation;
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

    if (linearGauge.getInversedRulers) {
      double temp = 0;
      temp = startHeight!;
      startHeight = endHeight;
      endHeight = temp;

      // temp = start!;
      // start = end;
      // end = temp;
    }
    double calculatedValue = isHorizontal ? midPoint : end! - midPoint;
    if (linearGauge.getInversedRulers) {
      calculatedValue = end! - calculatedValue;
    }

    final double midPointInPixel = linearGauge.valueToPixel(calculatedValue) +
        linearGauge.gaugeStart +
        linearGauge.getExtendLinearGauge;
    final double endValueInPX =
        linearGauge.gaugeEnd - linearGauge.valueToPixel(end!);

    final OffsetTuple? tuple = getStartAndEndOffsets(
      linearGauge.getGaugeOrientation,
      curvePosition,
      offset,
      linearGauge.getThickness,
      linearGauge.gaugeEnd + linearGauge.gaugeStart,
      linearGauge.gaugeStart,
      linearGauge.xAxisForGaugeContainer,
      linearGauge.yAxisForGaugeContainer,
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
}

class OffsetTuple {
  final Offset start;
  final Offset end;

  OffsetTuple(this.start, this.end);
}
