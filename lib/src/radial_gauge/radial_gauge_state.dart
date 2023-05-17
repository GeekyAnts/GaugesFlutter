import 'package:flutter/material.dart';

import '../../geekyants_flutter_gauges.dart';

class RadialGaugeState extends InheritedWidget {
  const RadialGaugeState({
    Key? key,
    required Widget child,
    required this.track,
    required this.rGauge,
    this.needlePointer,
  }) : super(key: key, child: child);

  final RadialGauge rGauge;
  final RadialTrack track;
  final NeedlePointer? needlePointer;

// Radial Gauge scoppe method
  static RadialGaugeState of(BuildContext context) {
    late RadialGaugeState scope;

    final InheritedWidget widget = context
        .getElementForInheritedWidgetOfExactType<RadialGaugeState>()!
        .widget as InheritedWidget;

    if (widget is RadialGaugeState) {
      scope = widget;
    }
    return scope;
  }

  @override
  bool updateShouldNotify(RadialGaugeState oldWidget) {
    return track != oldWidget.rGauge.track;
  }
}
