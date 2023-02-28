import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class LinearGaugeIndicator {
  /// A [LinearGaugeIndicator] is a widget that is used to indicate the value of the [LinearGauge].
  /// `value` Sets the value of the pointer
  /// `height` and `weight` Sets the height  & weight of the pointer
  ///
  /// `PointerShape` Sets the shape of the pointer
  ///
  /// Note: The `value` of the pointer should be between the `start` and `end` value of the [LinearGauge] and if the value is null it takes the value specified in  `Linear Gauge`
  ///
  /// ```dart
  /// const LinearGauge(
  ///    indicator: LinearGaugeIndicator(
  ///    height: 20.0,
  ///    width: 20.0,
  ///    color: Colors.red,
  ///    value: 50.0,
  ///    shape: PointerShape.circle,
  /// ),
  /// ```
  ///
  ///

  const LinearGaugeIndicator({
    Key? key,
    this.value,
    this.height = 10.0,
    this.color = Colors.red,
    this.width = 10.0,
    required this.shape,
  });

  ///
  /// `value` Sets the value of the indicator on the [LinearGauge]
  /// default is to set to the value of the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///  indicator: LinearGaugeIndicator(
  ///  value: 50.0,
  /// ),
  /// ```
  final double? value;

  ///
  /// `height` Sets the height of the indicator on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///   indicator: LinearGaugeIndicator(
  ///   height: 20.0,
  /// ),
  /// ```
  ///
  final double? height;

  ///
  /// `width` Sets the width of the indicator on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///  indicator: LinearGaugeIndicator(
  ///  width: 20.0,
  /// ),
  /// ```
  ///
  final double? width;

  ///
  /// `color` Sets the color of the indicator on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///  indicator: LinearGaugeIndicator(
  ///  color: Colors.blue,
  /// ),
  /// ```
  /// default is to [Colors.blue]
  ///
  final Color? color;

  ///
  /// `shape` Sets the shape of the indicator on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///   indicator: LinearGaugeIndicator(
  ///    shape: PointerShape.circle,
  /// ),
  /// ```
  /// default is to [PointerShape.circle]
  /// [PointerShape] has 4 types of shapes
  /// 1. [PointerShape.circle]
  /// 2. [PointerShape.rectangle]
  /// 3. [PointerShape.triangle]
  /// 4. [PointerShape.diamond]
  ///
  final PointerShape? shape;

  get getPointerValue => value;
  set setPointerValue(double? value) => value = value;

  get getPointerColor => color;
  set setPointerColor(Color? color) => color = color;

  get getPointerShape => shape;
  set setPointerShape(PointerShape? shape) => shape = shape;

  /// Method to draw the pointer on the canvas
  void drawPointer(PointerShape shape, Canvas canvas, Offset offset,
      double height, double width, Color indicatorColor, double gaugeHeight) {
    switch (shape) {
      case PointerShape.circle:
        drawCirclePointer(
            canvas, offset, height, width, indicatorColor, gaugeHeight);
        break;
      case PointerShape.rectangle:
        drawReactangle(
            canvas, offset, height, width, indicatorColor, gaugeHeight);
        break;
      case PointerShape.triangle:
        drawTrianglePointer(
            canvas, offset, height, width, indicatorColor, gaugeHeight);
        break;
      case PointerShape.diamond:
        drawDiamondPointer(
            canvas, offset, height, width, indicatorColor, gaugeHeight);
        break;
      default:
        drawCustomPointer(
            canvas, offset, height, width, indicatorColor, gaugeHeight);
    }
  }

  void drawCirclePointer(Canvas canvas, Offset offset, double height,
      double width, Color indicatorColor, double gaugeHeight) {
    final paint = Paint();
    paint.color = indicatorColor;
    final position = Offset(offset.dx, offset.dy - ((width / 2) + gaugeHeight));
    canvas.drawCircle(position, width / 2, paint);
  }

  void drawTrianglePointer(Canvas canvas, Offset offset, double height,
      double width, Color indicatorColor, double gaugeHeight) {
    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();
    path.moveTo(position.dx - (width / 2), -height);
    path.lineTo(position.dx, position.dy - 4);
    path.lineTo(position.dx + (width / 2), -height);
    canvas.drawPath(path, paint);
  }

  void drawCustomPointer(Canvas canvas, Offset offset, double height,
      double width, Color indicatorColor, double gaugeHeight) {
    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();

    path.moveTo(position.dx - (width / 2), -height);
    path.lineTo(position.dx, position.dy - 4);
    path.lineTo(position.dx + (width / 2), -height);
    path.lineTo(position.dx, position.dy + 4);

    canvas.drawPath(path, paint);
  }

  void drawDiamondPointer(Canvas canvas, Offset offset, double height,
      double width, Color indicatorColor, double gaugeHeight) {
    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();

    path.moveTo(position.dx - (width / 2), -width);
    path.lineTo(position.dx, position.dy - 4);
    path.lineTo(position.dx + (width / 2), -width);
    path.lineTo(position.dx, position.dy - width - width - 4);

    canvas.drawPath(path, paint);
  }

  void drawReactangle(Canvas canvas, Offset offset, double height, double width,
      Color indicatorColor, double gaugeHeight) {
    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx - width / 2, offset.dy - (height + 4));
    Rect pointerContainer =
        Rect.fromLTWH(position.dx, position.dy, width, height);

    canvas.drawRect(pointerContainer, paint);
  }
}
