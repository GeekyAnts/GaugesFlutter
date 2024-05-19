import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui';

import '../../../geekyants_flutter_gauges.dart';

class RenderRadialShapePointer extends RenderBox {
  RenderRadialShapePointer({
    required double value,
    required Color color,
    required double height,
    required ValueChanged<double>? onChanged,
    required double width,
    required bool isInteractive,
    required PointerShape shape,
    required RadialGauge radialGauge,
  })  : _value = value,
        _color = color,
        _height = height,
        _onChanged = onChanged,
        _isInteractive = isInteractive,
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
  void performLayout() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  @override
  bool hitTestSelf(Offset position) {
    Offset calculatedPosition = localToGlobal(position);

    if (pointerRect.contains(calculatedPosition)) {
      return true;
    } else if (pointerRect.contains(position)) {
      return true;
    } else {
      return false;
    }
  }

  ValueChanged<double>? get onChanged => _onChanged;
  ValueChanged<double>? _onChanged;
  set onChanged(ValueChanged<double>? value) {
    if (value == _onChanged) {
      return;
    }
    _onChanged = value;
  }

  // Sets the Interaction for [RenderNeedlePointer].
  set setIsInteractive(bool value) {
    if (value == _isInteractive) {
      return;
    }

    _isInteractive = value;
    markNeedsPaint();
  }

  // Gets the Interaction assigned to [RenderNeedlePointer].
  bool get isInteractive => _isInteractive;
  bool _isInteractive;

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

  late Rect pointerRect;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    double gaugeStart = _radialGauge.track.start;
    double gaugeEnd = _radialGauge.track.end;

    // Determining the center of the Gauge based on the size and the center coordinate
    final center = Offset(
        size.width * _radialGauge.xCenterCoordinate + offset.dx,
        size.height * _radialGauge.yCenterCoordinate + offset.dy);

    double value = calculateValueAngle(_value, gaugeStart, gaugeEnd);
    double startAngle = (_radialGauge.track.startAngle - 180) * (pi / 180);
    double endAngle = (_radialGauge.track.endAngle - 180) * (pi / 180);

    final double angle = startAngle + (value / 100) * (endAngle - startAngle);

    double needleLength = _height;
    double needleWidth = _width;
    final pointerPath = Path();

    double pointerOffset =
        (size.shortestSide / 2 - _radialGauge.track.thickness) *
            _radialGauge.radiusFactor;

    double circlePointerOffset =
        (size.shortestSide / 2 - _radialGauge.track.thickness) *
            _radialGauge.radiusFactor;

    double pointerEndX = center.dx + pointerOffset * cos(angle);
    double pointerEndY = center.dy + pointerOffset * sin(angle);

    double circlePointerEndX = center.dx + circlePointerOffset * cos(angle);
    double circlePointerEndY = center.dy + circlePointerOffset * sin(angle);

    if (_shape == PointerShape.circle) {
      canvas.drawCircle(Offset(circlePointerEndX, circlePointerEndY), 10,
          Paint()..color = _color);
    }
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
    pointerRect = Rect.fromCircle(
        center: Offset(pointerEndX, pointerEndY), radius: _width);

    double rectWidth = _width; // Define the width of the rectangle
    double rectHeight = _height; // Define the height of the rectangle

    double rectOffset = (size.shortestSide / 2 - _radialGauge.track.thickness) *
        _radialGauge.radiusFactor;

    double rectCenterX = center.dx + rectOffset * cos(angle);
    double rectCenterY = center.dy + rectOffset * sin(angle);

    // Define the corner points relative to the rectangle's center
    Offset topLeft = Offset(
      rectCenterX - rectWidth / 2,
      rectCenterY - rectHeight / 2,
    );
    Offset topRight = Offset(
      rectCenterX + rectWidth / 2,
      rectCenterY - rectHeight / 2,
    );
    Offset bottomRight = Offset(
      rectCenterX + rectWidth / 2,
      rectCenterY + rectHeight / 2,
    );
    Offset bottomLeft = Offset(
      rectCenterX - rectWidth / 2,
      rectCenterY + rectHeight / 2,
    );

    topLeft = rotatePoint(topLeft, angle, Offset(rectCenterX, rectCenterY));
    topRight = rotatePoint(topRight, angle, Offset(rectCenterX, rectCenterY));
    bottomRight =
        rotatePoint(bottomRight, angle, Offset(rectCenterX, rectCenterY));
    bottomLeft =
        rotatePoint(bottomLeft, angle, Offset(rectCenterX, rectCenterY));

    // Draw the rotated rectangle
    final rectPaint = Paint()..color = Colors.red;
    //Draw the rectangle ->>
    if (_shape == PointerShape.rectangle) {
      canvas.drawPath(
        Path()
          ..moveTo(topLeft.dx, topLeft.dy)
          ..lineTo(topRight.dx, topRight.dy)
          ..lineTo(bottomRight.dx, bottomRight.dy)
          ..lineTo(bottomLeft.dx, bottomLeft.dy)
          ..close(),
        rectPaint,
      );
    }
  }

  // Rotate the points around the center
  Offset rotatePoint(Offset point, double angle, Offset center) {
    double dx = point.dx - center.dx;
    double dy = point.dy - center.dy;
    double rotatedX = dx * cos(angle) - dy * sin(angle);
    double rotatedY = dx * sin(angle) + dy * cos(angle);
    return Offset(rotatedX + center.dx, rotatedY + center.dy);
  }

  double calculateValueAngle(double value, double gaugeStart, double gaugeEnd) {
    double newValue = (value - gaugeStart) / (gaugeEnd - gaugeStart) * 100;

    return newValue;
  }
}
