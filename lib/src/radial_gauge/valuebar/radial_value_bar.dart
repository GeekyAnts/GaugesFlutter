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
  const RadialValueBar({
    Key? key,
    required this.value,
    this.color = Colors.blue,
    this.valueBarThickness = 10,
    this.gradient,
    this.radialOffset = 0,
    this.strokeCap = StrokeCap.round,
  }) : super(key: key);

  /// [value] denotes the value of the value bar.
  ///
  ///```dart
  /// RadialGauge(
  ///         valueBar: [
  ///           RadialValueBar(
  ///             value: 50,
  ///           ),
  ///         ],
  ///         track: RadialTrack(
  ///           start: 0,
  ///           end: 100,
  ///         ),
  ///       ),
  /// ```
  ///

  final double value;

  /// [color] denotes the color of the value bar.
  ///
  ///```dart
  /// RadialGauge(
  ///         valueBar: [
  ///           RadialValueBar(
  ///             value: 50,
  ///             color: Colors.blue
  ///           ),
  ///         ],
  ///         track: RadialTrack(
  ///           start: 0,
  ///           end: 100,
  ///         ),
  ///       ),
  /// ```
  ///
  final Color color;

  /// [radialOffset] denotes the offset of the value bar.
  /// The value bar will be rendered at the given offset.
  ///
  /// ```dart
  /// RadialGauge(
  ///         valueBar: [
  ///           RadialValueBar(
  ///             value: 50,
  ///             color: Colors.blue
  ///             radialOffset: 10,
  ///           ),
  ///         ],
  ///         track: RadialTrack(
  ///           start: 0,
  ///           end: 100,
  ///
  ///         ),
  ///       ),
  /// ```
  ///
  final double radialOffset;

  /// [valueBarThickness] denotes the thickness of the value bar.
  /// The value bar will be rendered at the given thickness.
  ///
  /// ```dart
  /// RadialGauge(
  ///         valueBar: [
  ///           RadialValueBar(
  ///             value: 50,
  ///             color: Colors.blue
  ///             valueBarThickness: 20,
  ///           ),
  ///         ],
  ///         track: RadialTrack(
  ///           start: 0,
  ///           end: 100,
  ///
  ///         ),
  ///       ),
  /// ```
  final double valueBarThickness;

  /// [gradient] denotes the gradient of the value bar.
  ///
  final LinearGradient? gradient;

  /// [strokeCap] denotes the stroke cap of the value bar.
  ///
  final StrokeCap strokeCap;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RadialGaugeState scope = RadialGaugeState.of(context);

    return RenderRadialValueBar(
      value: value,
      color: color,
      gradient: gradient ?? LinearGradient(colors: [color, color]),
      radialOffset: radialOffset,
      valueBarThickness: valueBarThickness,
      strokeCap: strokeCap,
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
      ..setRadialGauge = scope.rGauge
      ..setStrokeCap = strokeCap;
  }
}
