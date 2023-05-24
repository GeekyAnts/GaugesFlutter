import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/src/base/base_ruler_style.dart';

class RadialTrack {
  const RadialTrack({
    Key? key,
    required this.start,
    required this.end,
    this.startAngle = 140,
    this.steps = 10,
    this.endAngle = 400,
    this.color = Colors.grey,
    this.hideStartLabel = false,
    this.hideTrack = false,
    this.thickness = 10,
    this.trackStyle = const TrackStyle(
      primaryRulersHeight: 20,
      primaryRulerColor: Colors.black54,
      secondaryRulerColor: Colors.grey,
      inverseRulers: false,
      secondaryRulersHeight: 10,
      primaryRulersWidth: 1.0,
      secondaryRulerPerInterval: 1.0,
    ),
    this.gradient,
    Widget? child,
  });

  ///
  /// The [start] property is used to set the start value of the Radial Gauge.
  ///
  final double start;

  ///
  /// The [end] property is used to set the end value of the Radial Gauge.
  ///
  final double end;

  ///
  /// The [startAngle] property is used to set the start angle of the Radial Gauge.
  /// The default value is 140.
  ///
  final double startAngle;

  ///
  /// The [endAngle] property is used to set the end angle of the Radial Gauge.
  /// The default value is 400.
  final double endAngle;

  ///
  /// The [steps] property is used to set the number of steps in the Radial Gauge.
  /// The default value is 10.
  ///
  final int steps;

  ///
  /// The [gradient] property is used to set the gradient of the Radial Gauge.
  ///
  final LinearGradient? gradient;

  ///
  /// The [color] property is used to set the color of the Radial Gauge.
  ///
  final Color color;

  ///
  /// The [hideStartLabel] property is used to hide the start label of the Radial Gauge.
  ///
  final bool hideStartLabel;

  ///
  /// The [thickness] property is used to set the thickness of the Radial Gauge.
  ///
  final double thickness;

  ///
  /// The [hideTrack] property is used to hide the track of the Radial Gauge.
  ///
  final bool hideTrack;

  ///
  ///
  final TrackStyle trackStyle;
}

class TrackStyle extends BaseRulerStyle {
  const TrackStyle({
    super.primaryRulersHeight,
    super.primaryRulerColor = Colors.black54,
    super.primaryRulersWidth = 1.0,
    super.secondaryRulersHeight = 10,
    super.secondaryRulersWidth = 1.0,
    super.secondaryRulerColor = Colors.grey,
    super.secondaryRulerPerInterval = 1.0,
    super.showSecondaryRulers = true,
    super.showPrimaryRulers = true,
    super.showLabel = true,
    super.labelOffset = 0,
    super.rulersOffset = 0,
    super.inverseRulers = false,
  });
}
