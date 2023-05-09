import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/pointers/linear_gauge_widget_pointer_painter.dart';

import 'linear_gauge_shape_pointer_painter.dart';

/// A [Pointer] is a widget that is used to indicate the value of the [LinearGauge].
///
/// The LinearGauge takes a list of [Pointer] as an input.
/// `value` Sets the value of the pointer
/// `height` and `weight` Sets the height  & weight of the pointer
///
/// `PointerShape` Sets the shape of the pointer
///
/// Note: The `value` of the pointer should be between the `start` and `end` value of the [LinearGauge] and if the value is null it takes the value specified in  `Linear Gauge`
///
/// ```dart
/// const LinearGauge(
///    pointers: const [
///      Pointer(
///       value: 50.0,
///       color: Colors.red,
///       shape: PointerShape.circle,
///    ),
///   ],
/// ),
/// ```
///
///

class WidgetPointer extends SingleChildRenderObjectWidget implements Pointer {
  const WidgetPointer({
    Key? key,
    required this.value,
    this.pointerPosition = PointerPosition.center,
    this.pointerAlignment = PointerAlignment.center,
    this.animationDuration = 1000,
    this.animationType = Curves.ease,
    this.enableAnimation = true,
    Widget? child,
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
  final double value;

  ///
  /// Pointer Position on the [LinearGauge]  sets the position of `pointer` on the [LinearGauge]
  ///
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
        enableAnimation: enableAnimation,
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
      ..setLinearGAuge = linearGaugeScope.lGauge;
  }
}
