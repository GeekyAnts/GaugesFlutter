import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/curve/custom_curve_painter.dart';

///
/// A [CustomCurve] is a class that is used to draw custom Section or
///  Zones  on the gauge.
/// These custom Section or zones can have a bezier curve or be in a straight line.
///
///```dart
/// LinearGauge(
///  curves: [
///            CustomCurve(
///                midPoint: 50,
///                midHeight: 100,
///                curvePosition: CurvePosition.top,
///                    ),
///          ],
///    rulers: const RulerStyle(
///           rulerPosition: RulerPosition.bottom,
///                          ),
///         ),
/// ```
///

class CustomCurve extends LeafRenderObjectWidget {
  const CustomCurve({
    Key? key,
    this.startHeight = 0,
    this.endHeight = 0,
    this.midHeight = 10,
    this.paintStyle = PaintStyle.fill,
    this.curveStyle = CurveStyle.bezier,
    this.color,
    this.start = 0,
    this.curvePosition = CurvePosition.bottom,
    this.end = 100,
    required this.midPoint,
  }) : super(key: key);

  ///
  /// [midPoint] is the control point of the Bezier curve.
  ///
  final double midPoint;

  ///
  /// [startHeight] is the height of the curve at the start point.
  ///
  final double? startHeight;

  ///
  /// [start] is the start value of the curve.
  ///
  final double? start;

  ///
  /// [end] is the end value of the curve.
  ///
  final double? end;

  ///
  /// [endHeight] is the height of the curve at the end point.
  ///
  final double? endHeight;

  ///
  /// [color] is the color of the curve.
  ///
  final Color? color;

  ///
  /// [midHeight] is the height of the curve at the mid point.
  ///
  final double? midHeight;

  ///
  /// [curveStyle] allows you to choose between a straight line or a bezier curve.
  ///
  final CurveStyle curveStyle;

  ///
  /// [curvePosition] is the position of the curve on the LinearGauge.
  ///
  final CurvePosition curvePosition;

  ///
  /// [paintStyle] is the style of paint of the curve.
  ///
  final PaintStyle paintStyle;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final LinearGaugeState linearGaugeScope = LinearGaugeState.of(context);

    return RenderCurve(
        linearGauge: linearGaugeScope.lGauge,
        startHeight: startHeight ?? 0,
        endHeight: endHeight ?? 0,
        midHeight: midHeight ?? 10,
        paintStyle: paintStyle,
        curveStyle: curveStyle,
        color: color,
        start: start ?? 0,
        curvePosition: curvePosition,
        end: end ?? 100,
        midPoint: midPoint);
  }

  @override
  void updateRenderObject(BuildContext context, RenderCurve renderObject) {
    final LinearGaugeState linearGaugeScope = LinearGaugeState.of(context);

    renderObject
      ..setLinearGAuge = linearGaugeScope.lGauge
      ..setStartHeight = startHeight ?? 0
      ..setEndHeight = endHeight ?? 0
      ..setMidHeight = midHeight ?? 10
      ..setPaintStyle = paintStyle
      ..setCurveStyle = curveStyle
      ..setColor = color
      ..setStart = start ?? 0
      ..setCurvePosition = curvePosition
      ..setEnd = end ?? 100
      ..setMidPoint = midPoint;

    super.updateRenderObject(context, renderObject);
  }
}
