import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/valuebar/radial_value_bar_painter.dart';
import '../radial_gauge.dart';
import '../radial_gauge_state.dart';

///
/// [RadialValueBar] is used to render the value bar in the [RadialGauge].
///
/// ```dart
///  RadialGauge(
///  valueBar: RadialValueBar(
///   value: 10,
///  color: Colors.blue,
///       ),
///    ),
/// ```
///
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
