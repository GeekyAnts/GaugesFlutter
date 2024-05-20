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
    final Canvas canvas = context.canvas;
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

    double pointerLength = _height;
    double pointerWidth = _width;
    final pointerPath = Path();

    double pointerOffset =
        (size.shortestSide / 2 - _radialGauge.track.thickness) *
            _radialGauge.radiusFactor;

    double pointerEndX = center.dx + pointerOffset * cos(angle);
    double pointerEndY = center.dy + pointerOffset * sin(angle);

    pointerRect = Rect.fromCenter(
      center: Offset(pointerEndX, pointerEndY),
      width: pointerWidth,
      height: pointerLength,
    );
    //!Handle the interaction of POinterREct
    // canvas.drawRect(pointerRect, Paint()..color = Colors.green);

    if (_shape == PointerShape.circle) {
      drawCirclePointer(canvas, center, pointerOffset, angle);
    } else if (_shape == PointerShape.rectangle) {
      drawTrianglePointer(
          canvas, center, pointerOffset, angle, pointerWidth, pointerLength);

      // drawRectanglePointer(
      //     canvas, center, pointerOffset, angle, pointerWidth, pointerLength);
    }
  }

  void drawCirclePointer(
      Canvas canvas, Offset center, double pointerOffset, double angle) {
    double circlePointerEndX = center.dx + pointerOffset * cos(angle);
    double circlePointerEndY = center.dy + pointerOffset * sin(angle);

    canvas.drawCircle(
      Offset(circlePointerEndX, circlePointerEndY),
      10,
      Paint()..color = _color,
    );
  }

  void drawRectanglePointer(Canvas canvas, Offset center, double pointerOffset,
      double angle, double width, double height) {
    double rectOffset = pointerOffset;
    double rectCenterX = center.dx + rectOffset * cos(angle);
    double rectCenterY = center.dy + rectOffset * sin(angle);

    // Define the corner points relative to the rectangle's center
    Offset topLeft = Offset(
      rectCenterX - width / 2,
      rectCenterY - height / 2,
    );
    Offset topRight = Offset(
      rectCenterX + width / 2,
      rectCenterY - height / 2,
    );
    Offset bottomRight = Offset(
      rectCenterX + width / 2,
      rectCenterY + height / 2,
    );
    Offset bottomLeft = Offset(
      rectCenterX - width / 2,
      rectCenterY + height / 2,
    );

    topLeft = rotatePoint(topLeft, angle, Offset(rectCenterX, rectCenterY));
    topRight = rotatePoint(topRight, angle, Offset(rectCenterX, rectCenterY));
    bottomRight =
        rotatePoint(bottomRight, angle, Offset(rectCenterX, rectCenterY));
    bottomLeft =
        rotatePoint(bottomLeft, angle, Offset(rectCenterX, rectCenterY));

    // Draw the rotated rectangle
    final rectPaint = Paint()..color = Colors.red;
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

  void drawTrianglePointer(Canvas canvas, Offset center, double pointerOffset,
      double angle, double width, double height) {
    double triangleOffset = pointerOffset - _height;
    double triangleCenterX = center.dx + triangleOffset * cos(angle);
    double triangleCenterY = center.dy + triangleOffset * sin(angle);

    // Define the corner points relative to the triangle's center
    Offset apex = Offset(
      triangleCenterX + height * cos(angle),
      triangleCenterY + height * sin(angle),
    );
    Offset baseRight = Offset(
      triangleCenterX - width / 2 * cos(angle + pi / 2),
      triangleCenterY - width / 2 * sin(angle + pi / 2),
    );
    Offset baseLeft = Offset(
      triangleCenterX - width / 2 * cos(angle - pi / 2),
      triangleCenterY - width / 2 * sin(angle - pi / 2),
    );

    // Draw the rotated triangle
    final trianglePaint = Paint()..color = Colors.green;
    canvas.drawPath(
      Path()
        ..moveTo(apex.dx, apex.dy)
        ..lineTo(baseRight.dx, baseRight.dy)
        ..lineTo(baseLeft.dx, baseLeft.dy)
        ..close(),
      trianglePaint,
    );
  }

  void drawDiamondPointer(Canvas canvas, Offset center, double pointerOffset,
      double angle, double width, double height) {
    double diamondOffset = pointerOffset;
    double diamondCenterX = center.dx + diamondOffset * cos(angle);
    double diamondCenterY = center.dy + diamondOffset * sin(angle);

    // Define the corner points relative to the diamond's center
    Offset top = Offset(
      diamondCenterX,
      diamondCenterY - height / 2,
    );
    Offset right = Offset(
      diamondCenterX + width / 2,
      diamondCenterY,
    );
    Offset bottom = Offset(
      diamondCenterX,
      diamondCenterY + height / 2,
    );
    Offset left = Offset(
      diamondCenterX - width / 2,
      diamondCenterY,
    );

    top = rotatePoint(top, angle, Offset(diamondCenterX, diamondCenterY));
    right = rotatePoint(right, angle, Offset(diamondCenterX, diamondCenterY));
    bottom = rotatePoint(bottom, angle, Offset(diamondCenterX, diamondCenterY));
    left = rotatePoint(left, angle, Offset(diamondCenterX, diamondCenterY));

    // Draw the rotated diamond
    final diamondPaint = Paint()..color = Colors.blue;
    canvas.drawPath(
      Path()
        ..moveTo(top.dx, top.dy)
        ..lineTo(right.dx, right.dy)
        ..lineTo(bottom.dx, bottom.dy)
        ..lineTo(left.dx, left.dy)
        ..close(),
      diamondPaint,
    );
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
