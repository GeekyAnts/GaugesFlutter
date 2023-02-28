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
      this.height = 10.0,
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

  // void drawPointer(PointerShape shape, Canvas canvas, double? value,
  //     Offset offset, double height, double width, Color indicatorColor) {
  //   switch (shape) {
  //     case PointerShape.circle:
  //       drawCirclePointer(canvas, value, offset, height, width, indicatorColor);
  //       break;
  //     case PointerShape.rectangle:
  //       print("rectangle");
  //       break;
  //     case PointerShape.triangle:
  //       print("triangle");
  //       drawTrianglePointer(
  //           canvas, offset, height, width, value, indicatorColor);
  //       break;
  //     case PointerShape.diamond:
  //       print("diamond");
  //       break;
  //   }
  // }

  void drawCirclePointer(
    Canvas canvas,
    Offset offset,
    double height,
    double width,
    Color indicatorColor,
  ) {
    final paint = Paint();
    paint.color = indicatorColor;
    // TODO Replace 4 with the gauge height
    final position = Offset(offset.dx, offset.dy - ((width / 2) + 4));
    canvas.drawCircle(position, width / 2, paint);
  }

  void drawTrianglePointer(
    Canvas canvas,
    Offset offset,
    double height,
    double width,
    Color indicatorColor,
  ) {
    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();
    path.moveTo(position.dx - (width / 2), -height);
    path.lineTo(position.dx, position.dy - 4);
    path.lineTo(position.dx + (width / 2), -height);
    canvas.drawPath(path, paint);
  }

  void drawCustomPointer(
    Canvas canvas,
    Offset offset,
    double height,
    double width,
    Color indicatorColor,
  ) {
    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();

    path.moveTo(position.dx - (width / 2), -height);
    path.lineTo(position.dx, position.dy - 4);
    path.lineTo(position.dx + (width / 2), -height);
//!
    path.lineTo(position.dx, position.dy + 4);

    canvas.drawPath(path, paint);
    //

    canvas.drawPath(path, paint);
  }

  void drawDiamondPointer(
    Canvas canvas,
    Offset offset,
    double height,
    double width,
    Color indicatorColor,
  ) {
    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();

    path.moveTo(position.dx - (width / 2), -width);
    path.lineTo(position.dx, position.dy - 4);
    path.lineTo(position.dx + (width / 2), -width);
//!
    path.lineTo(position.dx, position.dy - width - width - 4);

    canvas.drawPath(path, paint);
    //

    canvas.drawPath(path, paint);
  }

  void drawReactangle(
    Canvas canvas,
    Offset offset,
    double height,
    double width,
    Color indicatorColor,
  ) {
    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx - width / 2, offset.dy - (height + 4));
    Rect pointerContainer =
        Rect.fromLTWH(position.dx, position.dy, width, height);

    canvas.drawRect(pointerContainer, paint);
  }
}
