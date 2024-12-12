import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/pointer/radial_shape_pointer_painter.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_state.dart';

///
/// [RadialShapePointer] is used to render the shape pointer in the [RadialGauge].
///
/// Currently Only Supports Circle Shape Pointers.
///
/// ```dart
///RadialGauge(
///   track: const RadialTrack(start: 0, end: 100),
///   shapePointer: [
///     RadialShapePointer(
///       value: value,
///       color: Colors.pink,
///       height: 20,
///       width: 20,
///     ),
///   ],
/// ),
/// ```
///

class RadialShapePointer extends LeafRenderObjectWidget {
  /// [RadialShapePointer] is used to render the shape pointer in the [RadialGauge].
  ///
  /// Currently Only Supports Circle Shape Pointers.
  /// More Shapes to be added soon!
  const RadialShapePointer({
    super.key,
    required this.value,
    this.color = Colors.red,
    this.height = 10,
    this.width = 10,
    this.onChanged,
    this.isInteractive = false,
    this.shape = PointerShape.triangle,
    this.borderColor,
    this.borderWidth,
  });

  ///
  /// `value` sets the value of the [RadialShapePointer] on the [RadialGauge]
  ///
  final double value;

  ///
  /// `color` sets the color of the [RadialShapePointer] on the [RadialGauge]
  ///
  final Color color;

  ///
  /// `isInteractive` specifies whether to enable the interaction for the pointers.
  ///
  /// Defaults to false.
  final bool isInteractive;

  ///
  /// `onChanged` is a  callback function that will be invoked when a `pointer`
  /// value is changed.
  ///
  final ValueChanged<double>? onChanged;

  ///
  /// `height` sets the height of the [RadialShapePointer] on the [RadialGauge]
  ///
  /// Defaults to 10.
  ///
  final double height;

  ///
  /// `width` sets the width of the [RadialShapePointer] on the [RadialGauge]
  ///
  /// Defaults to 10.
  ///
  final double width;

  ///
  /// `shape` sets the shape of the [RadialShapePointer] on the [RadialGauge]
  /// Defaults to [PointerShape.circle]
  ///
  /// Currently Only Supports Circle Shape Pointers.
  ///
  final PointerShape shape;

  ///
  /// `borderColor` draws a border around the [RadialShapePointer] on the [RadialGauge]
  ///  If null, no border is drawn
  ///
  final Color? borderColor;

  ///
  /// `borderWidth` draws a border around the [RadialShapePointer] on the [RadialGauge]
  ///  If null, no border is drawn
  ///
  final double? borderWidth;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RadialGaugeState scope = RadialGaugeState.of(context);

    return RenderRadialShapePointer(
      value: value,
      color: color,
      height: height,
      width: width,
      isInteractive: isInteractive,
      onChanged: onChanged,
      shape: shape,
      radialGauge: scope.rGauge,
      borderColor: borderColor,
      borderWidth: borderWidth,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderRadialShapePointer renderObject) {
    final RadialGaugeState scope = RadialGaugeState.of(context);
    renderObject
      ..setValue = value
      ..setRadialGauge = scope.rGauge
      ..setColor = color
      ..setHeight = height
      ..setWidth = width
      ..onChanged = onChanged
      ..setIsInteractive = isInteractive
      ..setShape = shape
      ..setBorderColor = borderColor
      ..setBorderWidth = borderWidth;
  }
}
