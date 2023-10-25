import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_state.dart';
import 'needle_pointer_painter.dart';

///
/// Creates a needle pointer for [RadialGauge].
///
///```dart
///  RadialGauge(
///   needlePointer: [
///     NeedlePointer(value: 30),
///   ],
///   track: RadialTrack(
///     start: 0,
///     end: 100,
///   ),
///  ),
/// ```
class NeedlePointer extends LeafRenderObjectWidget {
  /// Creates a needle pointer for [RadialGauge].
  ///
  ///```dart
  ///  RadialGauge(
  ///   needlePointer: [
  ///     NeedlePointer(value: 30),
  ///   ],
  ///   track: RadialTrack(
  ///     start: 0,
  ///     end: 100,
  ///   ),
  ///  ),
  /// ```
  const NeedlePointer(
      {Key? key,
      required this.value,
      this.gradient,
      this.color = Colors.red,
      this.tailColor = Colors.red,
      this.needleWidth = 40,
      this.needleHeight = 300,
      this.onChanged,
      this.isInteractive = false,
      this.needleStyle = NeedleStyle.gaugeNeedle,
      this.tailRadius = 80})
      : super(key: key);

  final double value;
  final bool isInteractive;
  final Color color;
  final double needleHeight;
  final double needleWidth;
  final double tailRadius;
  final LinearGradient? gradient;
  final Color tailColor;
  final NeedleStyle needleStyle;
  final ValueChanged<double>? onChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RadialGaugeState scope = RadialGaugeState.of(context);

    return RenderNeedlePointer(
      gradient: gradient ?? LinearGradient(colors: [color, color]),
      radialGauge: scope.rGauge,
      value: value,
      tailColor: tailColor,
      needleStyle: needleStyle,
      isInteractive: isInteractive,
      color: color,
      needleHeight: needleHeight,
      onChanged: onChanged,
      needleWidth: needleWidth,
      tailRadius: tailRadius,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderNeedlePointer renderObject) {
    final RadialGaugeState scope = RadialGaugeState.of(context);
    renderObject
      ..setValue = value
      ..setColor = color
      ..setIsInteractive = isInteractive
      ..setTailColor = tailColor
      ..setGradient = gradient ?? LinearGradient(colors: [color, color])
      ..setNeedleHeight = needleHeight
      ..setTailRadius = tailRadius
      ..onChanged = onChanged
      ..setNeedleStyle = needleStyle
      ..setNeedleWidth = needleWidth
      ..setRadialGauge = scope.rGauge;
  }
}
