import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/pointer/radial_widget_painter.dart';
import '../radial_gauge_state.dart';

///
/// A [RadialWidgetPointer] is used to render the widget pointer in the [RadialGauge].
///
/// ```dart
///RadialGauge(
///          widgetPointer: [
///            RadialWidgetPointer(value: 100, child: FlutterLogo())
///           ],
///           track: RadialTrack(
///             trackStyle: TrackStyle(),
///             start: 0,
///             end: 100,
///           ),
///         ),
/// ```
///

class RadialWidgetPointer extends SingleChildRenderObjectWidget {
  const RadialWidgetPointer({
    Key? key,
    required this.value,
    required Widget child,
    this.isInteractive = false,
    this.onChanged,
  }) : super(key: key, child: child);

  ///
  /// `value` Sets the value of the pointer on the [RadialGauge]
  ///
  final double value;

  ///
  /// Specifies whether to enable the interaction for the pointers.
  ///
  final bool isInteractive;

  ///
  /// onChanged is a  callback function that will be invoked when a `pointer`
  /// value is changed.
  ///
  final ValueChanged<double>? onChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RadialGaugeState scope = RadialGaugeState.of(context);

    return RenderRadialWidgetPointer(
      value: value,
      radialGauge: scope.rGauge,
      isInteractive: isInteractive,
      onChanged: onChanged,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderRadialWidgetPointer renderObject) {
    final RadialGaugeState scope = RadialGaugeState.of(context);
    renderObject
      ..setValue = value
      ..setRadialGauge = scope.rGauge
      ..setIsInteractive = isInteractive
      ..onChanged = onChanged;
    super.updateRenderObject(context, renderObject);
  }
}
