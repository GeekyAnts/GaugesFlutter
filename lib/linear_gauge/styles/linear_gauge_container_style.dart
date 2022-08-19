import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';

@immutable
class LinearGaugeBoxDecoration {
  /// An immutable description of how to paint a box of [LinearGauge].
  ///
  /// [LinearGaugeBoxDecoration] allows to customize the style of [LinearGauge] container.
  const LinearGaugeBoxDecoration(
      {this.color = const Color.fromARGB(255, 207, 207, 207),
      this.height = 4.0,
      this.linearGradient,
      this.borderRadius});

  ///
  /// `color` Set the Color of the [LinearGauge] Container
  ///
  /// ```dart
  ///  const LinearGauge(
  ///   linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///     color: Colors.red,
  ///   ),
  // ),
  /// ```
  final Color color;

  ///
  /// `height` Sets the height of the [LinearGauge] Container
  ///
  /// ```dart
  ///  const LinearGauge(
  ///   linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///     height:20.0
  ///   ),
  // ),
  /// ```
  final double height;

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
}
