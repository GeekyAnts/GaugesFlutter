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
    this.color,
    required this.value,
  });

  final double value;
  final double? startHeight;
  final double? endHeight;
  final Color? color;
  final double? midHeight;

  void drawCurve(Canvas canvas, RenderLinearGauge linearGauge, double valueInPX,
      Offset offset) {
    double start = linearGauge.gaugeStart;
    double end = linearGauge.gaugeEnd + start;
    double pointerHeightTop = linearGauge.topPointerHeight!;
    double thickness = linearGauge.getThickness;
    bool isInversedRulers = linearGauge.getInversedRulers;
    GaugeOrientation orientation = linearGauge.getGaugeOrientation;

    Offset hOffset =
        Offset(valueInPX + start + linearGauge.getExtendLinearGauge, offset.dy);

    Offset vOffset = isInversedRulers
        ? Offset(
            offset.dx,
            offset.dy +
                (end - valueInPX - 2 * linearGauge.getExtendLinearGauge))
        : Offset(offset.dx, (offset.dy - valueInPX));

    offset = orientation == GaugeOrientation.horizontal ? hOffset : vOffset;

    print(pointerHeightTop);
    double lm = ((end - start) / 2) + start;
    Paint curvePaint = Paint()..color = color ?? Colors.red;
    final path = Path()
      ..moveTo(offset.dx, offset.dy)
      ..lineTo(start, -startHeight! + pointerHeightTop)
      ..quadraticBezierTo(
          valueInPX, -midHeight!, end, -endHeight! + pointerHeightTop)
      ..lineTo(end, offset.dy - thickness)
      // ..lineTo(start, 0)
      ..close();
    canvas.drawPath(path, curvePaint);
  }
}
