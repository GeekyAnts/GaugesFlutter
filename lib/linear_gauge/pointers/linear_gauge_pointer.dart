import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class LinearGaugeIndicator {
  /// A [pointer] is a widget that is used to indicate the value of the [LinearGauge].
  /// `value` Sets the value of the pointer
  /// `height` and `weight` Sets the height  & weight of the pointer
  ///
  /// `PointerShape` Sets the shape of the pointer
  ///
  /// ```dart
  /// const LinearGauge(
  ///  pointers: [
  ///   Pointer(
  ///    value: 50.0,
  ///   height: 20.0,
  ///  shape: PointerShape.circle,
  ///  width: 20.0,
  /// ),
  /// ```
  ///
  ///

  const LinearGaugeIndicator(
      {Key? key,
      this.value,
      this.height = 30.0,
      this.color = Colors.red,
      this.width = 10.0,
      this.shape = PointerShape.circle});

  ///
  /// `value` Sets the value of the pointer on the [LinearGauge]
  /// default is to 0.0
  /// ```dart
  /// const LinearGauge(
  /// pointers: [
  /// Pointer(
  /// value: 50.0,
  /// ),
  /// ```
  final double? value;

  ///
  /// `height` Sets the height of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  /// pointers: [
  /// Pointer(
  /// height: 20.0,
  /// ),
  /// ```
  ///
  final double? height;

  ///
  /// `width` Sets the width of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  /// pointers: [
  /// Pointer(
  /// width: 20.0,
  /// ),
  /// ```
  ///
  final double? width;

  ///
  /// `color` Sets the color of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  /// pointers: [
  /// Pointer(
  /// color: Colors.blue,
  /// ),
  /// ```
  /// default is to [Colors.blue]
  ///
  final Color? color;

  ///
  /// `shape` Sets the shape of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  /// pointers: [
  /// Pointer(
  /// shape: PointerShape.circle,
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

  void drawCirclePointer(
    Canvas canvas,
    double? value,
    Offset offset,
    double height,
    double width,
    // Color indicatorColor,
  ) {
    final paint = Paint();
    paint.color = Colors.blue;
    // print("width in the pointer  ${size.width}");
    final position = Offset(offset.dx, offset.dy);
    canvas.drawCircle(position, 10, paint);
  }

  // void drawRectPointer(
  //   Canvas canvas,
  //   Size size,
  //   double? value,
  //   // Color indicatorColor,
  // ) {
  //   final paint = Paint();
  //   paint.color = Colors.red;
  //   final position = Offset(value! * size.width / 100, size.height / 40);
  //   canvas.drawRect(
  //       Rect.fromCenter(center: position, width: 20, height: 20), paint);
  // }

  void drawTrianglePointer(
    Canvas canvas,
    Offset offset,
    double height,
    double width,
    double? value,
    Color indicatorColor,
  ) {
    final paint = Paint();
    paint.color = indicatorColor;
    // print(size.height);
    // final center = Offset(value! * size.width / 100 - 10, size.height - 70);
    final position = Offset(offset.dx, offset.dy);
    final path = Path();
    // Y is for height
    // X is for width
    path.moveTo(position.dx - width, -height);
    path.lineTo(position.dx, position.dy - 4);
    path.lineTo(position.dx + width, -height);

    canvas.drawPath(path, paint);
  }
}
