import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/src/base/base_ruler_style.dart';

class RadialTrack {
  const RadialTrack({
    Key? key,
    required this.start,
    required this.end,
    this.startAngle = 140,
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

  final double start;
  final double end;
  final double startAngle;
  final double endAngle;
  final LinearGradient? gradient;
  final Color color;
  final bool hideStartLabel;

  final double thickness;
  final bool hideTrack;
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
