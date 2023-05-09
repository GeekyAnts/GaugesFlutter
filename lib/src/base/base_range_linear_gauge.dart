import 'dart:ui';

import '../../geekyants_flutter_gauges.dart';

abstract class BaseRangeLinearGauge {
  BaseRangeLinearGauge({
    required this.color,
    required this.start,
    required this.end,
    this.borderRadius,
    this.edgeStyle = LinearEdgeStyle.bothCurve,
  });

  /// `color` Sets the color of the range
  final Color color;

  /// `start` Sets the start value of the range
  final double start;

  /// `end` Sets the end value of the range
  final double end;

  /// `borderRadius` Sets the border radius of the range bar
  final double? borderRadius;

  /// `edgeStyle` Sets the style of the edges of the range bar
  final LinearEdgeStyle edgeStyle;
}
