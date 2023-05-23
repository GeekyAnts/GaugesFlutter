import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_state.dart';

import '../radial_gauge.dart';

class NeedlePointer extends LeafRenderObjectWidget {
  const NeedlePointer(
      {Key? key,
      required this.value,
      this.color = Colors.red,
      this.needleWidth = 10,
      this.needleHeight = 350,
      this.tailRadius = 20})
      : super(key: key);

  final double value;
  final Color color;
  final double needleHeight;
  final double needleWidth;
  final double tailRadius;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RadialGaugeState scope = RadialGaugeState.of(context);

    return RenderNeedlePointer(
      radialGauge: scope.rGauge,
      value: value,
      color: color,
      needleHeight: needleHeight,
      needleWidth: needleWidth,
      tailRadius: tailRadius,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderNeedlePointer renderObject) {
    final RadialGaugeState scope = RadialGaugeState.of(context);
    renderObject
      ..setValue = value
      ..setColor = color
      ..setNeedleHeight = needleHeight
      ..setTailRadius = tailRadius
      ..setNeedleWidth = needleWidth
      ..setRadialGauge = scope.rGauge;
  }
}

class RenderNeedlePointer extends RenderBox {
  RenderNeedlePointer({
    Key? key,
    required double value,
    required Color color,
    required RadialGauge radialGauge,
    required double needleHeight,
    required double tailRadius,
    required double needleWidth,

    // required RadialTrack track,
  })  : _value = value,
        _color = color,
        _radialGauge = radialGauge,
        _needleHeight = needleHeight,
        _tailRadius = tailRadius,
        _needleWidth = needleWidth,
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

    Rect circle = Rect.fromLTWH(offset.dx, offset.dy, size.width, _tailRadius);
    Path circlePath = Path()..addOval(circle);

    double strokeWidth = _needleWidth;

    LinearGradient gradient = LinearGradient(
      colors: [Colors.grey, Colors.grey],
      begin: _value > 50 ? Alignment.centerRight : Alignment.centerLeft,
      end: _value > 50 ? Alignment.centerLeft : Alignment.centerRight,
    );

    double gaugeStart = _radialGauge!.track.start;
    double gaugeEnd = _radialGauge!.track.end;

    double value = calculateValueAngle(_value, gaugeStart, gaugeEnd);
    double startAngle = _radialGauge!.track.startAngle * (pi / 180);
    double endAngle = _radialGauge!.track.endAngle * (pi / 180);

    final double needleMultiplier = _needleHeight;

    final double angle = startAngle + (value / 100) * (endAngle - startAngle);

    final double needleEndX =
        center.dx + getTailRadius / 2 + needleMultiplier * cos(angle);
    final double needleEndY =
        center.dy + getTailRadius / 2 + needleMultiplier * sin(angle);

    final needlePaint = Paint()
      ..color = _color
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(Rect.fromPoints(
        Offset(center.dx + getTailRadius / 2, center.dy + getTailRadius / 2),
        Offset(needleEndX, needleEndY),
      ))
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
        Offset(center.dx + getTailRadius / 2, center.dy + getTailRadius / 2),
        Offset(needleEndX, needleEndY),
        needlePaint);

    canvas.drawPath(circlePath, Paint()..color = _color);
  }

  double calculateValueAngle(double value, double gaugeStart, double gaugeEnd) {
    double newValue = (value - gaugeStart) / (gaugeEnd - gaugeStart) * 100;

    return newValue;
  }
}
