import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

@immutable
class LinearGaugeBoxDecoration {
  /// An immutable description of how to paint a box of [LinearGauge].
  ///
  /// [LinearGaugeBoxDecoration] allows to customize the style of [LinearGauge] container.
  const LinearGaugeBoxDecoration(
      {this.backgroundColor = Colors.grey,
      this.height = 4.0,
      this.linearGradient,
      this.borderRadius,
      this.linearGaugeValueColor = Colors.blue,
      this.width = 4.0});

  ///
  /// `color` Set the Color of the [LinearGauge] Container
  ///
  /// ```dart
  ///  const LinearGauge(
  ///   linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///     backgroundColor: Colors.red,
  ///   ),
  // ),
  /// ```
  final Color backgroundColor;

  ///
  /// `height` Sets the height of the [LinearGauge] Container when the orientation in horizontal.
  /// ** Note : When Gauge orientation in vertical this will be ignored since
  /// ** we use `height` from [BoxConstraint].
  /// ```dart
  ///  const LinearGauge(
  ///   linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///     height:20.0
  ///   ),
  // ),
  /// ```
  final double height;

  ///
  /// `width` Sets the height of the [LinearGauge] Container when the orientation is vertical.
  /// ** Note : When Gauge orientation in horizontal this will be ignored since
  /// ** we use `width` from [BoxConstraint].
  ///
  /// ```dart
  ///  const LinearGauge(
  ///   linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///     height:20.0
  ///   ),
  // ),
  /// ```
  final double width;

  ///
  /// `linearGradient` Sets the gradient background of the [LinearGauge] Container
  ///  * NOTE : If `linearGradient` is given in [LinearGaugeBoxDecoration] the `color` property will be ignored
  ///
  /// ```dart
  /// const LinearGauge(
  ///             linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///
  ///              linearGradient: LinearGradient(
  ///                colors: [Colors.blue, Colors.pink],
  ///              ),
  ///            ),
  ///          ),
  /// ```
  final LinearGradient? linearGradient;

  ///
  /// `borderRadius` Set corners to soft edges/rounded  of the [LinearGauge] Container
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
  /// `borderRadius` Set corners to soft edges/rounded  of the [LinearGauge] Container
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
  final Color? linearGaugeValueColor;
}
