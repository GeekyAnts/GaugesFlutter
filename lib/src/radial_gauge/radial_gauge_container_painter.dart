import 'dart:math';

import 'package:flutter/material.dart';

import '../../geekyants_flutter_gauges.dart';

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
    markNeedsLayout();
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.constrain(constraints.biggest);
  }

  @override
  void performLayout() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  void paintRulersAndLabels(
    Canvas canvas,
    double numParts,
    double startAngle,
    double partAngle,
    double radius,
    double thickness,
    double rulerLength,
    Offset center,
  ) {
    bool showFirstLabel = getRadialGauge.track.trackStyle.showFirstLabel;
    bool showLastLabel = getRadialGauge.track.trackStyle.showLastLabel;
    // Primary Ruler Paint
    final Paint primaryRulerPaint = Paint()
      ..color = getRadialGauge.track.trackStyle.primaryRulerColor!
      ..strokeWidth = getRadialGauge.track.trackStyle.primaryRulersWidth!
      ..style = PaintingStyle.stroke;

    // Secondary Ruler Paint
    final Paint secondaryRulerPaint = Paint()
      ..color = getRadialGauge.track.trackStyle.secondaryRulerColor!
      ..strokeWidth = getRadialGauge.track.trackStyle.secondaryRulersWidth!
      ..style = PaintingStyle.stroke;

    final trackLabelFormater = getRadialGauge.track.trackLabelFormater ??
        (double value) => ((value * 10).round() / 10).toString();

    // Loop to draw the Rulers and Labels
    for (int i = 0; i <= numParts; i++) {
      double rulerOffset = getRadialGauge.track.trackStyle.rulersOffset ?? 0;
      final double angle =
          startAngle + i * partAngle; // angle of the current part
      final Offset startPoint = Offset(
          (radius - thickness - rulerOffset) * cos(angle),
          (radius - thickness - rulerOffset) * sin(angle));
      final Offset endPoint = Offset(
          ((radius - thickness - rulerOffset) - rulerLength) * cos(angle),
          ((radius - thickness - rulerOffset) - rulerLength) * sin(angle));

      final Offset labelEndPoint = Offset(
          (radius - rulerLength - 20 - thickness) * cos(angle),
          (radius - rulerLength - 20 - thickness) * sin(angle));

      var secondaryRulerInterval =
          getRadialGauge.track.trackStyle.secondaryRulerPerInterval ?? 1;
      var secondaryRulerLength =
          getRadialGauge.track.trackStyle.secondaryRulersHeight ?? 5;

      final double secondaryRulerAngle =
          partAngle / (secondaryRulerInterval + 1);

      // Draw the primary Ruler
      if (getRadialGauge.track.trackStyle.showPrimaryRulers) {
        canvas.drawLine(
            center + startPoint, center + endPoint, primaryRulerPaint);
      }
      if (i != numParts) {
        for (int j = 1; j <= secondaryRulerInterval; j++) {
          final double secondaryAngle = angle + (j * secondaryRulerAngle);
          final Offset secondaryStartPoint = Offset(
              (radius - thickness - rulerOffset) * cos(secondaryAngle),
              (radius - thickness - rulerOffset) * sin(secondaryAngle));

          final Offset secondaryEndPoint = Offset(
              ((radius - thickness - rulerOffset) - secondaryRulerLength) *
                  cos(secondaryAngle),
              ((radius - thickness - rulerOffset) - secondaryRulerLength) *
                  sin(secondaryAngle));

          // Draw the secondary Ruler
          if (getRadialGauge.track.trackStyle.showSecondaryRulers) {
            canvas.drawLine(
              center + secondaryStartPoint,
              center + secondaryEndPoint,
              secondaryRulerPaint,
            );
          }
        }
      }

      //* DRAW  LABELS
      final TextPainter textPainter =
          TextPainter(textDirection: TextDirection.ltr);

      final double langle =
          startAngle + i * partAngle; // the angle of the current ruler
      // the y coordinate of the label
      double l = (langle - startAngle) * 180 / pi;
      double sAngle = _radialGauge.track.startAngle;
      double eAngle = _radialGauge.track.endAngle;

      double range = eAngle - sAngle;
      double start = _radialGauge.track.start;
      double end = _radialGauge.track.end;
      double valueRange = (end - start);

      double exactValue = start + ((l / range) * valueRange);
      Color textColor = Colors.black;
      textPainter.text = TextSpan(
          text: trackLabelFormater(exactValue),
          style: getRadialGauge.track.trackStyle.labelStyle ??
              TextStyle(color: textColor, fontWeight: FontWeight.bold));
      textPainter.layout();

      if (i == 0 && !showFirstLabel) {
        continue; // Skip drawing the first label
      }

      // Check if it's the last label and showLastLabel is false
      if (i == numParts && !showLastLabel) {
        continue; // Skip drawing the last label
      }

      final Offset labelOffset = Offset(
          (labelEndPoint.dx + center.dx) - textPainter.width / 2,
          (labelEndPoint.dy + center.dy) - textPainter.height / 2);
      if (getRadialGauge.track.trackStyle.showLabel!) {
        textPainter.paint(canvas, labelOffset);
      }
    }
  }

  int calculateNumOfDivisions(int steps, double start, double end) {
    double range = end - start.toDouble();
    int numOfDivisions = range ~/ steps;

    return numOfDivisions;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Center of the canvas
    offset = Offset(offset.dx, offset.dy);
    // offset = Offset(size.width * getRadialGauge.xCenterCoordinate,
    //     size.height * getRadialGauge.yCenterCoordinate);
    // Angles in radians
    double startAngle = (getRadialGauge.track.startAngle - 180) * (pi / 180);
    double endAngle = (getRadialGauge.track.endAngle - 180) * (pi / 180);
    if (startAngle > endAngle) {
      double temp = startAngle;
      startAngle = endAngle;
      endAngle = temp;
    }

    var thickness = getRadialGauge.track.thickness;
    double shortestSide = size.shortestSide;

    double rulerLength =
        getRadialGauge.track.trackStyle.primaryRulersHeight ?? 10;
    double arcLength = endAngle - startAngle; // length of the arc in radians

    double numParts = calculateNumOfDivisions(
      getRadialGauge.track.steps,
      getRadialGauge.track.start,
      getRadialGauge.track.end,
    ).toDouble();

    // double radialOffset = getRadialGauge.valueBar!.first.radialOffset;

    double partAngle = arcLength / numParts; // angle of each part in radians
    double radius = (shortestSide / 2.0 - thickness / 2.0) *
        getRadialGauge.radiusFactor; // radius of the arc

    final center = offset;

    final Paint containerPaint = Paint()
      ..color = getRadialGauge.track.color
      ..strokeCap = getRadialGauge.strokeCap
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    // Rect for Arc
    Rect rectForArc = Rect.fromCircle(center: center, radius: radius);

    // Gradient
    if (getRadialGauge.track.gradient != null) {
      LinearGradient gradient = getRadialGauge.track.gradient!;
      containerPaint.shader = gradient.createShader(rectForArc);
    }

    // Drawing The Arc
    if (!getRadialGauge.track.hideTrack) {
      canvas.drawArc(rectForArc, startAngle, arcLength, false, containerPaint);
    }

    // Drawing the Rulers and Labels
    paintRulersAndLabels(canvas, numParts, startAngle, partAngle, radius,
        thickness, rulerLength, center);
  }
}
