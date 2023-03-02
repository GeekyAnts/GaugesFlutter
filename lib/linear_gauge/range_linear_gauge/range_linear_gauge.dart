import 'package:flutter/material.dart';

class RangeLinearGauge {
  /// A [RangeLinearGauge]  represents range values to be displayed on a linear gauge.

  /// ```dart
  /// const LinearGauge(
  ///  rangeLinearGauge: [
  ///   RangeLinearGauge(color: Colors.red, start: 0, end: 25),
  ///  RangeLinearGauge(color: Colors.yellow, start: 25, end: 50),
  /// RangeLinearGauge(color: Colors.red, start: 51, end: 100)
  /// ],
  /// ```

  RangeLinearGauge({
    required this.color,
    required this.start,
    required this.end,
  });

  /// `color` Sets the color of the range
  final Color color;

  /// `start` Sets the start value of the range
  final double start;

  /// `end` Sets the end value of the range
  final double end;
}
