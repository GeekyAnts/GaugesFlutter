import 'package:flutter/material.dart';

class RadialTrack {
  const RadialTrack({
    Key? key,
    required this.start,
    required this.end,
    this.startAngle = 120,
    this.endAngle = 420,
    this.color = Colors.grey,
    this.thickness = 10,
    Widget? child,
  });

  final double start;
  final double end;
  final double startAngle;
  final double endAngle;
  final Color color;
  final double thickness;
}
