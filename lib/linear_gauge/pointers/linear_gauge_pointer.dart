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
    this.quaterTurns = QuaterTurns.zero,
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

  final QuaterTurns? quaterTurns;

  final TextStyle? labelStyle;

  get getPointerValue => value;
  set setPointerValue(double? value) => value = value;

  get getPointerColor => color;
  set setPointerColor(Color? color) => color = color;

  get getPointerShape => shape;
  set setPointerShape(PointerShape? shape) => shape = shape;

  /// Method to draw the pointer on the canvas based on the pointer shape
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
        _drawRectangle(canvas, offset, linearGauge);
        break;
      case PointerShape.triangle:
        _drawTrianglePointer(canvas, offset, linearGauge);
        break;
      case PointerShape.diamond:
        _drawDiamondPointer(canvas, offset, linearGauge);
        break;
      default:
        _drawCirclePointer(canvas, offset, linearGauge);
    }
  }

  // Method to draw the Text for Rectangle Pointer
  void _drawTextRectangle(
    Canvas canvas,
    TextSpan textSpan,
    TextPainter textPainter,
    Offset offset,
    QuaterTurns quaterTurns,
    RulerPosition rulerPosition,
  ) {
    double extraOffset = 4;
    Offset center;
    if (quaterTurns == QuaterTurns.zero) {
      rulerPosition == RulerPosition.top
          ? center = Offset(offset.dx, height! + extraOffset)
          : center = Offset(offset.dx, offset.dy);

      textPainter.paint(canvas, center);
    } else if (quaterTurns == QuaterTurns.two) {
      center = Offset(offset.dx + textPainter.width / 2,
          offset.dy + textPainter.height / 2);
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(180 * pi / 180);
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );
      canvas.restore();
    } else {
      center = rulerPosition == RulerPosition.top
          ? Offset(offset.dx + textPainter.width / 2,
              textPainter.height + height! + extraOffset * 2)
          : Offset(
              offset.dx + textPainter.width / 2,
              offset.dy +
                  textPainter.height / 2 -
                  textPainter.height / 2 -
                  extraOffset);
      canvas.save();
      canvas.translate(center.dx, center.dy);
      quaterTurns == QuaterTurns.three
          ? canvas.rotate(-90 * pi / 180)
          : canvas.rotate(90 * pi / 180);
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );
      canvas.restore();
    }

    // textPainter.paint(
    //   canvas,
    //   Offset(-textPainter.width / 2, -textPainter.height / 2),
    // );
    // canvas.restore();
  }

  // Method to draw the Text for  Pointers
  void _drawText(
    Canvas canvas,
    TextSpan textSpan,
    TextPainter textPainter,
    Offset offset,
    QuaterTurns quaterTurns,
    RulerPosition rulerPosition,
  ) {
    textPainter.text = textSpan;
    textPainter.layout();
    Offset center;

    if (quaterTurns == QuaterTurns.zero) {
      center = offset;
      textPainter.paint(canvas, center);
    } else if (quaterTurns == QuaterTurns.two) {
      center = Offset(offset.dx + textPainter.width / 2,
          offset.dy + textPainter.height / 2);
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(180 * pi / 180);
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );
      canvas.restore();
    } else {
      double extraOffset = 4;
      center = rulerPosition == RulerPosition.top
          ? Offset(offset.dx + textPainter.width / 2,
              offset.dy + textPainter.height + extraOffset)
          : Offset(
              offset.dx + textPainter.width / 2,
              offset.dy +
                  textPainter.height / 2 -
                  textPainter.height / 2 -
                  extraOffset);
      canvas.save();
      canvas.translate(center.dx, center.dy);
      quaterTurns == QuaterTurns.zero
          ? canvas.rotate(-90 * pi / 180)
          : canvas.rotate(90 * pi / 180);
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );
      canvas.restore();
    }

    // textPainter.paint(
    //   canvas,
    //   Offset(-textPainter.width / 2, -textPainter.height / 2),
    // );
    // canvas.restore();
  }

  void _drawCirclePointer(
      Canvas canvas, Offset offset, RenderLinearGauge linearGauge) {
    Color pointerColor = linearGauge.getPointer.color!;
    // double height = linearGauge.getPointer.height!;
    double width = linearGauge.getPointer.width!;
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    double primaryRulerHeight = linearGauge.getPrimaryRulersHeight;

    final paint = Paint();
    paint.color = pointerColor;
    late double yPos;
    linearGauge.getPointer;

    if (linearGauge.rulerPosition == RulerPosition.bottom) {
      yPos = offset.dy - ((width / 2) + gaugeHeight);
    } else if (rulerPosition == RulerPosition.center) {
      yPos = offset.dy - ((width / 2) + primaryRulerHeight / 2);
    } else {
      yPos = offset.dy + ((width / 2));
    }
    final position = Offset(offset.dx, yPos);
    canvas.drawCircle(position, width / 2, paint);

    if (showLabel) {
      final textSpan = TextSpan(
        text:
            value == null ? linearGauge.getValue.toString() : value.toString(),
        style: labelStyle ??
            TextStyle(
              color: getPointerColor,
              fontSize: 12,
            ),
      );

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      // Draw the text centered at the rotated canvas origin
      if (quaterTurns == QuaterTurns.zero) {
        textPainter.text = textSpan;
        textPainter.layout();
        final textOffset = Offset(position.dx - textPainter.width / 2,
            position.dy - textPainter.height / 2);

        textPainter.paint(canvas, textOffset);
      } else if (quaterTurns == QuaterTurns.two) {
        textPainter.text = textSpan;
        textPainter.layout();

        Offset center;
        center = position;

        canvas.save();

        canvas.translate(center.dx, center.dy);
        canvas.rotate(180 * pi / 180);
        textPainter.paint(
            canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));

        canvas.restore();
      } else {
        textPainter.text = textSpan;
        textPainter.layout();

        Offset center;
        center = position;

        canvas.save();

        canvas.translate(center.dx, center.dy);
        quaterTurns == QuaterTurns.three
            ? canvas.rotate(-90 * pi / 180)
            : canvas.rotate(90 * pi / 180);
        textPainter.paint(
            canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));

        canvas.restore();
      }
    }
  }

  void _drawTrianglePointer(
      Canvas canvas, Offset offset, RenderLinearGauge linearGauge) {
    Color pointerColor = linearGauge.getPointer.color!;
    double height = linearGauge.getPointer.height!;
    double width = linearGauge.getPointer.width!;
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    double primaryRulerHeight = linearGauge.getPrimaryRulersHeight;
    final paint = Paint();
    paint.color = pointerColor;

    late double yPos;
    if (rulerPosition == RulerPosition.top) {
      yPos = gaugeHeight + height;
    } else if (rulerPosition == RulerPosition.center) {
      yPos = -height + primaryRulerHeight / 2;
    } else {
      yPos = -height;
    }

    final position = Offset(offset.dx, offset.dy);
    final path = Path();
    path.moveTo(position.dx - (width / 2), yPos);
    path.lineTo(position.dx, position.dy - gaugeHeight);
    path.lineTo(position.dx + (width / 2), yPos);
    canvas.drawPath(path, paint);

    if (showLabel) {
      final textSpan = TextSpan(
        text:
            value == null ? linearGauge.getValue.toString() : value.toString(),
        style: labelStyle ??
            TextStyle(
              color: getPointerColor,
              fontSize: 12,
            ),
      );

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      Offset textOffset;
      if (rulerPosition == RulerPosition.bottom) {
        textOffset = Offset(position.dx - textPainter.width / 2,
            position.dy - height - gaugeHeight - textPainter.height);
      } else if (rulerPosition == RulerPosition.top) {
        textOffset = Offset(position.dx - textPainter.width / 2, yPos);
      } else {
        textOffset = Offset(position.dx - textPainter.width / 2,
            yPos - position.dy - textPainter.height + gaugeHeight);
      }

      _drawText(canvas, textSpan, textPainter, textOffset, quaterTurns!,
          rulerPosition);
    }
  }

  void _drawDiamondPointer(
    Canvas canvas,
    Offset offset,
    RenderLinearGauge linearGauge,
  ) {
    Color pointerColor = linearGauge.getPointer.color!;
    // double height = linearGauge.getPointer.height!;
    double width = linearGauge.getPointer.width!;
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;
    double primaryRulerHeight = linearGauge.getPrimaryRulersHeight;

    final paint = Paint();
    paint.color = pointerColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();

    if (rulerPosition == RulerPosition.bottom) {
      path.moveTo(position.dx - (width / 2), -width);
      path.lineTo(position.dx, position.dy - gaugeHeight);

      path.lineTo(position.dx + (width / 2), -width);
      path.lineTo(position.dx, offset.dy - width - width - gaugeHeight);
      path.close();
    } else if (rulerPosition == RulerPosition.center) {
      path.moveTo(position.dx - (width / 2), -width);
      path.lineTo(position.dx, position.dy - primaryRulerHeight / 2);
      path.lineTo(position.dx + (width / 2), -width);
      path.lineTo(position.dx, offset.dy - width - width - gaugeHeight);
      path.close();
    } else {
      path.moveTo(position.dx - (width / 2), offset.dy + width);
      path.lineTo(position.dx, position.dy);
      path.lineTo(position.dx + (width / 2), offset.dy + width);
      path.lineTo(position.dx, offset.dy + width + width - gaugeHeight);
      path.close();
    }

    canvas.drawPath(path, paint);

    if (showLabel) {
      final textSpan = TextSpan(
          text: value == null
              ? linearGauge.getValue.toString()
              : value.toString(),
          style: labelStyle ??
              TextStyle(
                color: getPointerColor,
                fontSize: 12,
              ));

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      Offset textOffset;
      if (rulerPosition == RulerPosition.top) {
        textOffset = Offset(position.dx - textPainter.width / 2,
            position.dy + (width * 2) - textPainter.height / 2 + gaugeHeight);
      } else {
        textOffset = Offset(position.dx - textPainter.width / 2,
            position.dy - (width * 2) - textPainter.height - gaugeHeight);
      }

      _drawText(canvas, textSpan, textPainter, textOffset, quaterTurns!,
          rulerPosition);
    }
  }

  void _drawRectangle(
      Canvas canvas, Offset offset, RenderLinearGauge linearGauge) {
    final paint = Paint()..color = linearGauge.getPointer.color!;
    double height = linearGauge.getPointer.height!;
    double width = linearGauge.getPointer.width!;
    double gaugeHeight = linearGauge.getLinearGaugeBoxDecoration.height;
    RulerPosition rulerPosition = linearGauge.rulerPosition;

    double yPos;
    if (rulerPosition == RulerPosition.top) {
      yPos = offset.dy;
    } else if (rulerPosition == RulerPosition.center) {
      yPos = offset.dy - height - (2 * gaugeHeight);
    } else {
      yPos = offset.dy - gaugeHeight - height;
    }

    double xPos = offset.dx - width / 2;

    final position = Offset(xPos / 2, yPos);
    final rectCenter = Offset(xPos + width / 2, yPos + height / 2);
    Rect pointerContainer = Rect.fromLTWH(xPos, position.dy, width, height);

    canvas.drawRect(pointerContainer, paint);

    // Drawing the TextLabel for the pointer
    if (showLabel) {
      final textSpan = TextSpan(
          text: value == null
              ? linearGauge.getValue.toString()
              : value.toString(),
          style: labelStyle ??
              TextStyle(
                color: getPointerColor,
                fontSize: 12,
              ));

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();
      Offset textOffset;
      rulerPosition == RulerPosition.top
          ? textOffset = Offset(rectCenter.dx - textPainter.width / 2,
              rectCenter.dy + textPainter.height * 2)
          : textOffset = Offset(
              rectCenter.dx - textPainter.width / 2, yPos - textPainter.height);

      _drawTextRectangle(canvas, textSpan, textPainter, textOffset,
          quaterTurns!, rulerPosition);
    }
  }

  @Deprecated('Use the other shapes  instead || Arrow doesnt support label')
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
}
