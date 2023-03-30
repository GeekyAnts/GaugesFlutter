import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

///
/// Allows to customize the style of [LinearGauge] container.
/// Customize features like `backgroundColor`, `thickness`, `linearGradient`, `borderRadius`
/// and `edgeStyle`
///
/// ```dart
/// const LinearGauge(
///  linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
///   borderRadius: 10.0,
///   backgroundColor: Colors.red,
///   thickness: 20.0,
///  ),
/// ),
/// ```

@immutable
class LinearGaugeBoxDecoration {
  ///
  /// An immutable description of how to paint a box of [LinearGauge].
  ///
  const LinearGaugeBoxDecoration({
    this.backgroundColor = Colors.grey,
    this.thickness = 4.0,
    this.linearGradient,
    this.borderRadius,
    this.linearGaugeValueColor = Colors.blue,
    this.edgeStyle = LinearEdgeStyle.bothCurve,
  });

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
  /// `thickness` Sets the thickness of the [LinearGauge]
  /// ```dart
  ///  const LinearGauge(
  ///   linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///     thickness:20.0
  ///   ),
  // ),
  /// ```
  final double? thickness;

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

  ///
  /// `edgeStyle` Set the style of the edges of the  [LinearGauge] Container.
  ///
  /// default is to `edgeStyle =`LinearEdgeStyle.bothCurve`
  ///
  ///
  ///  Note : It tells to which edge of the linear gauge to apply the supplied
  ///         borderRadius. It has no use if borderRadius is not supplied or is zero.
  ///
  /// ```dart
  /// const LinearGauge(
  ///             linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///              linearGradient: LinearGradient(
  ///                colors: [Colors.blue, Colors.pink],
  ///                borderRadius: 10.0,
  ///                edgeStyle: LinearEdgeStyle.bothCurve,
  ///              ),
  ///            ),
  ///          ),
  /// ```
  final LinearEdgeStyle? edgeStyle;
}
