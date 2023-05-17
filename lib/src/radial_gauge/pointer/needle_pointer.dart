import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_state.dart';

class NeedlePointer extends LeafRenderObjectWidget {
  const NeedlePointer(
      {Key? key,
      required this.value,
      this.color = Colors.red,
      this.needleHeight = 20,
      this.pointerRadius = 200,
      this.tailRadius = 20})
      : super(key: key);

  final double value;
  final Color color;
  final double needleHeight;
  final double tailRadius;
  final double pointerRadius;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RadialGaugeState scope = RadialGaugeState.of(context);

    return RenderNeedlePointer(
      radialGauge: scope.rGauge,
      value: value,
      color: color,
      needleHeight: needleHeight,
      tailRadius: tailRadius,
      pointerRadius: pointerRadius,
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
      ..setPointerRadius = pointerRadius
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
    required double pointerRadius,
    // required RadialTrack track,
  })  : _value = value,
        _color = color,
        _radialGauge = radialGauge,
        _needleHeight = needleHeight,
        _tailRadius = tailRadius,
        _pointerRadius = pointerRadius,
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

  double get getTailRadius => _tailRadius;
  double _tailRadius;
  set setTailRadius(double tailRadius) {
    if (_tailRadius == tailRadius) return;
    _tailRadius = tailRadius;
    markNeedsPaint();
  }

  double get getPointerRadius => _pointerRadius;
  double _pointerRadius;
  set setPointerRadius(double pointerRadius) {
    if (_pointerRadius == pointerRadius) return;
    _pointerRadius = pointerRadius;
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
    return constraints.constrain(const Size(200, 200));
  }

  @override
  void performLayout() {
    size = Size(_tailRadius,
        _tailRadius > _needleHeight ? _tailRadius : _needleHeight + 100);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final center = offset;

    Rect circle = Rect.fromLTWH(offset.dx, offset.dy, size.width, _tailRadius);
    Path circlePath = Path()..addOval(circle);

    double strokeWidth = 13;

    canvas.drawPath(circlePath, Paint()..color = _color);
    final needlePaint = Paint()
      ..color = _color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double value = _value;

    double startAngle = _radialGauge!.track.startAngle * (pi / 180);
    double endAngle = _radialGauge!.track.endAngle * (pi / 180);

    // final rotationPivotX = rectLeft + (rectWidth / 2);
    // final rotationPivotY = rectTop;

    // final double angle = startAngle + (value / 100) * (endAngle - startAngle);

    // // canvas.drawLine(rectCenter, Offset(needleEndX, needleEndY), needlePaint);
    // Rect needleRect = Rect.fromLTWH(offset.dx + getTailRadius / 2 - 10,
    //     offset.dy + getTailRadius / 2 - 10, 20, 300);

    // Path needlePath = Path()..addRect(needleRect);
    // // canvas.save();

    // canvas.translate(needleRect.left + 10, needleRect.top);
    // canvas.rotate(((angle) * 0.0174533));

    // canvas.translate(-needleRect.left, -needleRect.top);
    // canvas.drawPath(needlePath, needlePaint..color = Colors.red);
    // canvas.restore();
    // canvas.save();
    final needleLength = 500.0;
    final needleWidth = 4.0;

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    double sAngle = getRadialGauge.track.startAngle;
    double eAngle = getRadialGauge.track.endAngle;
    final rotationAngle = sAngle + _value * ((eAngle - sAngle) / 100);
    canvas.translate(
        center.dx + getTailRadius / 2, center.dy + getTailRadius / 2);
    canvas.rotate(rotationAngle * (pi / 180));

    final path = Path();
    path.moveTo(-needleWidth / 2, 0);
    path.lineTo(needleWidth / 2, 0);
    // path.lineTo(needleWidth / 2, -needleLength);
    // path.lineTo(-needleWidth / 2, -needleLength);
    // path.close();
    // final startAngle = getRadialGauge.track.startAngle;
    // final endAngle = getRadialGauge.track.endAngle;

    var rotate = convertValueToAngle(value, sAngle, eAngle);
    // print(rotate);

    final angleRange = eAngle - sAngle;
    final pointerAngle = (rotationAngle / 100) * angleRange + sAngle;

    final x = (needleLength * sin(pointerAngle * pi / 180)).toDouble();
    final y = (-needleLength * cos(pointerAngle * pi / 180)).toDouble();
    path.lineTo(x, y);
    path.close();
    canvas.drawPath(path, paint);
  }
}

double convertValueToAngle(double value, double startAngle, double endAngle) {
  double range = (endAngle - startAngle);
  double rotationAngle = value * range;
  double p = startAngle + range * (value / 100);

  print("rotationAngle: $p");

  double degrees = rotationAngle * (180 / pi); // Convert radians to degrees
  return degrees;
}
