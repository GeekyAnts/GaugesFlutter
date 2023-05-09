import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/gauge_container/linear_gauge_container.dart';

import '../../../geekyants_flutter_gauges.dart';
import '../linear_gauge_label.dart';

class RenderLinearGaugeShapePointer extends RenderOpacity {
  RenderLinearGaugeShapePointer({
    Key? key,
    required double value,
    required double height,
    required Color color,
    required double width,
    required PointerShape shape,
    required bool showLabel,
    required QuarterTurns quarterTurns,
    required TextStyle labelStyle,
    required PointerPosition pointerPosition,
    required PointerAlignment pointerAlignment,
    required int animationDuration,
    required Curve animationType,
    required bool enableAnimation,
    required Animation<double> pointerAnimation,
    required LinearGauge linearGauge,
  })  : _value = value,
        _height = height,
        _color = color,
        _width = width,
        _shape = shape,
        _showLabel = showLabel,
        _quarterTurns = quarterTurns,
        _labelStyle = labelStyle,
        _pointerAlignment = pointerAlignment,
        _pointerPosition = pointerPosition,
        _linearGauge = linearGauge,
        _pointerAnimation = pointerAnimation,
        _enableAnimation = enableAnimation;

  double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;

  /// Gets the value to [RenderLinearGaugeShapePointer].
  double? get value => _value;
  double? _value;

  /// Sets the value for [RenderLinearGaugeShapePointer].
  set setValue(double? value) {
    if (value == _value) {
      return;
    }

    _value = value;
    markNeedsLayout();
  }

  set setLinearGAuge(LinearGauge linearGauge) {
    if (_linearGauge == linearGauge) {
      return;
    }
    _linearGauge = linearGauge;
    markNeedsPaint();
  }

  /// Gets the orientation to [RenderLinearGaugeShapePointer].
  GaugeOrientation? get orientation => _orientation;
  GaugeOrientation? _orientation;

  /// Sets the orientation for [RenderLinearGaugeShapePointer].
  ///
  /// Default value is [GaugeOrientation.horizontal].
  set setOrientation(GaugeOrientation? value) {
    if (value == _orientation) {
      return;
    }

    _orientation = value;
    markNeedsLayout();
  }

  /// Gets the shape assigned to [RenderLinearGaugeShapePointer].
  PointerShape? get shape => _shape;
  PointerShape? _shape;

  /// Sets the shape for [RenderLinearGaugeShapePointer].
  set setShape(PointerShape? value) {
    if (value == _shape) {
      return;
    }
    _shape = value;
    markNeedsPaint();
  }

  /// Gets the width assigned to [RenderLinearGaugeShapePointer].
  double get width => _width;
  double _width;

  /// Sets the width for [RenderLinearGaugeShapePointer].
  set setWidth(double value) {
    if (value == _width) {
      return;
    }

    _width = value;
    markNeedsLayout();
  }

  /// Gets the height assigned to [RenderLinearGaugeShapePointer].
  double get height => _height;
  double _height;

  /// Sets the height for [RenderLinearGaugeShapePointer].
  set setHeight(double value) {
    if (value == _height) {
      return;
    }

    _height = value;
    markNeedsLayout();
  }

  /// Gets the color assigned to [RenderLinearGaugeShapePointer].
  Color get color => _color;
  Color _color;

  /// Sets the color for [RenderLinearGaugeShapePointer].
  set setColor(Color value) {
    if (value == _color) {
      return;
    }

    _color = value;
    markNeedsPaint();
  }

  /// Gets the showLabel assigned to [RenderLinearGaugeShapePointer].
  bool get showLabel => _showLabel;
  bool _showLabel;

  /// Sets the showLabel for [RenderLinearGaugeShapePointer].
  set setShowLabel(bool value) {
    if (value == _showLabel) {
      return;
    }

    _showLabel = value;
    markNeedsPaint();
  }

  /// Gets the quarterTurns assigned to [RenderLinearGaugeShapePointer].
  QuarterTurns get quarterTurns => _quarterTurns;
  QuarterTurns _quarterTurns;

  /// Sets the quarterTurns for [RenderLinearGaugeShapePointer].
  set setQuarterTurns(QuarterTurns value) {
    if (value == _quarterTurns) {
      return;
    }

    _quarterTurns = value;
    markNeedsPaint();
  }

  /// Gets the labelStyle assigned to [RenderLinearGaugeShapePointer].
  TextStyle get labelStyle => _labelStyle;
  TextStyle _labelStyle;

  /// Sets the labelStyle for [RenderLinearGaugeShapePointer].
  set setLabelStyle(TextStyle value) {
    if (value == _labelStyle) {
      return;
    }

    _labelStyle = value;
    markNeedsPaint();
  }

  /// Gets the pointerPosition assigned to [RenderLinearGaugeShapePointer].
  PointerPosition get pointerPosition => _pointerPosition;
  PointerPosition _pointerPosition;

  /// Sets the pointerPosition for [RenderLinearGaugeShapePointer].
  set setPointerPosition(PointerPosition value) {
    if (value == _pointerPosition) {
      return;
    }

    _pointerPosition = value;
    markNeedsPaint();
  }

  /// Gets the pointerAlignment assigned to [RenderLinearGaugeShapePointer].
  PointerAlignment get pointerAlignment => _pointerAlignment;
  PointerAlignment _pointerAlignment;

  /// Sets the pointerAlignment for [RenderLinearGaugeShapePointer].
  set setPointerAlignment(PointerAlignment value) {
    if (value == _pointerAlignment) {
      return;
    }

    _pointerAlignment = value;
    markNeedsPaint();
  }

  /// Gets the pointerAlignment assigned to [RenderLinearGaugeShapePointer].
  bool get enableAnimation => _enableAnimation;
  bool _enableAnimation;

  LinearGauge get linearGauge => _linearGauge;
  LinearGauge _linearGauge;

  /// Sets the pointerAlignment for [RenderLinearGaugeShapePointer].
  set setEnableAnimation(bool value) {
    if (value == _enableAnimation) {
      return;
    }

    _enableAnimation = value;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [pointerAnimation] parameter.
  ///
  Animation<double> get getPointerAnimation => _pointerAnimation;
  Animation<double> _pointerAnimation;
  set setPointerAnimation(Animation<double> val) {
    if (_pointerAnimation == val) return;
    _pointerAnimation = val;
    _removeAnimationListeners();
    _addAnimationListener();
    markNeedsLayout();
  }

  void _addAnimationListener() {
    _pointerAnimation.addListener(markNeedsPaint);
  }

  void _removeAnimationListeners() {
    _pointerAnimation.removeListener(markNeedsPaint);
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _addAnimationListener();
  }

  @override
  void detach() {
    _removeAnimationListeners();
    super.detach();
  }

  @override
  void performLayout() {
    if (shape == PointerShape.triangle &&
        linearGauge.gaugeOrientation == GaugeOrientation.vertical) {
      size = Size(height, width);
    } else if (shape == PointerShape.circle &&
        linearGauge.gaugeOrientation == GaugeOrientation.vertical) {
      size = Size(height, width);
    } else {
      size = Size(width, height);
    }
  }

  /// Method to draw the pointer on the canvas based on the pointer shape
  void drawPointer(PointerShape? shape, Canvas canvas, double start, double end,
      Offset offset, LinearGauge linearGauge, PaintingContext context) {
    if (linearGauge.gaugeOrientation == GaugeOrientation.horizontal) {
      if (pointerPosition != PointerPosition.bottom &&
          pointerPosition != PointerPosition.center &&
          pointerPosition != PointerPosition.top) {
        throw ArgumentError(
            'Invalid pointer position: $pointerPosition. For a horizontal gauge, pointer should be positioned at top, bottom, or center.');
      }
    } else {
      if (pointerPosition != PointerPosition.left &&
          pointerPosition != PointerPosition.center &&
          pointerPosition != PointerPosition.right) {
        throw ArgumentError(
            'Invalid pointer position: $pointerPosition. For a vertical gauge, pointer should be positioned at left, right, or center.');
      }
    }

    RulerPosition rulerPosition = linearGauge.rulers!.rulerPosition!;
    GaugeOrientation gaugeOrientation = linearGauge.gaugeOrientation!;
    final paint = Paint();
    paint.color = color;
    double endValue = linearGauge.end!;
    double startValue = linearGauge.start!;
    double totalWidth = end;
    bool isInversedRulers = linearGauge.rulers!.inverseRulers!;

    double valueInPX = !isInversedRulers
        ? (value! - startValue) /
            (endValue - startValue) *
            (totalWidth - 2 * linearGauge.extendLinearGauge!)
        : (value! - endValue) /
            (startValue - endValue) *
            (totalWidth - 2 * linearGauge.extendLinearGauge!);

    Offset hOffset =
        Offset(valueInPX + start + linearGauge.extendLinearGauge!, offset.dy);

    Offset vOffset = isInversedRulers
        ? Offset(offset.dx,
            offset.dy + (end - valueInPX - 2 * linearGauge.extendLinearGauge!))
        : Offset(offset.dx, (offset.dy - valueInPX));

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
      _drawLabel(canvas, labelOffset, quarterTurns, rulerPosition, linearGauge);
    }
  }

  // Method to draw the Text for  Pointers
  void _drawLabel(Canvas canvas, Offset offset, QuarterTurns quarterTurns,
      RulerPosition rulerPosition, LinearGauge linearGauge) {
    double gaugeThickness = linearGauge.linearGaugeBoxDecoration!.thickness!;
    GaugeOrientation gaugeOrientation = linearGauge.gaugeOrientation!;

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.text = TextSpan(
        text: value == null ? linearGauge.value!.toString() : value.toString(),
        style: labelStyle);

    textPainter.layout();
    if (shape == PointerShape.circle) {
      if (gaugeOrientation == GaugeOrientation.horizontal) {
        switch (pointerPosition) {
          case PointerPosition.top:
            var yAxisTurn = (quarterTurns == QuarterTurns.zero ||
                    quarterTurns == QuarterTurns.two)
                ? textPainter.height / 2
                : textPainter.width / 2;
            offset = Offset(
                offset.dx,
                (offset.dy - height - gaugeThickness - yAxisTurn) +
                    yAxisForGaugeContainer);
            break;
          case PointerPosition.bottom:
            var yAxisTurn = (quarterTurns == QuarterTurns.zero ||
                    quarterTurns == QuarterTurns.two)
                ? textPainter.height / 2
                : textPainter.width / 2;
            offset = Offset(offset.dx,
                offset.dy + height + yAxisTurn + yAxisForGaugeContainer);
            break;
          default:
            offset = Offset(offset.dx,
                (offset.dy - gaugeThickness / 2) + yAxisForGaugeContainer);
        }
      } else {
        switch (pointerPosition) {
          case PointerPosition.right:
            var xAxisTurn = (quarterTurns == QuarterTurns.zero ||
                    quarterTurns == QuarterTurns.two)
                ? textPainter.width / 2
                : textPainter.height / 2;
            offset = Offset(
                offset.dx + height + xAxisTurn + xAxisForGaugeContainer,
                offset.dy);
            break;
          case PointerPosition.left:
            var xAxisTurn = (quarterTurns == QuarterTurns.zero ||
                    quarterTurns == QuarterTurns.two)
                ? textPainter.width / 2
                : textPainter.height / 2;
            offset = Offset(
                (offset.dx - height - gaugeThickness - xAxisTurn) +
                    xAxisForGaugeContainer,
                offset.dy);
            break;
          default:
            offset = Offset(
                offset.dx - gaugeThickness / 2 + xAxisForGaugeContainer,
                offset.dy);
        }
      }
      switch (pointerAlignment) {
        case PointerAlignment.start:
          offset =
              (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
                  ? Offset(offset.dx - height / 2, offset.dy)
                  : Offset(offset.dx, offset.dy - height / 2);
          break;
        case PointerAlignment.end:
          offset =
              (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
                  ? Offset(offset.dx + height / 2, offset.dy)
                  : Offset(offset.dx, offset.dy + height / 2);

          break;
        default:
          break;
      }

      offset = applyAnimations(linearGauge, offset);

      double textWidth = textPainter.width / 2;
      double textHeight = textPainter.height / 2;
      // Rotated Text paint
      void paintRotated(Canvas canvas, TextPainter textPainter, Offset center,
          double degrees) {
        canvas.save();
        canvas.translate(center.dx, center.dy);
        canvas.rotate(degrees * pi / 180);
        textPainter.paint(canvas, Offset(-textWidth, -textHeight));
        canvas.restore();
      }

      // Draw the text centered at the rotated canvas origin
      switch (quarterTurns) {
        case QuarterTurns.zero:
          final textOffset =
              Offset(offset.dx - textWidth, offset.dy - textHeight);
          textPainter.paint(canvas, textOffset);
          break;

        case QuarterTurns.two:
          paintRotated(canvas, textPainter, offset, 180);
          break;

        case QuarterTurns.one:
          paintRotated(canvas, textPainter, offset, 90);
          break;

        case QuarterTurns.three:
          paintRotated(canvas, textPainter, offset, -90);
          break;

        default:
          break;
      }
    } else {
      double textWidth = textPainter.width / 2;
      double textHeight = textPainter.height / 2;

      offset = applyAnimations(linearGauge, offset);

      switch (pointerPosition) {
        case PointerPosition.top:
          var yAxisTurn = (quarterTurns == QuarterTurns.zero ||
                  quarterTurns == QuarterTurns.two)
              ? textPainter.height
              : textPainter.height;
          offset = Offset(
              offset.dx - textWidth,
              (offset.dy - height - gaugeThickness - yAxisTurn) +
                  yAxisForGaugeContainer);
          break;
        case PointerPosition.bottom:
          var yAxisTurn = (quarterTurns == QuarterTurns.zero ||
                  quarterTurns == QuarterTurns.two)
              ? 0
              : textWidth / 2;
          offset = Offset(offset.dx - textWidth,
              gaugeThickness + height + yAxisTurn + yAxisForGaugeContainer);
          break;
        case PointerPosition.center:
          var yAxisTurn = (quarterTurns == QuarterTurns.zero ||
                  quarterTurns == QuarterTurns.two)
              ? textHeight
              : textWidth / 2;
          gaugeOrientation == GaugeOrientation.horizontal
              ? offset = Offset(
                  offset.dx - textWidth,
                  (offset.dy - gaugeThickness / 2 - yAxisTurn) +
                      yAxisForGaugeContainer)
              : offset = Offset(
                  offset.dx -
                      gaugeThickness / 2 -
                      yAxisTurn * 2 +
                      xAxisForGaugeContainer,
                  offset.dy - textHeight);
          break;
        case PointerPosition.left:
          var xAxisTurn = (quarterTurns == QuarterTurns.zero ||
                  quarterTurns == QuarterTurns.two)
              ? textWidth * 2
              : textHeight * 2;

          var isTriangle = (shape == PointerShape.triangle) ? height : width;

          offset = Offset(xAxisForGaugeContainer - isTriangle - xAxisTurn,
              offset.dy - textHeight);
          break;
        case PointerPosition.right:
          var xAxisTurn = (quarterTurns == QuarterTurns.zero ||
                  quarterTurns == QuarterTurns.two)
              ? 0
              : -textHeight;
          var isTriangle = (shape == PointerShape.triangle) ? height : width;

          offset = Offset(
              xAxisForGaugeContainer + gaugeThickness + isTriangle + xAxisTurn,
              offset.dy - textHeight);
          break;

        default:
      }

      switch (pointerAlignment) {
        case PointerAlignment.start:
          var isTriangle = (shape == PointerShape.triangle) ? height : width;

          offset =
              (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
                  ? Offset(offset.dx - height, offset.dy)
                  : Offset(offset.dx, offset.dy - isTriangle);
          break;
        case PointerAlignment.end:
          var isTriangle = (shape == PointerShape.triangle) ? height : width;

          offset =
              (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
                  ? Offset(offset.dx + height, offset.dy)
                  : Offset(offset.dx, offset.dy + isTriangle);

          break;
        default:
          break;
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

  Offset applyAnimations(LinearGauge linearGauge, Offset offset) {
    if (enableAnimation && getPointerAnimation.value > 0) {
      double animationValue = getPointerAnimation.value;

      double endPoint =
          (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
              ? offset.dx
              : offset.dy;

      double animatedAxisPoint =
          getAnimatedAxisPoint(endPoint, animationValue, linearGauge);
      offset = (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
          ? Offset(animatedAxisPoint, offset.dy)
          : Offset(offset.dx, animatedAxisPoint);
    }
    return offset;
  }

  double getAnimatedAxisPoint(
      double endPoint, double animationValue, LinearGauge linearGauge) {
    Offset startPointOffset =
        LinearGaugeLabel.primaryRulers[linearGauge.start.toString()]!.first;
    double startPoint =
        (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? startPointOffset.dx
            : startPointOffset.dy;
    return startPoint + ((endPoint - startPoint) * animationValue);
  }

  void _layoutCircleOffsets(
      Canvas canvas, Offset offset, LinearGauge linearGauge) {
    double gaugeThickness = linearGauge.linearGaugeBoxDecoration!.thickness!;
    GaugeOrientation orientation = linearGauge.gaugeOrientation!;

    switch (pointerPosition) {
      case PointerPosition.top:
        offset = Offset(offset.dx,
            (offset.dy - height / 2 - gaugeThickness) + yAxisForGaugeContainer);
        break;
      case PointerPosition.bottom:
        offset = Offset(
            offset.dx, (offset.dy + height / 2) + yAxisForGaugeContainer);
        break;
      case PointerPosition.center:
        offset = orientation == GaugeOrientation.horizontal
            ? Offset(offset.dx,
                (offset.dy - gaugeThickness / 2) + yAxisForGaugeContainer)
            : Offset(offset.dx - gaugeThickness / 2 + xAxisForGaugeContainer,
                offset.dy);
        break;
      case PointerPosition.right:
        offset =
            Offset(offset.dx + height / 2 + xAxisForGaugeContainer, offset.dy);
        break;
      case PointerPosition.left:
        offset = Offset(
            offset.dx - height / 2 - gaugeThickness + xAxisForGaugeContainer,
            offset.dy);
        break;
      default:
        break;
    }
    _drawCircle(canvas, offset, linearGauge);
  }

  _drawCircle(Canvas canvas, Offset offset, LinearGauge linearGauge) {
    Offset center = Offset(offset.dx, offset.dy);
    final paint = Paint()..color = color;
    paint.color = color;

    switch (pointerAlignment) {
      case PointerAlignment.start:
        center = (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? Offset(center.dx - height / 2, center.dy)
            : Offset(center.dx, center.dy - height / 2);
        break;
      case PointerAlignment.end:
        center = (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? Offset(center.dx + height / 2, center.dy)
            : Offset(center.dx, center.dy + height / 2);

        break;
      default:
        break;
    }

    center = applyAnimations(linearGauge, center);

    canvas.drawCircle(center, height / 2, paint);
  }

  // Drawing the Rectangle Pointer
  void _layoutRectangleOffsets(
      Canvas canvas, Offset offset, LinearGauge linearGauge) {
    double gaugeThickness = linearGauge.linearGaugeBoxDecoration!.thickness!;
    GaugeOrientation rulerOrientation = linearGauge.gaugeOrientation!;
    switch (pointerPosition) {
      case PointerPosition.top:
        offset = Offset(offset.dx,
            (offset.dy - height / 2 - gaugeThickness) + yAxisForGaugeContainer);
        break;
      case PointerPosition.bottom:
        offset = Offset(
            offset.dx, (offset.dy + height / 2) + yAxisForGaugeContainer);
        break;
      case PointerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(offset.dx,
                (offset.dy - gaugeThickness / 2) + yAxisForGaugeContainer)
            : Offset(offset.dx - gaugeThickness / 2 + xAxisForGaugeContainer,
                offset.dy);
        break;
      case PointerPosition.right:
        offset =
            Offset(offset.dx + width / 2 + xAxisForGaugeContainer, offset.dy);
        break;
      case PointerPosition.left:
        offset = Offset(
            offset.dx - width / 2 - gaugeThickness + xAxisForGaugeContainer,
            offset.dy);
        break;
      default:
        break;
    }
    _drawRectangle(canvas, offset, linearGauge);
  }

  _drawRectangle(Canvas canvas, Offset offset, LinearGauge linearGauge) {
    final paint = Paint()..color = color;
    offset = Offset(offset.dx, offset.dy);

    switch (pointerAlignment) {
      case PointerAlignment.start:
        offset = (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? Offset(offset.dx - width / 2, offset.dy)
            : Offset(offset.dx, offset.dy - height / 2);
        break;
      case PointerAlignment.end:
        offset = (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? Offset(offset.dx + width / 2, offset.dy)
            : Offset(offset.dx, offset.dy + height / 2);

        break;
      default:
        break;
    }

    offset = applyAnimations(linearGauge, offset);

    Rect rect = Rect.fromCenter(center: offset, width: width, height: height);

    canvas.drawRect(rect, paint);
  }

  // Drawing the Triangle Pointer
  void _layoutTriangleOffsets(
      Canvas canvas, Offset offset, LinearGauge linearGauge) {
    double gaugeThickness = linearGauge.linearGaugeBoxDecoration!.thickness!;
    GaugeOrientation rulerOrientation = linearGauge.gaugeOrientation!;

    switch (pointerPosition) {
      case PointerPosition.top:
        offset = Offset(
            offset.dx, offset.dy - gaugeThickness + yAxisForGaugeContainer);
        _drawTriangle(canvas, offset, 180, linearGauge);
        break;
      case PointerPosition.bottom:
        offset = Offset(offset.dx, offset.dy + yAxisForGaugeContainer);
        _drawTriangle(canvas, offset, 0, linearGauge);
        break;
      case PointerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(
                offset.dx,
                offset.dy +
                    (height / 2 - gaugeThickness / 2) +
                    yAxisForGaugeContainer)
            : Offset(
                offset.dx +
                    height / 2 -
                    gaugeThickness / 2 +
                    xAxisForGaugeContainer,
                offset.dy);
        double angle =
            rulerOrientation == GaugeOrientation.horizontal ? 180 : 90;
        _drawTriangle(canvas, offset, angle, linearGauge);
        break;
      case PointerPosition.right:
        offset = Offset(offset.dx + xAxisForGaugeContainer, offset.dy);
        _drawTriangle(canvas, offset, -90, linearGauge);
        break;
      case PointerPosition.left:
        offset = Offset(
            offset.dx - gaugeThickness + xAxisForGaugeContainer, offset.dy);
        _drawTriangle(canvas, offset, 90, linearGauge);
        break;
      default:
        break;
    }
  }

  void _drawTriangle(
      Canvas canvas, Offset vertex, double angle, LinearGauge linearGauge) {
    Offset center = vertex;

    final paint = Paint();
    paint.color = color;
    final base = width / 2;

    switch (pointerAlignment) {
      case PointerAlignment.start:
        if (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal) {
          center = Offset(center.dx - base, center.dy);
        } else {
          center = Offset(center.dx, center.dy - base);
        }
        break;
      case PointerAlignment.end:
        (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? center = Offset(center.dx + base, center.dy)
            : center = Offset(center.dx, center.dy + base);

        break;
      default:
        break;
    }

    center = applyAnimations(linearGauge, center);

    final path = Path();

    path
      ..moveTo(center.dx, center.dy)
      ..lineTo((center.dx - base), center.dy + height)
      ..lineTo((center.dx + base), center.dy + height)
      ..close();

    canvas.save();

    /// Move the canvas origin to the vertex point
    canvas.translate(center.dx, center.dy);
    canvas.rotate(pi * angle / 180);
    canvas.translate(-center.dx, -center.dy);

    canvas.drawPath(path, paint);

    // Restore the previous canvas state
    canvas.restore();
  }

  // Drawing the Diamond pointer
  void _layoutDiamondOffsets(
    Canvas canvas,
    Offset offset,
    LinearGauge linearGauge,
  ) {
    double gaugeThickness = linearGauge.linearGaugeBoxDecoration!.thickness!;
    GaugeOrientation rulerOrientation = linearGauge.gaugeOrientation!;
    switch (pointerPosition) {
      case PointerPosition.top:
        offset = Offset(offset.dx,
            (offset.dy - gaugeThickness - height / 2) + yAxisForGaugeContainer);
        break;
      case PointerPosition.bottom:
        offset =
            Offset(offset.dx, offset.dy + height / 2 + yAxisForGaugeContainer);
        break;
      case PointerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(offset.dx,
                offset.dy - gaugeThickness / 2 + yAxisForGaugeContainer)
            : Offset(offset.dx - gaugeThickness / 2 + xAxisForGaugeContainer,
                offset.dy);

        break;
      case PointerPosition.right:
        offset =
            Offset(offset.dx + width / 2 + xAxisForGaugeContainer, offset.dy);
        break;
      case PointerPosition.left:
        offset = Offset(
            offset.dx - gaugeThickness - width / 2 + xAxisForGaugeContainer,
            offset.dy);
        break;
      default:
        break;
    }
    _drawDiamond(canvas, offset, linearGauge);
  }

  _drawDiamond(Canvas canvas, Offset center, LinearGauge linearGauge) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    switch (pointerAlignment) {
      case PointerAlignment.start:
        (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? center = Offset(center.dx - width / 2, center.dy)
            : center = Offset(center.dx, center.dy - height / 2);
        break;
      case PointerAlignment.end:
        (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? center = Offset(center.dx + width / 2, center.dy)
            : center = (Offset(center.dx, center.dy + height / 2));

        break;
      default:
        break;
    }

    center = applyAnimations(linearGauge, center);

    final path = Path();

    path.moveTo(center.dx, center.dy - height / 2);
    path.lineTo((center.dx + width / 2), center.dy);
    path.lineTo(center.dx, center.dy + height / 2);
    path.lineTo((center.dx - width / 2), center.dy);
    path.close();

    canvas.drawPath(path, paint);
  }

  // Drawing the Arrow pointer
  // ignore: unused_element
  void _drawArrowPointer(
    Canvas canvas,
    Offset offset,
    LinearGauge linearGauge,
  ) {
    double gaugeThickness = linearGauge.linearGaugeBoxDecoration!.thickness!;

    Color pointerColor = color;
    double pointerHeight = height;
    double pointerWidth = width;
    double primaryRulerHeight = linearGauge.rulers!.primaryRulersHeight!;
    RulerPosition rulerPosition = linearGauge.rulers!.rulerPosition!;
    final paint = Paint();
    paint.color = pointerColor;

    final position = Offset(offset.dx, offset.dy);
    final path = Path();
    // late double yPos;

    if (rulerPosition == RulerPosition.bottom) {
      path.moveTo(position.dx - (pointerWidth / 2), -pointerHeight);
      path.lineTo(position.dx, position.dy - gaugeThickness);
      path.lineTo(position.dx + (pointerWidth / 2), -pointerHeight);
      path.lineTo(
          position.dx, position.dy - primaryRulerHeight + gaugeThickness);
    } else {
      path.moveTo(position.dx - (pointerWidth / 2), pointerHeight);
      path.lineTo(position.dx, position.dy - gaugeThickness);
      path.lineTo(position.dx + (pointerWidth / 2), pointerHeight);
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

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    xAxisForGaugeContainer = offset.dx;
    yAxisForGaugeContainer = offset.dy;

    var verticalFirstOffset =
        LinearGaugeLabel.primaryRulers[linearGauge.start.toString()]!;
    Offset vert = verticalFirstOffset.first;
    if (getPointerAnimation.value > 0) {
      drawPointer(shape, canvas, RenderLinearGaugeContainer.gaugeStart,
          RenderLinearGaugeContainer.gaugeEnd, vert, linearGauge, context);
    }
  }
}
