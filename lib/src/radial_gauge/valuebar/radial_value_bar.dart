import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

import '../radial_gauge.dart';
import '../radial_gauge_state.dart';

///
/// [RadialValueBar] is used to render the value bar in the [RadialGauge].
class RadialValueBar extends LeafRenderObjectWidget {
  const RadialValueBar({
    Key? key,
    required this.value,
    this.color = Colors.blue,
    this.valueBarThickness = 10,
    this.borderRadius = 0,
    this.gradient,
    this.radialOffset = 0,
  }) : super(key: key);

  final double value;

  final Color color;
  final double radialOffset;
  final double valueBarThickness;
  final double borderRadius;
  final LinearGradient? gradient;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RadialGaugeState scope = RadialGaugeState.of(context);

    return RenderRadialValueBar(
      value: value,
      color: color,
      gradient: gradient ?? LinearGradient(colors: [color, color]),
      radialOffset: radialOffset,
      valueBarThickness: valueBarThickness,
      borderRadius: borderRadius,
      radialGauge: scope.rGauge,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderRadialValueBar renderObject) {
    final RadialGaugeState scope = RadialGaugeState.of(context);
    renderObject
      ..setValue = value
      ..setColor = color
      ..setRadialOffset = radialOffset
      ..setLinearGradient = gradient ?? LinearGradient(colors: [color, color])
      ..setValueBarThickness = valueBarThickness
      ..setBorderRadius = borderRadius
      ..setRadialGauge = scope.rGauge;
  }
}

class RenderRadialValueBar extends RenderBox {
  RenderRadialValueBar({
    Key? key,
    required double value,
    required Color color,
    required LinearGradient? gradient,
    required double valueBarThickness,
    required double borderRadius,
    required RadialGauge radialGauge,
    required double radialOffset,
  })  : _value = value,
        _color = color,
        _gradient = gradient!,
        _radialOffset = radialOffset,
        _radialGauge = radialGauge,
        _valueBarThickness = valueBarThickness,
        _borderRadius = borderRadius,
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

  double get getBorderRadius => _borderRadius;
  double _borderRadius;
  set setBorderRadius(double borderRadius) {
    if (_borderRadius == borderRadius) return;
    _borderRadius = borderRadius;
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

    double startAngle = getRadialGauge.track.startAngle * (pi / 180);
    double endAngle = getRadialGauge.track.endAngle * (pi / 180);

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

    final center = offset;

    final LinearGradient gradient = getLinearGradient;

    final Paint containerPaint = Paint()
      ..color = _color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _valueBarThickness
      ..shader = gradient.createShader(
          Rect.fromCircle(center: center, radius: size.shortestSide / 2.0))
      ..style = PaintingStyle.stroke;

    double arcLength = endAngle - startAngle;
    double shortestSide = size.shortestSide;
    double radius = shortestSide / 2.0 -
        getRadialGauge.track.thickness +
        getRadialOffset; //

    Rect c = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(c, startAngle, arcLength, false, containerPaint);
  }
}
