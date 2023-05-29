import 'package:flutter/material.dart';
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
      this.needleWidth = 10,
      this.needleHeight = 150,
      this.tailRadius = 20})
      : super(key: key);

  final double value;
  final Color color;
  final double needleHeight;
  final double needleWidth;
  final double tailRadius;
  final LinearGradient? gradient;
  final Color tailColor;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RadialGaugeState scope = RadialGaugeState.of(context);

    return RenderNeedlePointer(
      gradient: gradient ?? LinearGradient(colors: [color, color]),
      radialGauge: scope.rGauge,
      value: value,
      tailColor: tailColor,
      color: color,
      needleHeight: needleHeight,
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
      ..setTailColor = tailColor
      ..setGradient = gradient ?? LinearGradient(colors: [color, color])
      ..setNeedleHeight = needleHeight
      ..setTailRadius = tailRadius
      ..setNeedleWidth = needleWidth
      ..setRadialGauge = scope.rGauge;
  }
}
