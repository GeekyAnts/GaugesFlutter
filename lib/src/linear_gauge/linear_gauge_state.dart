import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

/// Linear gauge state class.
class LinearGaugeState extends InheritedWidget {
  /// Creates a object for Linear gauge state.
  const LinearGaugeState(
      {Key? key,
      required Widget child,
      required this.orientation,
      required this.isInversed,
      required this.lGauge,
      this.animation,
      this.animationController})
      : super(key: key, child: child);

  /// Child animation.
  final Animation<double>? animation;

  /// Animation controller.
  final AnimationController? animationController;

  /// Specifies the orientation of [LinearGauge].
  final GaugeOrientation orientation;

  /// Determines whether to invert the gauge in [LinearGauge].
  final bool isInversed;

  final LinearGauge lGauge;

  ///LinearGaugeState scope method.
  static LinearGaugeState of(BuildContext context) {
    late LinearGaugeState scope;

    final InheritedWidget widget = context
        .getElementForInheritedWidgetOfExactType<LinearGaugeState>()!
        .widget as InheritedWidget;

    if (widget is LinearGaugeState) {
      scope = widget;
    }

    return scope;
  }

  @override
  bool updateShouldNotify(LinearGaugeState oldWidget) {
    return orientation != oldWidget.orientation ||
        isInversed != oldWidget.isInversed ||
        animationController != oldWidget.animationController ||
        animation != oldWidget.animation;
  }
}
