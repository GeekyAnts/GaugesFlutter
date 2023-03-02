import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:geekyants_flutter_gauges/linear_gauge/linear_gauge_painter.dart';

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
    this.shape,
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
  void drawPointer(
    PointerShape shape,
    Canvas canvas,
    Offset offset,
    RenderLinearGauge linearGauge,
  ) {
    switch (shape) {
      case PointerShape.circle:
        _drawCirclePointer(canvas, offset, linearGauge);
        break;
      case PointerShape.rectangle:
        _drawReactangle(canvas, offset, linearGauge);
        break;
      case PointerShape.triangle:
        _drawTrianglePointer(canvas, offset, linearGauge);
        break;
      case PointerShape.diamond:
        _drawDiamondPointer(canvas, offset, linearGauge);
        break;
      default:
        _drawArrowPointer(canvas, offset, linearGauge);
    }
  }

  void _drawCirclePointer(
      Canvas canvas, Offset offset, RenderLinearGauge linearGauge) {
    Color indicatorColor = linearGauge.getLinearGaugeIndicator.color!;
    // double height = linearGauge.getLinearGaugeIndicator.height!;
    double width = linearGauge.getLinearGaugeIndicator.width!;
    double gaugeheight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    double primaryRulerHeight = linearGauge.getPrimaryRulersHeight;

    final paint = Paint();
    paint.color = indicatorColor;
    late double yPos;
    linearGauge.getLinearGaugeIndicator;

    if (linearGauge.rulerPosition == RulerPosition.bottom) {
      yPos = offset.dy - ((width / 2) + gaugeheight);
    } else if (rulerPosition == RulerPosition.center) {
      yPos = offset.dy - ((width / 2) + primaryRulerHeight / 2);
    } else {
      yPos = offset.dy + ((width / 2));
    }
    final position = Offset(offset.dx, yPos);
    canvas.drawCircle(position, width / 2, paint);
  }

  void _drawTrianglePointer(
      Canvas canvas, Offset offset, RenderLinearGauge linearGauge) {
    Color indicatorColor = linearGauge.getLinearGaugeIndicator.color!;
    double height = linearGauge.getLinearGaugeIndicator.height!;
    double width = linearGauge.getLinearGaugeIndicator.width!;
    double gaugeheight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    double primaryRulerHeight = linearGauge.getPrimaryRulersHeight;
    final paint = Paint();
    paint.color = indicatorColor;

    late double yPos;
    if (rulerPosition == RulerPosition.top) {
      yPos = gaugeheight + height;
    } else if (rulerPosition == RulerPosition.center) {
      yPos = -height + primaryRulerHeight / 2;
    } else {
      yPos = -height;
    }

    final position = Offset(offset.dx, offset.dy);
    final path = Path();
    path.moveTo(position.dx - (width / 2), yPos);
    path.lineTo(position.dx, position.dy - 4);
    path.lineTo(position.dx + (width / 2), yPos);
    canvas.drawPath(path, paint);
  }

  void _drawArrowPointer(
    Canvas canvas,
    Offset offset,
    RenderLinearGauge linearGauge,
  ) {
    double gaugeheight = linearGauge.getLinearGaugeBoxDecoration.height;
    Color indicatorColor = linearGauge.getLinearGaugeIndicator.color!;
    double height = linearGauge.getLinearGaugeIndicator.height!;
    double width = linearGauge.getLinearGaugeIndicator.width!;
    double primaryRulerHeight = linearGauge.getPrimaryRulersHeight;
    // double gaugeheight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();
    // late double yPos;

    if (rulerPosition == RulerPosition.bottom) {
      path.moveTo(position.dx - (width / 2), -height);
      path.lineTo(position.dx, position.dy - gaugeheight);
      path.lineTo(position.dx + (width / 2), -height);
      path.lineTo(position.dx, position.dy - primaryRulerHeight + gaugeheight);
    } else {
      path.moveTo(position.dx - (width / 2), height);
      path.lineTo(position.dx, position.dy - gaugeheight);
      path.lineTo(position.dx + (width / 2), height);
      path.lineTo(position.dx, position.dy - primaryRulerHeight);
    }
    canvas.drawPath(path, paint);
  }

  void _drawDiamondPointer(
    Canvas canvas,
    Offset offset,
    RenderLinearGauge linearGauge,
  ) {
    Color indicatorColor = linearGauge.getLinearGaugeIndicator.color!;
    // double height = linearGauge.getLinearGaugeIndicator.height!;
    double width = linearGauge.getLinearGaugeIndicator.width!;
    double gaugeheight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    double primaryRulerHeight = linearGauge.getPrimaryRulersHeight;

    // late double yPos;

    final paint = Paint();
    paint.color = indicatorColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();

    if (rulerPosition == RulerPosition.bottom) {
      path.moveTo(position.dx - (width / 2), -width);
      path.lineTo(position.dx, position.dy - gaugeheight);

      path.lineTo(position.dx + (width / 2), -width);
      path.lineTo(position.dx, offset.dy - width - width - gaugeheight);
      path.close();
    } else if (rulerPosition == RulerPosition.center) {
      path.moveTo(position.dx - (width / 2), -width);
      path.lineTo(position.dx, position.dy - primaryRulerHeight / 2);
      path.lineTo(position.dx + (width / 2), -width);
      path.lineTo(position.dx, offset.dy - width - width - gaugeheight);
      path.close();
    } else {
      path.moveTo(position.dx - (width / 2), offset.dy + width);
      path.lineTo(position.dx, position.dy);
      path.lineTo(position.dx + (width / 2), offset.dy + width);
      path.lineTo(position.dx, offset.dy + width + width - gaugeheight);
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  void _drawReactangle(
      Canvas canvas, Offset offset, RenderLinearGauge linearGauge) {
    final paint = Paint();
    Color indicatorColor = linearGauge.getLinearGaugeIndicator.color!;
    double height = linearGauge.getLinearGaugeIndicator.height!;
    double width = linearGauge.getLinearGaugeIndicator.width!;
    double gaugeheight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    paint.color = indicatorColor;

    double yPos;
    if (rulerPosition == RulerPosition.top) {
      yPos = offset.dy;
    } else if (rulerPosition == RulerPosition.center) {
      yPos = offset.dy - height - (2 * gaugeheight);
    } else {
      yPos = offset.dy - gaugeheight - height;
    }

    final position = Offset(offset.dx - width / 2, yPos);
    Rect pointerContainer =
        Rect.fromLTWH(position.dx, position.dy, width, height);

    canvas.drawRect(pointerContainer, paint);
  }
}
