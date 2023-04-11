// Method to Draw Custom Curves

import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/linear_gauge_painter.dart';

/// A [CustomCurve] is a class that is used to draw custom Section or
///  Zones  on the gauge.
/// These custom Section or zones can have a Beizer curve or be in a straight line.
///
///  * [midPoint] is the control point of the Beizer curve.
///

class CustomCurve {
  CustomCurve({
    this.startHeight,
    this.endHeight,
    this.midHeight = 50,
    this.isBeizerCurve = true,
    this.color,
    this.start = 0,
    this.curvePosition = CurvePosition.bottom,
    this.end = 100,
    required this.midPoint,
  });

  ///
  /// [midPoint] is the control point of the Beizer curve.
  ///
  final double midPoint;

  ///
  /// [startHeight] is the height of the curve at the start point.
  ///
  final double? startHeight;

  ///
  /// [start] is the start value of the curve.
  ///
  final double? start;

  ///
  /// [end] is the end value of the curve.
  ///
  final double? end;

  ///
  /// [endHeight] is the height of the curve at the end point.
  ///
  final double? endHeight;

  ///
  /// [color] is the color of the curve.
  ///
  final Color? color;

  ///
  /// [midHeight] is the height of the curve at the mid point.
  ///
  final double? midHeight;

  ///
  /// [isBeizerCurve] is a boolean value that determines whether the curve is a Beizer curve or not.
  ///
  final bool? isBeizerCurve;

  ///
  /// [curvePosition] is the position of the curve on the LinearGauge.
  ///
  late CurvePosition curvePosition = CurvePosition.bottom;

  // Method to Calculate the First & Last Offsets of the Curve
  OffsetTuple? getStartAndEndOffsets(
    GaugeOrientation orientation,
    CurvePosition position,
    Offset offset,
    double thickness,
    double getEnd,
    double gStart,
    double linearGaugeContainerXheight,
    double linearGaugeContainerYheight,
    RenderLinearGauge linearGauge,
  ) {
    final double startInPX = linearGauge.valueToPixel(start!);
    switch (position) {
      case CurvePosition.top:
        return OffsetTuple(
          Offset(
            offset.dx + startInPX,
            offset.dy + linearGaugeContainerYheight - thickness,
          ),
          Offset(getEnd, offset.dy + linearGaugeContainerYheight - thickness),
        );
      case CurvePosition.bottom:
        return OffsetTuple(
          Offset(
            offset.dx + startInPX,
            offset.dy + linearGaugeContainerYheight,
          ),
          Offset(getEnd, offset.dy + linearGaugeContainerYheight),
        );
      case CurvePosition.right:
        return OffsetTuple(
          Offset(
            offset.dx + linearGaugeContainerXheight,
            offset.dy - startInPX,
          ),
          Offset(offset.dx + linearGaugeContainerXheight, gStart),
        );
      case CurvePosition.left:
        return OffsetTuple(
          Offset(
            offset.dx + linearGaugeContainerXheight - thickness,
            offset.dy - startInPX,
          ),
          Offset(offset.dx + linearGaugeContainerXheight - thickness, gStart),
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

    final double calculatedValue = isHorizontal ? midPoint : end! - midPoint;
    final double valueinPX =
        linearGauge.valueToPixel(calculatedValue) + linearGauge.gaugeStart;
    final double endValueinPx =
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
    late double rigthtHeight;
    late double controlpoint;
    if (orientation == GaugeOrientation.horizontal) {
      if (curvePosition == CurvePosition.bottom ||
          curvePosition == CurvePosition.left) {
        leftHeight = startHeight!;
        rigthtHeight = endHeight!;
        controlpoint = midHeight!;
      } else {
        leftHeight = -startHeight!;
        rigthtHeight = -endHeight!;
        controlpoint = -midHeight!;
      }
    } else {
      if (curvePosition == CurvePosition.right ||
          curvePosition == CurvePosition.bottom) {
        leftHeight = startHeight!;
        rigthtHeight = endHeight!;
        controlpoint = midHeight!;
      } else {
        leftHeight = -startHeight!;
        rigthtHeight = -endHeight!;
        controlpoint = -midHeight!;
      }
    }

    final Paint curvePaint = Paint()
      ..color = color ?? Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;
    final Path path = Path();

    void drawCustomCurvePath() {
      if (isBeizerCurve!) {
        orientation == GaugeOrientation.horizontal
            ? path.quadraticBezierTo(
                valueInPX,
                startOffset.dy + controlpoint,
                endOffset.dx - endValueinPx,
                endOffset.dy + rigthtHeight,
              )
            : path.quadraticBezierTo(
                startOffset.dx + controlpoint,
                start! + valueinPX,
                endOffset.dx + rigthtHeight,
                endOffset.dy + endValueinPx,
              );
      } else {
        if (orientation == GaugeOrientation.horizontal) {
          path.lineTo(valueinPX, startOffset.dy + controlpoint);
          path.lineTo(endOffset.dx - endValueinPx, endOffset.dy + rigthtHeight);
        } else {
          path.lineTo(startOffset.dx + controlpoint, valueinPX);
          path.lineTo(endOffset.dx + rigthtHeight, endOffset.dy + endValueinPx);
        }
      }
    }

    // Method to draw Beizer Curve
    void drawBeizierCurve() {
      path.moveTo(startOffset.dx, startOffset.dy);
      orientation == GaugeOrientation.horizontal
          ? path.lineTo(startOffset.dx, startOffset.dy + leftHeight)
          : path.lineTo(startOffset.dx + leftHeight, startOffset.dy);
      drawCustomCurvePath();
      orientation == GaugeOrientation.horizontal
          ? path.lineTo(
              endOffset.dx - endValueinPx,
              endOffset.dy + rigthtHeight,
            )
          : path.lineTo(
              endOffset.dx + rigthtHeight,
              endOffset.dy + endValueinPx,
            );
      if (orientation == GaugeOrientation.horizontal) {
        path.lineTo(endOffset.dx - endValueinPx, endOffset.dy);
      } else {
        path.lineTo(endOffset.dx, endOffset.dy + endValueinPx);
      }
      path.close();
      canvas.drawPath(path, curvePaint);
    }

    drawBeizierCurve();
  }
}

class OffsetTuple {
  final Offset start;
  final Offset end;

  OffsetTuple(this.start, this.end);
}
