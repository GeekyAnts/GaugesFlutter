import 'dart:math';

import 'package:flutter/rendering.dart';

import '../../../geekyants_flutter_gauges.dart';

class RenderRadialValueBar extends RenderBox {
  RenderRadialValueBar({
    Key? key,
    required double value,
    required Color color,
    required LinearGradient? gradient,
    required double valueBarThickness,
    required RadialGauge radialGauge,
    required double radialOffset,
    required StrokeCap strokeCap,
  })  : _value = value,
        _color = color,
        _gradient = gradient!,
        _radialOffset = radialOffset,
        _radialGauge = radialGauge,
        _valueBarThickness = valueBarThickness,
        _strokeCap = strokeCap,
        super();

  RadialGauge get getRadialGauge => _radialGauge!;
  RadialGauge? _radialGauge;
  set setRadialGauge(RadialGauge radialGauge) {
    if (_radialGauge == radialGauge) return;
    _radialGauge = radialGauge;
    markNeedsPaint();
  }

  double get getValue => _value;
  double _value;
  set setValue(double value) {
    if (_value == value) return;
    _value = value;
    markNeedsPaint();
  }

  Color get getColor => _color;
  Color _color;
  set setColor(Color color) {
    if (_color == color) return;
    _color = color;
    markNeedsPaint();
  }

  double get getRadialOffset => _radialOffset;
  double _radialOffset;
  set setRadialOffset(double radialOffset) {
    if (_radialOffset == radialOffset) return;
    _radialOffset = radialOffset;
    markNeedsPaint();
  }

  double get getValueBarThickness => _valueBarThickness;
  double _valueBarThickness;
  set setValueBarThickness(double valueBarThickness) {
    if (_valueBarThickness == valueBarThickness) return;
    _valueBarThickness = valueBarThickness;
    markNeedsPaint();
  }

  StrokeCap get getStrokeCap => _strokeCap;
  StrokeCap _strokeCap;
  set setStrokeCap(StrokeCap strokeCap) {
    if (_strokeCap == strokeCap) return;
    _strokeCap = strokeCap;
    markNeedsPaint();
  }

  LinearGradient get getLinearGradient => _gradient;
  LinearGradient _gradient;
  set setLinearGradient(LinearGradient linearGradient) {
    if (_gradient == linearGradient) return;
    _gradient = linearGradient;
    markNeedsPaint();
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return false;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.constrain(constraints.biggest);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    final center = offset;
    final LinearGradient gradient = getLinearGradient;

    // Angles in radians
    double startAngle = (getRadialGauge.track.startAngle - 180) * (pi / 180);
    double endAngle = (getRadialGauge.track.endAngle - 180) * (pi / 180);

    double value = (_value - getRadialGauge.track.start) /
        (getRadialGauge.track.end - getRadialGauge.track.start) *
        100;

    final double angle = startAngle + (value / 100) * (endAngle - startAngle);
    endAngle = angle;

    if (startAngle > endAngle) {
      final double temp = startAngle;
      startAngle = endAngle;
      endAngle = temp;
    }

    final Paint containerPaint = Paint()
      ..color = _color
      ..strokeCap = _strokeCap
      ..strokeWidth = _valueBarThickness
      ..shader = gradient.createShader(
          Rect.fromCircle(center: center, radius: size.shortestSide / 2.0))
      ..style = PaintingStyle.stroke;

    double arcLength = endAngle - startAngle;
    double shortestSide = size.shortestSide;
    double radius = (shortestSide / 2.0 -
            getRadialGauge.track.thickness / 2.0 -
            getRadialOffset) *
        getRadialGauge.radiusFactor;

    Rect c = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(c, startAngle, arcLength, false, containerPaint);
  }
}
