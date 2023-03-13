import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:geekyants_flutter_gauges/linear_gauge/linear_gauge_painter.dart';

class Pointer {
  /// A [Pointer] is a widget that is used to indicate the value of the [LinearGauge].
  /// `value` Sets the value of the pointer
  /// `height` and `weight` Sets the height  & weight of the pointer
  ///
  /// `PointerShape` Sets the shape of the pointer
  ///
  /// Note: The `value` of the pointer should be between the `start` and `end` value of the [LinearGauge] and if the value is null it takes the value specified in  `Linear Gauge`
  ///
  /// ```dart
  /// const LinearGauge(
  ///    pointer: Pointer(
  ///    height: 20.0,
  ///    width: 20.0,
  ///    color: Colors.red,
  ///    value: 50.0,
  ///    shape: PointerShape.circle,
  ///   ),
  /// ),
  /// ```
  ///
  ///

  const Pointer({
    Key? key,
    this.value,
    this.height = 10.0,
    this.color = Colors.red,
    this.width = 10.0,
    this.shape,
    this.showLabel = true,
    this.quarterTurns = QuarterTurns.zero,
    this.labelStyle = const TextStyle(),
  });

  ///
  /// `value` Sets the value of the pointer on the [LinearGauge]
  /// default is to set to the value of the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  ///  value: 50.0,
  /// ),
  /// ),
  /// ```
  final double? value;

  ///
  /// `height` Sets the height of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///   pointer: Pointer(
  ///   height: 20.0,
  ///  ),
  /// ),
  /// ```
  ///
  final double? height;

  ///
  /// `width` Sets the width of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  ///  width: 20.0,
  ///  ),
  /// ),
  /// ```
  ///
  final double? width;

  ///
  /// `color` Sets the color of the pointer on the [LinearGauge]
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  ///  color: Colors.blue,
  ///  ),
  /// ),
  /// ```
  /// default is to [Colors.blue]
  ///
  final Color? color;

  ///
  /// `shape` Sets the shape of the pointer on the [LinearGauge]
  ///
  /// ```dart
  /// const LinearGauge(
  ///   pointer: Pointer(
  ///    shape: PointerShape.circle,
  ///  ),
  /// )
  /// ```
  /// default is to [PointerShape.circle]
  /// [PointerShape] has 4 types of shapes
  /// 1. [PointerShape.circle]
  /// 2. [PointerShape.rectangle]
  /// 3. [PointerShape.triangle]
  /// 4. [PointerShape.diamond]
  ///
  final PointerShape? shape;

  ///
  /// `showLabel` shows/hides the label of the pointer on the [Pointer]
  ///
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  /// showLabel: true,
  ///  ),
  /// ),
  /// ```
  /// default is to [true]
  ///
  final bool showLabel;

  ///
  /// `quarterTurns` Sets the rotation of the label of `pointer`
  ///
  /// ```dart
  /// const LinearGauge(
  ///   pointer: Pointer(
  ///   quarterTurns: QuarterTurns.one,
  ///   shape: PointerShape.rectangle,
  ///   value: 50.0,
  ///  ),
  /// ),
  ///  ```
  final QuarterTurns? quarterTurns;

  ///
  /// `labelStyle` Sets the style of the label of `pointer`
  ///
  /// ```dart
  /// const LinearGauge(
  ///  pointer: Pointer(
  ///  labelStyle: TextStyle(
  ///  color: Colors.red,
  ///  fontSize: 20.0,
  ///  fontWeight: FontWeight.bold,
  ///  ),
  /// ),
  /// ),
  /// ```
  final TextStyle? labelStyle;

  ///
  /// Getters and Setters for `value`
  ///
  get getPointerValue => value;
  set setPointerValue(double? value) => value = value;

  ///
  /// Getters and Setters for `color`
  ///
  get getPointerColor => color;
  set setPointerColor(Color? color) => color = color;

  ///
  /// Getters and Setters for `shape`
  ///
  get getPointerShape => shape;
  set setPointerShape(PointerShape? shape) => shape = shape;

  ///
  /// Getters and Setters for `labelStyle`
  ///
  get getPointerLabelStyle => labelStyle;
  set setPointerLabelStyle(TextStyle? labelStyle) => labelStyle = labelStyle;

  /// Method to draw the pointer on the canvas based on the pointer shape
  void drawPointer(
    PointerShape? shape,
    Canvas canvas,
    double start,
    double end,
    Offset offset,
    RenderLinearGauge linearGauge,
  ) {
    // double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    GaugeOrientation gaugeOrientation = linearGauge.getGaugeOrientation;
    final paint = Paint();
    paint.color = color!;
    double endValue = linearGauge.getEnd;
    double startValue = linearGauge.getStart;
    double totalWidth = end;

    bool isInversedRulers = linearGauge.getInversedRulers;

    double valueInPX = isInversedRulers
        ? ((value! - endValue) / (startValue - endValue)) * totalWidth
        : ((value! - startValue) / (endValue - startValue)) * totalWidth;

    Offset hOffset = Offset(valueInPX + start, offset.dy);

    Offset vOffset = isInversedRulers
        ? Offset(offset.dx, offset.dy + (end - valueInPX))
        : Offset(offset.dx, offset.dy - valueInPX);

    offset =
        gaugeOrientation == GaugeOrientation.horizontal ? hOffset : vOffset;
    Offset labelOffset =
        gaugeOrientation == GaugeOrientation.horizontal ? hOffset : vOffset;
    switch (shape) {
      case PointerShape.circle:
        _layoutCircleOffsets(canvas, offset, linearGauge);
        break;
      case PointerShape.rectangle:
        _layoutRectangleOffsets(canvas, offset, linearGauge);
        break;
      case PointerShape.triangle:
        _layoutTriangleOffsets(canvas, offset, linearGauge);
        break;
      case PointerShape.diamond:
        _layoutDiamondOffsets(canvas, offset, linearGauge);
        break;
      default:
        return;
    }

    if (showLabel) {
      _drawLabel(
        canvas,
        labelOffset,
        quarterTurns!,
        rulerPosition,
        linearGauge,
      );
    }
  }

  // Method to draw the Text for  Pointers
  void _drawLabel(
    Canvas canvas,
    Offset offset,
    QuarterTurns quarterTurns,
    RulerPosition rulerPosition,
    RenderLinearGauge linearGauge,
  ) {
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    GaugeOrientation gaugeOrientation = linearGauge.getGaugeOrientation;

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.text = TextSpan(
        text:
            value == null ? linearGauge.getValue.toString() : value.toString(),
        style: labelStyle ?? TextStyle(color: getPointerColor, fontSize: 12.0));

    textPainter.layout();
    if (shape == PointerShape.circle) {
      if (gaugeOrientation == GaugeOrientation.horizontal) {
        switch (rulerPosition) {
          case RulerPosition.bottom:
            offset = Offset(offset.dx, offset.dy - width! - gaugeHeight);
            break;
          case RulerPosition.top:
            offset = Offset(offset.dx, offset.dy + width!);
            break;
          default:
            offset = Offset(offset.dx, offset.dy - width! - gaugeHeight * 2);
        }
      } else {
        switch (rulerPosition) {
          case RulerPosition.left:
            offset = Offset(offset.dx + width!, offset.dy);
            break;
          case RulerPosition.right:
            offset = Offset(offset.dx - width!, offset.dy);
            break;
          default:
            offset = Offset(offset.dx - width! - gaugeHeight, offset.dy);
        }
      }

      double textWidth = textPainter.width / 2;
      double textHeight = textPainter.height / 2;
      // Draw the text centered at the rotated canvas origin
      switch (quarterTurns) {
        case QuarterTurns.zero:
          final textOffset =
              Offset(offset.dx - textWidth, offset.dy - textHeight);
          textPainter.paint(canvas, textOffset);
          break;

        case QuarterTurns.two:
          final center = offset;
          canvas.save();
          canvas.translate(center.dx, center.dy);
          canvas.rotate(180 * pi / 180);
          textPainter.paint(canvas, Offset(-textWidth, -textHeight));
          canvas.restore();
          break;

        case QuarterTurns.one:
          final center = offset;
          canvas.save();
          canvas.translate(center.dx, center.dy);
          canvas.rotate(90 * pi / 180);
          textPainter.paint(canvas, Offset(-textWidth, -textHeight));
          canvas.restore();
          break;

        case QuarterTurns.three:
          final center = offset;
          canvas.save();
          canvas.translate(center.dx, center.dy);
          canvas.rotate(-90 * pi / 180);
          textPainter.paint(
              canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
          canvas.restore();
          break;

        default:
          QuarterTurns.zero;
      }
    } else {
      double textWidth = textPainter.width / 2;
      double textHeight = textPainter.height / 2;

      switch (rulerPosition) {
        case RulerPosition.bottom:
          var yAxisTurn =
              quarterTurns == QuarterTurns.zero ? gaugeHeight : gaugeHeight * 2;
          offset = Offset(offset.dx - textWidth,
              -((yAxisTurn) + textHeight + height! + textHeight));
          break;
        case RulerPosition.top:
          offset =
              Offset(offset.dx - textWidth, height! + textHeight - gaugeHeight);
          break;
        case RulerPosition.center:
          gaugeOrientation == GaugeOrientation.horizontal
              ? offset = Offset(offset.dx - textWidth,
                  -(gaugeHeight + textHeight + height! + textHeight))
              : offset = Offset(-width! - textPainter.width - gaugeHeight,
                  offset.dy - textHeight);
          break;
        case RulerPosition.right:
          offset =
              Offset(-(width! + textPainter.width), offset.dy - textHeight);
          break;
        case RulerPosition.left:
          offset = Offset((width! + gaugeHeight), offset.dy - textHeight);
          break;

        default:
      }

      double angle = getAngle();
      double x = offset.dx;
      double y = offset.dy;
      final pivot = textPainter.size.center(Offset(x, y));
      canvas.save();
      canvas.translate(pivot.dx, pivot.dy);
      canvas.rotate(angle * pi / 180);
      canvas.translate(-pivot.dx, -pivot.dy);
      textPainter.paint(canvas, offset);
      canvas.restore();
    }
  }

  void _layoutCircleOffsets(
    Canvas canvas,
    Offset offset,
    RenderLinearGauge linearGauge,
  ) {
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    GaugeOrientation orientation = linearGauge.getGaugeOrientation;

    switch (rulerPosition) {
      case RulerPosition.bottom:
        offset = Offset(offset.dx, offset.dy - width! - gaugeHeight);
        _drawCircle(canvas, offset);
        break;
      case RulerPosition.top:
        offset = Offset(offset.dx, offset.dy + width!);
        _drawCircle(canvas, offset);
        break;
      case RulerPosition.center:
        offset = orientation == GaugeOrientation.horizontal
            ? Offset(offset.dx, offset.dy - width! - gaugeHeight)
            : Offset(offset.dx - gaugeHeight - width!, offset.dy);
        _drawCircle(canvas, offset);
        break;
      case RulerPosition.left:
        offset = Offset(offset.dx + width!, offset.dy);
        _drawCircle(canvas, offset);
        break;
      case RulerPosition.right:
        offset = Offset(offset.dx - width! - gaugeHeight, offset.dy);
        _drawCircle(canvas, offset);
        break;
    }
  }

  _drawCircle(Canvas canvas, Offset offset) {
    final paint = Paint()..color = color!;
    paint.color = color!;
    canvas.drawCircle(offset, width!, paint);
  }

  // Drawing the Rectangle Pointer
  void _layoutRectangleOffsets(
      Canvas canvas, Offset offset, RenderLinearGauge linearGauge) {
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    GaugeOrientation rulerOrientation = linearGauge.getGaugeOrientation;
    switch (rulerPosition) {
      case RulerPosition.bottom:
        offset = Offset(offset.dx, offset.dy - height! / 2 - gaugeHeight);
        _drawRectangle(canvas, offset);
        break;
      case RulerPosition.top:
        offset = Offset(offset.dx, offset.dy + height! / 2);
        _drawRectangle(canvas, offset);
        break;
      case RulerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(offset.dx, offset.dy - height! / 2 - gaugeHeight)
            : Offset(offset.dx - width! / 2 - gaugeHeight, offset.dy);
        _drawRectangle(canvas, offset);
        break;
      case RulerPosition.left:
        offset = Offset(offset.dx + width! / 2, offset.dy);
        _drawRectangle(canvas, offset);
        break;
      case RulerPosition.right:
        offset = Offset(offset.dx - width! / 2 - gaugeHeight, offset.dy);
        _drawRectangle(canvas, offset);
        break;
    }
  }

  _drawRectangle(Canvas canvas, Offset offset) {
    final paint = Paint()..color = color!;

    Rect rect = Rect.fromCenter(center: offset, width: width!, height: height!);

    canvas.drawRect(rect, paint);
  }

  // Drawing the Triangle Pointer
  void _layoutTriangleOffsets(
      Canvas canvas, Offset offset, RenderLinearGauge linearGauge) {
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    GaugeOrientation rulerOrientation = linearGauge.getGaugeOrientation;

    switch (rulerPosition) {
      case RulerPosition.bottom:
        offset = Offset(offset.dx, offset.dy - gaugeHeight);
        _drawTriangle(canvas, offset, 180);
        break;
      case RulerPosition.top:
        offset = Offset(offset.dx, offset.dy);
        _drawTriangle(canvas, offset, 0);
        break;
      case RulerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(offset.dx, offset.dy - gaugeHeight)
            : Offset(offset.dx - gaugeHeight, offset.dy);
        double angle =
            rulerOrientation == GaugeOrientation.horizontal ? 180 : 90;
        _drawTriangle(canvas, offset, angle);
        break;
      case RulerPosition.left:
        _drawTriangle(canvas, offset, -90);
        break;
      case RulerPosition.right:
        offset = Offset(offset.dx - gaugeHeight, offset.dy);
        _drawTriangle(canvas, offset, 90);
        break;
    }
  }

  void _drawTriangle(Canvas canvas, Offset vertex, double angle) {
    final paint = Paint();
    paint.color = color!;
    final base = width! / 2;

    final path = Path()..moveTo(vertex.dx, vertex.dy);
    path.lineTo(vertex.dx - base, vertex.dy + height!);
    path.lineTo(vertex.dx + base, vertex.dy + height!);
    path.close();

    canvas.save();
    // Move the canvas origin to the vertex point
    canvas.translate(vertex.dx, vertex.dy);
    canvas.rotate(pi * angle / 180);
    // Move the canvas origin back to the original point
    canvas.translate(-vertex.dx, -vertex.dy);
    canvas.drawPath(path, paint);
    // Restore the previous canvas state
    canvas.restore();
  }

  // Drawing the Diamond pointer
  void _layoutDiamondOffsets(
    Canvas canvas,
    Offset offset,
    RenderLinearGauge linearGauge,
  ) {
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    GaugeOrientation rulerOrientation = linearGauge.getGaugeOrientation;
    switch (rulerPosition) {
      case RulerPosition.bottom:
        offset = Offset(offset.dx, offset.dy - gaugeHeight - height! / 2);
        _drawDiamond(canvas, offset);
        break;
      case RulerPosition.top:
        offset = Offset(offset.dx, offset.dy + height! / 2);
        _drawDiamond(canvas, offset);
        break;
      case RulerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(offset.dx, offset.dy - gaugeHeight - height! / 2)
            : Offset(offset.dx - gaugeHeight - width! / 2, offset.dy);

        _drawDiamond(canvas, offset);
        break;
      case RulerPosition.left:
        offset = Offset(offset.dx + width! / 2, offset.dy);
        _drawDiamond(canvas, offset);
        break;
      case RulerPosition.right:
        offset = Offset(offset.dx - gaugeHeight - width! / 2, offset.dy);
        _drawDiamond(canvas, offset);
        break;
    }
  }

  _drawDiamond(
    Canvas canvas,
    Offset center,
  ) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(center.dx, center.dy - height! / 2);
    path.lineTo(center.dx + width! / 2, center.dy);
    path.lineTo(center.dx, center.dy + height! / 2);
    path.lineTo(center.dx - width! / 2, center.dy);
    path.close();

    canvas.drawPath(path, paint);
  }

  // Drawing the Arrow pointer
  void _drawArrowPointer(
    Canvas canvas,
    Offset offset,
    RenderLinearGauge linearGauge,
  ) {
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    Color pointerColor = linearGauge.getPointer.color!;
    double height = linearGauge.getPointer.height!;
    double width = linearGauge.getPointer.width!;
    double primaryRulerHeight = linearGauge.getPrimaryRulersHeight;
    // double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    final paint = Paint();
    paint.color = pointerColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();
    // late double yPos;

    if (rulerPosition == RulerPosition.bottom) {
      path.moveTo(position.dx - (width / 2), -height);
      path.lineTo(position.dx, position.dy - gaugeHeight);
      path.lineTo(position.dx + (width / 2), -height);
      path.lineTo(position.dx, position.dy - primaryRulerHeight + gaugeHeight);
    } else {
      path.moveTo(position.dx - (width / 2), height);
      path.lineTo(position.dx, position.dy - gaugeHeight);
      path.lineTo(position.dx + (width / 2), height);
      path.lineTo(position.dx, position.dy - primaryRulerHeight);
    }
    canvas.drawPath(path, paint);
  }

  double getAngle() {
    switch (quarterTurns) {
      case QuarterTurns.zero:
        return 0;
      case QuarterTurns.one:
        return 90;
      case QuarterTurns.two:
        return 180;
      case QuarterTurns.three:
        return 270;
      default:
        return 0;
    }
  }
}
