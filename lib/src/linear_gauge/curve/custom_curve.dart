// Method to Draw Custom Curves

import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/linear_gauge_painter.dart';

/// A [CustomCurve] is a class that is used to draw custom curves on the gauge.
///
///  * [startHeight] is the height of the curve from the start point.

class CustomCurve {
  CustomCurve({
    this.startHeight,
    this.endHeight,
    this.midHeight,
    this.isBeizerCurve,
    this.color,
    this.start,
    this.curvePosition = CurvePosition.bottom,
    this.end,
    required this.value,
  });

  final double value;
  final double? startHeight;
  final double? start;
  final double? end;
  final double? endHeight;
  final Color? color;
  final double? midHeight;
  final bool? isBeizerCurve;
  late CurvePosition curvePosition = CurvePosition.bottom;

  OffsetTuple getStartAndEndOffsets(
      GaugeOrientation orientation,
      CurvePosition position,
      Offset offset,
      double thickness,
      double getEnd,
      double gStart,
      double linearGaugeContainerXheight,
      double linearGaugeContainerYheight,
      RenderLinearGauge linearGauge) {
    switch (orientation) {
      case GaugeOrientation.horizontal:
        switch (position) {
          case CurvePosition.top:
            // Offsets for top position
            return OffsetTuple(
                Offset(offset.dx + linearGauge.valueToPixel(start!),
                    offset.dy + linearGaugeContainerYheight - thickness),
                Offset(getEnd,
                    offset.dy + linearGaugeContainerYheight - thickness));
          case CurvePosition.bottom:
            // Offsets for bottom position
            return OffsetTuple(
                Offset(offset.dx + linearGauge.valueToPixel(start!),
                    offset.dy + linearGaugeContainerYheight),
                Offset(getEnd, offset.dy + linearGaugeContainerYheight));
          default:
            break;
        }
        break;
      case GaugeOrientation.vertical:
        switch (position) {
          case CurvePosition.right:
            // Offsets for right position
            return OffsetTuple(
                Offset(offset.dx + linearGaugeContainerXheight,
                    offset.dy - linearGauge.valueToPixel(start!)),
                Offset(offset.dx + linearGaugeContainerXheight, gStart));
          case CurvePosition.left:
            // Offsets for left position
            return OffsetTuple(
                Offset(offset.dx + linearGaugeContainerXheight - thickness,
                    offset.dy - linearGauge.valueToPixel(start!)),
                Offset(offset.dx + linearGaugeContainerXheight - thickness,
                    gStart));
          default:
            break;
        }
        break;
      default:
        break;
    }
    return OffsetTuple(Offset(0, 0), Offset(0, 0));
    // If orientation or position is invalid,
  }

  void drawCurve(Canvas canvas, RenderLinearGauge linearGauge, double valueInPX,
      Offset offset) {
    OffsetTuple tuple = getStartAndEndOffsets(
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

    Offset startOffset = tuple.start;
    Offset endOffset = tuple.end;
    double start = linearGauge.gaugeStart;
    double end = linearGauge.gaugeEnd + start;
    late double leftHeight;
    late double rigthtHeight;
    late double controlpoint;
    GaugeOrientation orientation = linearGauge.getGaugeOrientation;
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

    Paint curvePaint = Paint()
      ..color = color ?? Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;

    // Method to draw Beizer Curve
    drawBeizierCurve() {
      Path path = Path();
      path.moveTo(startOffset.dx, startOffset.dy);
      orientation == GaugeOrientation.horizontal
          ? path.lineTo(startOffset.dx, startOffset.dy + leftHeight)
          : path.lineTo(startOffset.dx + leftHeight, startOffset.dy);
      orientation == GaugeOrientation.horizontal
          ? path.quadraticBezierTo(valueInPX, startOffset.dy + controlpoint,
              endOffset.dx, endOffset.dy + rigthtHeight)
          : path.quadraticBezierTo(startOffset.dx + controlpoint, valueInPX,
              endOffset.dx + rigthtHeight, endOffset.dy);

      orientation == GaugeOrientation.horizontal
          ? path.lineTo(endOffset.dx, endOffset.dy + rigthtHeight)
          : path.lineTo(endOffset.dx + rigthtHeight, endOffset.dy);
      path.lineTo(endOffset.dx, endOffset.dy);
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
