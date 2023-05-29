import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_state.dart';

class RadialShapePointer extends LeafRenderObjectWidget {
  const RadialShapePointer({
    super.key,
    required this.value,
    this.color = Colors.red,
    this.height = 10,
    this.width = 10,
    this.shape = PointerShape.triangle,
  });

  final double value;
  final Color color;
  final double height;
  final double width;
  final PointerShape shape;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RadialGaugeState scope = RadialGaugeState.of(context);

    return RenderRadialShapePointer(
      value: value,
      color: color,
      height: height,
      width: width,
      shape: shape,
      radialGauge: scope.rGauge,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderRadialShapePointer renderObject) {
    final RadialGaugeState scope = RadialGaugeState.of(context);
    renderObject
      ..setValue = value
      ..setRadialGauge = scope.rGauge
      ..setColor = color
      ..setHeight = height
      ..setWidth = width
      ..setShape = shape;
  }
}

class RenderRadialShapePointer extends RenderBox {
  RenderRadialShapePointer({
    required double value,
    required Color color,
    required double height,
    required double width,
    required PointerShape shape,
    required RadialGauge radialGauge,
  })  : _value = value,
        _color = color,
        _height = height,
        _width = width,
        _shape = shape,
        _radialGauge = radialGauge;

  double _value;
  Color _color;
  double _height;
  double _width;
  PointerShape _shape;
  RadialGauge _radialGauge;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.constrain(constraints.biggest);
  }

  @override
  bool hitTestSelf(Offset position) {
    return true;
  }

  @override
  void performLayout() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  set setValue(double value) {
    if (_value == value) {
      return;
    }
    _value = value;
    markNeedsPaint();
  }

  set setColor(Color color) {
    if (_color == color) {
      return;
    }
    _color = color;
    markNeedsPaint();
  }

  set setHeight(double height) {
    if (_height == height) {
      return;
    }
    _height = height;
    markNeedsPaint();
  }

  set setWidth(double width) {
    if (_width == width) {
      return;
    }
    _width = width;
    markNeedsPaint();
  }

  set setShape(PointerShape shape) {
    if (_shape == shape) {
      return;
    }
    _shape = shape;
    markNeedsPaint();
  }

  set setRadialGauge(RadialGauge radialGauge) {
    if (_radialGauge == radialGauge) {
      return;
    }
    _radialGauge = radialGauge;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    double gaugeStart = _radialGauge.track.start;
    double gaugeEnd = _radialGauge.track.end;

    final center = offset;
    double value = calculateValueAngle(_value, gaugeStart, gaugeEnd);
    double startAngle = (_radialGauge.track.startAngle - 180) * (pi / 180);
    double endAngle = (_radialGauge.track.endAngle - 180) * (pi / 180);

    final double angle = startAngle + (value / 100) * (endAngle - startAngle);

    double needleLength = 30;
    double needleWidth = 10;
    final pointerPath = Path();
    // double pointerOffset = 430 + 0;
    double pointerOffset =
        (size.shortestSide / 2 - _radialGauge.track.thickness) *
            _radialGauge.radiusFactor;
    // needleEndY = center.dy + 250 * sin(angle);
    double pointerEndX = center.dx + pointerOffset * cos(angle);
    double pointerEndY = center.dy + pointerOffset * sin(angle);
    // needleEndX = center.dx + 250 * cos(angle);
    // // needleEndX = center.dx + getTailRadius / 2 + needleMultiplier * cos(angle);
    pointerPath.moveTo(pointerEndX, pointerEndY);
    pointerPath.lineTo(
      pointerEndX - needleWidth * cos(angle + pi / 2),
      pointerEndY - needleWidth * sin(angle + pi / 2),
    );
    pointerPath.lineTo(
      pointerEndX - (needleLength - needleWidth) * cos(angle),
      pointerEndY - (needleLength - needleWidth) * sin(angle),
    );
    pointerPath.lineTo(
      pointerEndX + needleWidth * cos(angle + pi / 2),
      pointerEndY + needleWidth * sin(angle + pi / 2),
    );
    pointerPath.close();

    canvas.drawCircle(
        Offset(pointerEndX, pointerEndY), _width, Paint()..color = _color);
    // canvas.drawPath(pointerPath, Paint()..color = Colors.red);
  }

  double calculateValueAngle(double value, double gaugeStart, double gaugeEnd) {
    double newValue = (value - gaugeStart) / (gaugeEnd - gaugeStart) * 100;

    return newValue;
  }
}
