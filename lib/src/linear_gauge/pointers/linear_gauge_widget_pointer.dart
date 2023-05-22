import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

/// A [WidgetPointer] implements [Pointer] that is used to add custom widget as a pointer in  [LinearGauge].
///
/// The LinearGauge takes a list of [Pointer] as an input.

/// Note: The `value` of the pointer should be between the `start` and `end` value of the [LinearGauge] and if the value is null it takes the value specified in  `Linear Gauge`
///
/// ```dart
/// const LinearGauge(
///    pointers: const [
///      WidgetPointer(
///       value: 50.0,
///       child: Container(
///              height: 100,
///              width: 200,
///              color: Colors.red,
///               ),
///    ),
///   ],
/// ),
/// ```
///
///

class WidgetPointer extends SingleChildRenderObjectWidget
    implements BasePointer {
  const WidgetPointer({
    Key? key,
    required this.value,
    this.pointerPosition = PointerPosition.center,
    this.pointerAlignment = PointerAlignment.center,
    this.animationDuration = 1000,
    this.animationType = Curves.ease,
    this.enableAnimation = true,
    this.isInteractive = false,
    this.onChanged,
    required Widget child,
  }) : super(key: key, child: child);

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
  /// Pointer Position on the [LinearGauge]  sets the position of `pointer` on the [LinearGauge]
  ///
  @override
  final PointerPosition pointerPosition;

  ///
  /// onChanged is a  callback function that will be invoked when a `pointer`
  /// value is changed.
  ///
  final ValueChanged<double>? onChanged;

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

  ///
  /// Specifies whether to enable the interaction for the pointers.
  ///
  final bool isInteractive;

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
    return RenderLinearGaugeWidgetPointer(
        value: value,
        pointerPosition: pointerPosition,
        pointerAlignment: pointerAlignment,
        animationDuration: animationDuration,
        animationType: animationType,
        isInteractive: isInteractive,
        enableAnimation: enableAnimation,
        onChanged: onChanged,
        pointerAnimation: linearGaugeScope.animation!,
        linearGauge: linearGaugeScope.lGauge);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLinearGaugeWidgetPointer renderObject) {
    final LinearGaugeState linearGaugeScope = LinearGaugeState.of(context);

    renderObject
      ..setValue = value
      ..setPointerPosition = pointerPosition
      ..setPointerAlignment = pointerAlignment
      ..setEnableAnimation = enableAnimation
      ..setPointerAnimation = linearGaugeScope.animation!
      ..onChanged = onChanged
      ..setLinearGAuge = linearGaugeScope.lGauge;

    super.updateRenderObject(context, renderObject);
  }

  @override
  set value(double _value) {
    value = _value;
  }
}
