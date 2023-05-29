import 'dart:math';
import 'package:flutter/rendering.dart';
import '../../../geekyants_flutter_gauges.dart';

class RenderNeedlePointer extends RenderBox {
  RenderNeedlePointer({
    Key? key,
    required double value,
    required Color color,
    required RadialGauge radialGauge,
    required double needleHeight,
    required double tailRadius,
    required double needleWidth,
    required Color tailColor,
    required LinearGradient gradient,

    // required RadialTrack track,
  })  : _value = value,
        _color = color,
        _radialGauge = radialGauge,
        _gradient = gradient,
        _needleHeight = needleHeight,
        _tailRadius = tailRadius,
        _tailColor = tailColor,
        _needleWidth = needleWidth,
        super();

  LinearGradient get getGradient => _gradient;
  LinearGradient _gradient;
  set setGradient(LinearGradient gradient) {
    if (_gradient == gradient) return;
    _gradient = gradient;
    markNeedsPaint();
  }

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

  double get getNeedleWidth => _needleWidth;
  double _needleWidth;
  set setNeedleWidth(double needleWidth) {
    if (_needleWidth == needleWidth) return;
    _needleWidth = needleWidth;
    markNeedsPaint();
  }

  double get getTailRadius => _tailRadius;
  double _tailRadius;
  set setTailRadius(double tailRadius) {
    if (_tailRadius == tailRadius) return;
    _tailRadius = tailRadius;
    markNeedsPaint();
  }

  double get getNeedleHeight => _needleHeight;
  double _needleHeight;
  set setNeedleHeight(double needleHeight) {
    if (_needleHeight == needleHeight) return;
    _needleHeight = needleHeight;
    markNeedsPaint();
  }

  Color get getTailColor => _tailColor;
  Color _tailColor;
  set setTailColor(Color tailColor) {
    if (_tailColor == tailColor) return;
    _tailColor = tailColor;
    markNeedsPaint();
  }

  Color get getColor => _color;
  Color _color;
  set setColor(Color color) {
    if (_color == color) return;
    _color = color;
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
    final canvas = context.canvas;
    final center = offset;

    Rect circle = Rect.fromLTWH(offset.dx - getTailRadius / 2,
        offset.dy - getTailRadius / 2, _tailRadius, _tailRadius);
    Path circlePath = Path()..addOval(circle);

    double strokeWidth = _needleWidth;

    LinearGradient gradient = _gradient;

    double gaugeStart = _radialGauge!.track.start;
    double gaugeEnd = _radialGauge!.track.end;

    double value = calculateValueAngle(_value, gaugeStart, gaugeEnd);
    double startAngle = (_radialGauge!.track.startAngle - 180) * (pi / 180);
    double endAngle = (_radialGauge!.track.endAngle - 180) * (pi / 180);

    final maxH = size.shortestSide / 2 * getRadialGauge.radiusFactor;

    final double needleMultiplier = _needleHeight.clamp(0, maxH - 40);

    final double angle = startAngle + (value / 100) * (endAngle - startAngle);

    double needleEndX = center.dx + needleMultiplier * cos(angle);
    double needleEndY = center.dy + needleMultiplier * sin(angle);
    double needleStartX = center.dx;
    double needleStartY = center.dy;

    final needlePaint = Paint()
      ..color = _color
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(
        Rect.fromPoints(
          Offset(needleStartX, needleStartY),
          Offset(needleEndX, needleEndY),
        ),
      )
      ..strokeCap = StrokeCap.round;

    //  Simple Needle
    // canvas.drawLine(Offset(needleStartX, needleStartY),
    //     Offset(needleEndX, needleEndY), needlePaint);

    // Needle Path
    Path needlePath = Path();
    needlePath.moveTo(offset.dx + getTailRadius / 2 * cos(angle + pi / 2),
        offset.dy - getTailRadius / 2 * sin(angle - pi / 2));
    needlePath.lineTo(needleStartX + getTailRadius / 2 * cos(angle - pi / 2),
        needleStartY - (getTailRadius / 2) * sin(angle + pi / 2));

    double temp1 = 30;
    needlePath.moveTo(offset.dx + temp1 * cos(angle + pi / 2),
        offset.dy - temp1 * sin(angle - pi / 2));
    needlePath.lineTo(needleStartX + temp1 * cos(angle - pi / 2),
        needleStartY - (temp1) * sin(angle + pi / 2));

    needlePath.lineTo(needleEndX, needleEndY);
    // Offset c = Offset(offset.dx, offset.dy - getTailRadius);
    // canvas.drawCircle(c, 100, Paint()..color = Colors.black);
    needlePath.close();
    //* Needle  Pointer paint
    canvas.drawPath(needlePath, needlePaint);

    canvas.drawPath(circlePath, Paint()..color = _tailColor);
  }

  double calculateValueAngle(double value, double gaugeStart, double gaugeEnd) {
    double newValue = (value - gaugeStart) / (gaugeEnd - gaugeStart) * 100;

    return newValue;
  }
}
