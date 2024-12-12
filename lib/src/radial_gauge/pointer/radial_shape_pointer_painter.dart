import 'dart:math';

import 'package:flutter/material.dart';

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
    required Color? borderColor,
    required double? borderWidth,
  })  : _value = value,
        _color = color,
        _height = height,
        _onChanged = onChanged,
        _isInteractive = isInteractive,
        _width = width,
        _shape = shape,
        _radialGauge = radialGauge,
        _borderColor = borderColor,
        _borderWidth = borderWidth;

  double _value;
  Color _color;
  double _height;
  double _width;
  PointerShape _shape;
  RadialGauge _radialGauge;
  Color? _borderColor;
  double? _borderWidth;

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

  set setBorderColor(Color? borderColor) {
    if (_borderColor == borderColor) {
      return;
    }
    _borderColor = borderColor;
    markNeedsPaint();
  }

  set setBorderWidth(double? borderWidth) {
    if (_borderWidth == borderWidth) {
      return;
    }
    _borderWidth = borderWidth;
    markNeedsPaint();
  }

  late Rect pointerRect;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    double gaugeStart = _radialGauge.track.start;
    double gaugeEnd = _radialGauge.track.end;
    // final center = Offset(offset.dx, offset.dy);

    final center = Offset(
        size.width * _radialGauge.xCenterCoordinate + offset.dx,
        size.height * _radialGauge.yCenterCoordinate + offset.dy);

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

    double circlePointerOffset =
        (size.shortestSide / 2 - _radialGauge.track.thickness) *
            _radialGauge.radiusFactor;

    double pointerEndX = center.dx + pointerOffset * cos(angle);
    double pointerEndY = center.dy + pointerOffset * sin(angle);

    double circlePointerEndX = center.dx + circlePointerOffset * cos(angle);
    double circlePointerEndY = center.dy + circlePointerOffset * sin(angle);

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

    // canvas.drawRect(pointerRect, Paint()..color = _color);
    if (_borderColor != null && _borderWidth != null) {
      canvas.drawCircle(
        Offset(circlePointerEndX, circlePointerEndY),
        _width + (_borderWidth! / 2),
        Paint()
          ..color = _borderColor!
          ..style = PaintingStyle.stroke
          ..strokeWidth = _borderWidth!,
      );
    }
    canvas.drawCircle(Offset(circlePointerEndX, circlePointerEndY), _width,
        Paint()..color = _color);
    // canvas.drawPath(pointerPath, Paint()..color = _color);
  }

  double calculateValueAngle(double value, double gaugeStart, double gaugeEnd) {
    double newValue = (value - gaugeStart) / (gaugeEnd - gaugeStart) * 100;

    return newValue;
  }
}
