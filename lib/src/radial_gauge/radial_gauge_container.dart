import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge.dart';

class RadialGaugeContainer extends LeafRenderObjectWidget {
  const RadialGaugeContainer({
    Key? key,
    required this.radialGauge,
  }) : super(key: key);

  final RadialGauge radialGauge;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRadialGaugeContainer(
      radialGauge: radialGauge,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderRadialGaugeContainer renderObject) {
    renderObject.setRadialGauge = radialGauge;
  }
}

class RenderRadialGaugeContainer extends RenderBox {
  RenderRadialGaugeContainer({
    Key? key,
    required RadialGauge radialGauge,
  })  : _radialGauge = radialGauge,
        super();

  RadialGauge get getRadialGauge => _radialGauge;
  RadialGauge _radialGauge;
  set setRadialGauge(RadialGauge radialGauge) {
    if (_radialGauge == radialGauge) return;
    _radialGauge = radialGauge;
    markNeedsPaint();
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return false;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.constrain(const Size(100, 100));
  }

  @override
  void performLayout() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final Paint paint = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double startAngle = getRadialGauge.track.startAngle * (pi / 180);
    double endAngle = getRadialGauge.track.endAngle * (pi / 180);
    if (startAngle > endAngle) {
      double temp = startAngle;
      startAngle = endAngle;
      endAngle = temp;
    }
    double arcLength = endAngle - startAngle; // length of the arc in radians
    const int numParts = 10; // number of parts to divide the arc into
    double partAngle = arcLength / numParts; // angle of each part in radians
    final Paint containerPaint = Paint()
      ..color = getRadialGauge.track.color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = getRadialGauge.track.thickness
      ..style = PaintingStyle.stroke;
    var thickness = getRadialGauge.track.thickness;
    double shortestSide = size.shortestSide;
    double radius = shortestSide / 2 - thickness; // radius of the arc
    final center = Offset(size.width / 2, size.height / 2);
    const double rulerLength = 20.0; // length of each ruler
    Rect c = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(c, startAngle, arcLength, false, containerPaint);

    for (int i = 0; i <= numParts; i++) {
      final double angle =
          startAngle + i * partAngle; // angle of the current part
      final Offset startPoint = Offset(
          (radius - thickness) * cos(angle), (radius - thickness) * sin(angle));
      final Offset endPoint = Offset(
          ((radius - thickness) - rulerLength) * cos(angle),
          ((radius - thickness) - rulerLength) * sin(angle));

      final Offset labelEndPoint = Offset(
          (radius - rulerLength - 20 - thickness) * cos(angle),
          (radius - rulerLength - 20 - thickness) * sin(angle));

      // Draw the ruler
      canvas.drawLine(center + startPoint, center + endPoint, paint);

      //! DRAW ANGLE LABEL
      final TextPainter textPainter =
          TextPainter(textDirection: TextDirection.ltr);
      const String labelFormat = '%d';
      final double langle =
          startAngle + i * partAngle; // the angle of the current ruler
      // the y coordinate of the label
      final String label = labelFormat.replaceAll(
          '%d', ((langle - startAngle) * 180 / pi).round().toString());
      double l = double.parse(label);
      // print(object)
      double labelRuler = (l - startAngle) / (endAngle - startAngle) * 100;

      textPainter.text = TextSpan(
          text: l.toString(),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold));
      textPainter.layout();

      final Offset labelOffset = Offset(
          (labelEndPoint.dx + center.dx) - textPainter.width / 2,
          (labelEndPoint.dy + center.dy) - textPainter.height / 2);

      textPainter.paint(canvas, labelOffset);
    }
  }
}
