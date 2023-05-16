import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

/// A [ShapePointer] implements [Pointer] that is used to add the shape pointer to the [LinearGauge].
///
/// The LinearGauge takes a list of [Pointer] as an input.
///
/// Note: The `value` of the pointer should be between the `start` and `end` value of the [LinearGauge] and if the value is null it takes the value specified in  `Linear Gauge`
///
/// ```dart
/// const LinearGauge(
///    pointers: const [
///      ShapePointer(
///       value: 50.0,
///       color: Colors.red,
///       shape: PointerShape.circle,
///    ),
///   ],
/// ),
/// ```
///
///
class ShapePointer extends LeafRenderObjectWidget implements Pointer {
  const ShapePointer({
    Key? key,
    required this.value,
    this.height = 10.0,
    this.color = Colors.red,
    this.width = 10.0,
    required this.shape,
    this.showLabel = false,
    this.quarterTurns = QuarterTurns.zero,
    this.labelStyle = const TextStyle(),
    this.pointerPosition = PointerPosition.center,
    this.pointerAlignment = PointerAlignment.center,
    this.animationDuration = 1000,
    this.animationType = Curves.ease,
    this.enableAnimation = true,
  }) : super(key: key);

  ///
  /// `value` Sets the value of the pointer on the [LinearGauge]
  /// default is to set to the value of the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  ///  value: 50.0,
  /// ),
  /// ),
  /// ```
  @override
  final double value;

  ///
  /// `height` Sets the height of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///   pointer: Pointer(
  ///   height: 20.0,
  ///  ),
  /// ),
  /// ```
  ///
  final double height;

  ///
  /// `width` Sets the width of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  ///  width: 20.0,
  ///  ),
  /// ),
  /// ```
  ///
  final double width;

  ///
  /// `color` Sets the color of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  ///  color: Colors.blue,
  ///  ),
  /// ),
  /// ```
  /// default is to [Colors.blue]
  ///
  final Color color;

  ///
  /// `shape` Sets the shape of the pointer on the [LinearGauge]
  ///
  /// ```dart
  /// const LinearGauge(
  ///   pointer: Pointer(
  ///    shape: PointerShape.circle,
  ///  ),
  /// )
  /// ```
  /// default is to [PointerShape.circle]
  /// [PointerShape] has 4 types of shapes
  /// 1. [PointerShape.circle]
  /// 2. [PointerShape.rectangle]
  /// 3. [PointerShape.triangle]
  /// 4. [PointerShape.diamond]
  ///
  final PointerShape shape;

  ///
  /// `showLabel` shows/hides the label of the pointer on the [Pointer]
  ///
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  /// showLabel: true,
  ///  ),
  /// ),
  /// ```
  /// default is to `true`
  ///
  final bool showLabel;

  ///
  /// `quarterTurns` Sets the rotation of the label of `pointer`
  ///
  /// ```dart
  /// const LinearGauge(
  ///   pointer: Pointer(
  ///   quarterTurns: QuarterTurns.one,
  ///   shape: PointerShape.rectangle,
  ///   value: 50.0,
  ///  ),
  /// ),
  ///  ```
  final QuarterTurns quarterTurns;

  ///
  /// `labelStyle` Sets the style of the label of `pointer`
  ///
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  ///  labelStyle: TextStyle(
  ///  color: Colors.red,
  ///  fontSize: 20.0,
  ///  fontWeight: FontWeight.bold,
  ///  ),
  /// ),
  /// ),
  /// ```
  final TextStyle labelStyle;

  ///
  /// Pointer Position on the [LinearGauge]  sets the position of `pointer` on the [LinearGauge]
  ///
  @override
  final PointerPosition pointerPosition;

  ///
  /// Pointer Alignment on the [LinearGauge]  sets the alignment of `pointer` on the [LinearGauge]
  ///
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  /// pointerAlignment :PointerAlignment.start,
  /// ),
  /// ),
  /// ```
  @override
  final PointerAlignment pointerAlignment;

  /// Specifies the load time animation duration with [enableAnimation].
  /// Duration is defined in milliseconds.
  ///
  /// Defaults to true.
  ///
  /// ```dart
  ///
  /// LinearGauge (
  ///  pointers: [
  /// Pointer(
  /// value: 20,
  /// enableAnimation: true,
  ///  )])
  /// ```
  ///
  @override
  final bool enableAnimation;

  /// Specifies the load time animation duration with [enableAnimation].
  /// Duration is defined in milliseconds.
  ///
  /// Defaults to 1000.
  ///
  /// ```dart
  ///
  /// LinearGauge (
  ///  pointers: [
  /// Pointer(
  /// value: 20,
  /// enableAnimation: true,
  /// animationDuration: 4000
  ///  )])
  /// ```
  ///
  @override
  final int animationDuration;

  /// Specifies the animation type of pointers.
  ///
  /// Defaults to [Curves.ease].
  ///
  /// ```dart
  ///
  /// LinearGauge (
  ///  pointers: [
  /// Pointer(
  /// value: 20,
  /// enableAnimation: true,
  /// animationType: Curves.linear
  ///  )])
  /// ```
  ///
  @override
  final Curve animationType;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final LinearGaugeState linearGaugeScope = LinearGaugeState.of(context);
    return RenderLinearGaugeShapePointer(
        value: value,
        color: color,
        width: width,
        height: height,
        pointerPosition: pointerPosition,
        shape: shape,
        pointerAlignment: pointerAlignment,
        animationDuration: animationDuration,
        showLabel: showLabel,
        animationType: animationType,
        quarterTurns: quarterTurns,
        enableAnimation: enableAnimation,
        labelStyle: labelStyle,
        pointerAnimation: linearGaugeScope.animation!,
        linearGauge: linearGaugeScope.lGauge);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLinearGaugeShapePointer renderObject) {
    final LinearGaugeState linearGaugeScope = LinearGaugeState.of(context);

    renderObject
      ..setValue = value
      ..setWidth = width
      ..setHeight = height
      ..setColor = color
      ..setShape = shape
      ..setQuarterTurns = quarterTurns
      ..setPointerPosition = pointerPosition
      ..setPointerAlignment = pointerAlignment
      ..setShowLabel = showLabel
      ..setEnableAnimation = enableAnimation
      ..setPointerAnimation = linearGaugeScope.animation!
      ..setLinearGAuge = linearGaugeScope.lGauge
      ..setLabelStyle = labelStyle;

    super.updateRenderObject(context, renderObject);
  }
}
