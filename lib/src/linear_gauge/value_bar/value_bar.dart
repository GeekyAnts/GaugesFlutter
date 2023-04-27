import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/value_bar/valuebar_painter.dart';

///
/// The [ValueBar]  can be used to represent the current value of the [LinearGauge].
///
///
///
/// ```dart
/// LinearGauge(
/// valueBar: [
/// ValueBar(
/// value: 50,
/// position: ValueBarPosition.top,
/// color: Colors.amber,
///   ),
///  ]
/// ),
/// ```
///

class ValueBar extends LeafRenderObjectWidget {
  ValueBar({
    required this.value,
    this.offset = 0,
    this.position = ValueBarPosition.center,
    this.color = Colors.blue,
    this.valueBarThickness = 4.0,
    this.edgeStyle = LinearEdgeStyle.bothCurve,
    this.borderRadius,
    this.animationDuration = 1000,
    this.animationType = Curves.ease,
    this.enableAnimation = true,
  });

  /// The `value` sets the value of the [ValueBar].
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       value: 50,
  ///       position: ValueBarPosition.top,
  ///       ),
  ///     ]
  /// ),
  /// ```
  final double value;

  /// The `valueBarThickness` sets the thickness of the [ValueBar].
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       valueBarThickness: 10,
  ///       ),
  ///     ]
  /// ),
  /// ```
  final double valueBarThickness;

  ///
  /// The `offset` sets the offset of the [ValueBar] from the [LinearGauge].
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     offset: 50,
  ///     position: ValueBarPosition.top,
  ///      ),
  ///    ]
  /// ),
  /// ```
  /// The default value of `offset` is `0`.
  ///
  double offset;

  ///
  /// The `position` sets the position of the [ValueBar] in the [LinearGauge].
  /// The [ValueBarPosition] can be `top`, `bottom` or `center`.
  /// The default value of `position` is `ValueBarPosition.center`.
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       value: 50,
  ///       position: ValueBarPosition.top,
  ///      ),
  ///   ],
  /// ),
  /// ```
  ///
  final ValueBarPosition position;

  ///
  /// The `color` sets the color of the [ValueBar].
  /// The default value of `color` is `Colors.blue`.
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     position: ValueBarPosition.top,
  ///     color: Colors.amber,
  ///         ),
  ///       ],
  ///   ),
  /// ```
  Color color;

  ///
  /// `borderRadius` Set corners to soft edges/rounded  of the ValueBar
  ///
  /// ```dart
  /// const LinearGauge(
  ///             linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///              linearGradient: LinearGradient(
  ///                colors: [Colors.blue, Colors.pink],
  ///                borderRadius: 10.0,
  ///              ),
  ///            ),
  ///          ),
  /// ```
  final double? borderRadius;

  ///
  /// `edgeStyle` Set the style of the edges of the ValueBar.
  ///
  /// default is to `edgeStyle =`LinearEdgeStyle.bothCurve`
  ///
  ///
  ///  Note : It tells to which edge of the valuebar to apply the supplied
  ///         borderRadius. It has no use if borderRadius is not supplied or is zero.
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     borderRadius:10,
  ///     edgeStyle:LinearEdgeStyle.bothCurve,
  ///         ),
  ///       ],
  ///   ),
  /// ```
  LinearEdgeStyle edgeStyle;

  /// Specifies the load time animation duration with [enableAnimation].
  /// Duration is defined in milliseconds.
  ///
  /// Defaults to true.
  ///
  /// ```dart
  ///
  /// LinearGauge (
  ///  valueBar: [
  /// ValueBar(
  /// value: 20,
  /// enableAnimation: true,
  ///  )])
  /// ```
  ///
  final bool enableAnimation;

  /// Specifies the load time animation duration with [enableAnimation].
  /// Duration is defined in milliseconds.
  ///
  /// Defaults to 1000.
  ///
  /// ```dart
  ///
  /// LinearGauge (
  ///  valueBar: [
  /// ValueBar(
  /// value: 20,
  /// enableAnimation: true,
  /// animationDuration: 4000
  ///  )])
  /// ```
  ///
  final int animationDuration;

  /// Specifies the animation type of valuebar.
  ///
  /// Defaults to [Curves.ease].
  ///
  /// ```dart
  ///
  /// LinearGauge (
  ///  valueBar: [
  /// ValueBar(
  /// value: 20,
  /// enableAnimation: true,
  /// animationType: Curves.linear
  ///  )])
  /// ```
  ///
  final Curve animationType;

  ///
  /// Painter Method to Draw [ValueBar]
  ///

  @override
  RenderObject createRenderObject(BuildContext context) {
    final LinearGaugeState linearGaugeScope = LinearGaugeState.of(context);

    return RenderValueBar(
        linearGauge: linearGaugeScope.lGauge,
        value: value,
        offset: offset,
        position: position,
        color: color,
        valueBarThickness: valueBarThickness,
        edgeStyle: edgeStyle,
        borderRadius: borderRadius ?? 0,
        animationDuration: animationDuration,
        animationType: animationType,
        enableAnimation: enableAnimation);
  }

  @override
  void updateRenderObject(BuildContext context, RenderValueBar renderObject) {
    final LinearGaugeState linearGaugeScope = LinearGaugeState.of(context);

    renderObject
      ..setValue = value
      ..setColor = color
      ..setThickness = valueBarThickness
      ..setOffset = offset
      ..setBorderRadius = borderRadius ?? 0
      ..setEdgeStyle = edgeStyle
      ..setLinearGAuge = linearGaugeScope.lGauge
      ..setPosition = position;
  }
}
