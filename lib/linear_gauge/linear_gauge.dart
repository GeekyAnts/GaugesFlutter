import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';

class LinearGauge extends StatefulWidget {
  final double start;
  final double end;
  final double steps;
  final Color rulerColor;
  final GaugeOrientation gaugeOrientation;

  /// if steps is not provided in constructor the default value will be given as  [ double step 5.0 ]
  /// Default ruler color is [Colors.black]
  /// Default [GaugeOrientation] is [GaugeOrientation.horizontal]
  const LinearGauge(
      {Key? key,
      required this.start,
      required this.end,
      rulerColor,
      steps,
      gaugeOrientation})
      : steps = steps ?? 5,
        rulerColor = rulerColor ?? Colors.black,
        gaugeOrientation = gaugeOrientation ?? GaugeOrientation.horizontal,
        super(key: key);

  @override
  State<LinearGauge> createState() => _LinearGaugeState();
}

class _LinearGaugeState extends State<LinearGauge> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomPaint(
        painter: GaugePainter(
            end: widget.end,
            start: widget.start,
            steps: widget.steps,
            rulerColor: widget.rulerColor,
            gaugeOrientation: widget.gaugeOrientation),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double start;
  final double end;
  final double steps;
  final Color rulerColor;
  final GaugeOrientation gaugeOrientation;

  // Using to know till which offset the drawGaugeContainer should be drawn
  late Offset lastOffset;

  GaugePainter(
      {required this.start,
      required this.end,
      required this.steps,
      required this.rulerColor,
      required this.gaugeOrientation});

  void drawGuageRuler(
    Canvas canvas,
    Paint paint,
  ) {
    // Initail points
    double x = 20;
    double y = 20;
    Offset point1;
    Offset point2;
    paint.color = rulerColor;
    paint.strokeWidth = 1;

    for (int i = 1; i <= end; i++) {
      if (i % steps == 0 || i == 1 || i == end) {
        point1 = Offset(x, 20);
        point2 = Offset(y, 40);
        paint.color = rulerColor;
        drawRulerPoints(canvas, paint, i.toString(), x - 5);
      } else {
        point1 = Offset(x, 20);
        point2 = Offset(y, 30);
        paint.color = Colors.grey;
      }

      if (i == end) {
        lastOffset = point1;
      }
      canvas.drawLine(point1, point2, paint);

      x += 10;
      y += 10;
    }
  }

  void drawRulerPoints(
      Canvas canvas, Paint paint, String point, double pointAxis) {
    TextSpan span = TextSpan(style: TextStyle(color: rulerColor), text: point);
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();

    Offset point2 = Offset(pointAxis, 40);
    tp.paint(canvas, point2);
  }

  void drawGaugeContainer(Canvas canvas, Offset lastOffset, Paint paint) {
    Rect rect =
        Rect.fromPoints(const Offset(20, 12), Offset(lastOffset.dx, 18));
    canvas.drawRect(rect, paint);
  }

  void horizontalLinearGauge(Canvas canvas, Size size) {
    Paint rulerPaint = Paint();
    drawGuageRuler(canvas, rulerPaint);
    rulerPaint.color = Colors.grey;
    drawGaugeContainer(canvas, lastOffset, rulerPaint);
  }

  void verticalLinerGauge(Canvas canvas) {
    Paint rulerPaint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      horizontalLinearGauge(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) {
    return false;
  }
}
