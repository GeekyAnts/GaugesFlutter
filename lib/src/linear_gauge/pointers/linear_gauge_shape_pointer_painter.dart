import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../geekyants_flutter_gauges.dart';
import '../linear_gauge_label.dart';
import '../linear_gauge_painter.dart';

class RenderLinearGaugeShapePointer extends RenderOpacity {
  RenderLinearGaugeShapePointer({
    Key? key,
    required double value,
    required double height,
    required Color color,
    required double width,
    required PointerShape shape,
    required bool showLabel,
    required ValueChanged<double>? onChanged,
    required QuarterTurns quarterTurns,
    required TextStyle labelStyle,
    required PointerPosition pointerPosition,
    required PointerAlignment pointerAlignment,
    required int animationDuration,
    required Curve animationType,
    required bool enableAnimation,
    required bool isInteractive,
    required Animation<double> pointerAnimation,
    required LinearGauge linearGauge,
    required String Function(double? value)? labelFormatter,
  })  : _value = value,
        _height = height,
        _onChanged = onChanged,
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
        _isInteractive = isInteractive,
        _enableAnimation = enableAnimation,
        _labelFormatter = labelFormatter;

  double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;
  late LinearGaugeLabel linearGaugeLabel;

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

  /// Gets and sets the onChanged assigned to [RenderLinearPointerBase].
  ValueChanged<double>? get onChanged => _onChanged;
  ValueChanged<double>? _onChanged;
  set onChanged(ValueChanged<double>? value) {
    if (value == _onChanged) {
      return;
    }
    _onChanged = value;
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

  // Sets the Interaction for [RenderLinearGaugeShapePointer].
  set setIsInteractive(bool value) {
    if (value == _isInteractive) {
      return;
    }

    _isInteractive = value;
    markNeedsPaint();
  }

  /// Gets the Interaction assigned to [RenderLinearGaugeShapePointer].
  bool get isInteractive => _isInteractive;
  bool _isInteractive;

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

  /// Gets the labelFormatter assigned to [RenderLinearGaugeShapePointer].
  String Function(double? value)? get labelFormatter => _labelFormatter;
  String Function(double? value)? _labelFormatter;

  /// Sets the labelFormatter for [RenderLinearGaugeShapePointer].
  set setLabelFormatter(String Function(double? value)? value) {
    if (value == _labelFormatter) {
      return;
    }

    _labelFormatter = value;
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

  double getStart() {
    if (linearGauge.customLabels!.isNotEmpty) {
      return linearGauge.customLabels!.first.value!;
    }
    return linearGauge.start!;
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
    } else if (shape == PointerShape.circle) {
      size = Size(height, height);
    } else {
      size = Size(width, height);
    }
  }

  /// Method to draw the pointer on the canvas based on the pointer shape
  void drawPointer(PointerShape? shape, Canvas canvas, LinearGauge linearGauge,
      Offset offset) {
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
    switch (shape) {
      case PointerShape.circle:
        _drawCircle(canvas, offset, linearGauge);

        break;
      case PointerShape.rectangle:
        _drawRectangle(canvas, offset, linearGauge);

        break;
      case PointerShape.triangle:
        _drawTriangle(canvas, offset, linearGauge);
        break;
      case PointerShape.diamond:
        _drawDiamond(canvas, offset, linearGauge);
        break;
      default:
        return;
    }

    if (showLabel || labelFormatter != null) {
      _drawLabel(canvas, offset, quarterTurns, rulerPosition, linearGauge);
    }
  }

  // Method to draw the Text for  Pointers
  void _drawLabel(Canvas canvas, Offset offset, QuarterTurns quarterTurns,
      RulerPosition rulerPosition, LinearGauge linearGauge) {
    GaugeOrientation gaugeOrientation = linearGauge.gaugeOrientation!;

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    // Attempt to get the custom label value,
    // if null fallback on the standard value.
    final String pointerText = value != null
        ? (labelFormatter?.call(value) ?? value.toString())
        : linearGauge.value!.toString();

    textPainter.text = TextSpan(text: pointerText, style: labelStyle);
    offset = applyAnimations(linearGauge, offset);
    textPainter.layout();
    if (shape == PointerShape.circle) {
      if (gaugeOrientation == GaugeOrientation.horizontal) {
        var yAxisTurn = (quarterTurns == QuarterTurns.zero ||
                quarterTurns == QuarterTurns.two)
            ? textPainter.height / 2
            : textPainter.width / 2;
        switch (pointerPosition) {
          case PointerPosition.top:
            offset = Offset(offset.dx + height / 2, offset.dy - yAxisTurn);
            break;
          case PointerPosition.bottom:
            offset =
                Offset(offset.dx + height / 2, offset.dy + height + yAxisTurn);
            break;
          default:
            offset = Offset(offset.dx + height / 2, offset.dy - yAxisTurn);
        }
      } else {
        var xAxisTurn = (quarterTurns == QuarterTurns.zero ||
                quarterTurns == QuarterTurns.two)
            ? textPainter.width / 2
            : textPainter.height / 2;
        switch (pointerPosition) {
          case PointerPosition.right:
            offset =
                Offset(offset.dx + height + xAxisTurn, offset.dy + height / 2);
            break;
          case PointerPosition.left:
            offset = Offset(offset.dx - xAxisTurn, offset.dy + height / 2);
            break;
          default:
            offset = Offset(offset.dx - xAxisTurn, offset.dy + height / 2);
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
              : textPainter.width;
          offset =
              Offset(offset.dx - textWidth + width / 2, offset.dy - yAxisTurn);
          break;
        case PointerPosition.bottom:
          var yAxisTurn = (quarterTurns == QuarterTurns.zero ||
                  quarterTurns == QuarterTurns.two)
              ? textHeight / 2
              : textWidth / 2;
          offset = Offset(offset.dx - textWidth + width / 2,
              offset.dy + height + yAxisTurn);
          break;
        case PointerPosition.center:
          var yAxisTurn = 0.0;
          if (gaugeOrientation == GaugeOrientation.horizontal) {
            yAxisTurn = (quarterTurns == QuarterTurns.zero ||
                    quarterTurns == QuarterTurns.two)
                ? textHeight * 2
                : textWidth * 2;
          } else {
            yAxisTurn = (quarterTurns == QuarterTurns.zero ||
                    quarterTurns == QuarterTurns.two)
                ? textHeight * 2
                : textWidth;
          }
          gaugeOrientation == GaugeOrientation.horizontal
              ? offset = Offset(
                  offset.dx - textWidth + width / 2, (offset.dy - yAxisTurn))
              : offset = Offset(offset.dx - yAxisTurn * 2,
                  offset.dy - textHeight + height / 2);
          break;
        case PointerPosition.left:
          var xAxisTurn = (quarterTurns == QuarterTurns.zero ||
                  quarterTurns == QuarterTurns.two)
              ? textWidth * 2
              : textHeight * 3;

          offset = Offset(
              offset.dx - xAxisTurn, offset.dy - textHeight + height / 2);
          break;
        case PointerPosition.right:
          var xAxisTurn = (quarterTurns == QuarterTurns.zero ||
                  quarterTurns == QuarterTurns.two)
              ? 0
              : -textHeight;

          offset = Offset(offset.dx + width + xAxisTurn,
              offset.dy - textHeight + height / 2);
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
        linearGaugeLabel.primaryRulers[getStart().toString()]!.first;
    double startPoint =
        (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? startPointOffset.dx
            : startPointOffset.dy;
    return startPoint + ((endPoint - startPoint) * animationValue);
  }

  _drawCircle(Canvas canvas, Offset offset, LinearGauge linearGauge) {
    final paint = Paint()..color = color;
    paint.color = color;

    offset = applyAnimations(linearGauge, offset);
    Rect rect = Rect.fromLTWH(offset.dx, offset.dy, height, height);
    Path path = Path();
    path.addOval(rect);

    canvas.drawPath(path, paint);
  }

  // Drawing the Rectangle Pointer
  _drawRectangle(Canvas canvas, Offset offset, LinearGauge linearGauge) {
    final paint = Paint()..color = color;

    offset = applyAnimations(linearGauge, offset);

    Rect rect = Rect.fromLTWH(offset.dx, offset.dy, width, height);

    canvas.drawRect(rect, paint);
  }

  void _drawTriangle(Canvas canvas, Offset vertex, LinearGauge linearGauge) {
    Offset center = vertex;

    final paint = Paint();
    paint.color = color;

    center = applyAnimations(linearGauge, center);

    Rect rect = Rect.fromLTWH(center.dx, center.dy, width, height);

    final path = Path();

    switch (pointerPosition) {
      case PointerPosition.top:
        path.moveTo(rect.left, rect.top);
        path.lineTo(rect.left + rect.width, rect.top);
        path.lineTo(rect.left + (rect.width / 2), rect.top + rect.height);
        path.close();
        break;
      case PointerPosition.bottom:
        path.moveTo(rect.left + (rect.width / 2), rect.top);
        path.lineTo(rect.left, rect.top + rect.height);
        path.lineTo(rect.left + rect.width, rect.top + rect.height);
        path.close();
        break;
      case PointerPosition.center:
        if (linearGauge.gaugeOrientation == GaugeOrientation.horizontal) {
          path.moveTo(rect.left, rect.top);
          path.lineTo(rect.left + rect.width, rect.top);
          path.lineTo(rect.left + (rect.width / 2), rect.top + rect.height);
          path.close();
        } else {
          path.moveTo(rect.left, rect.top);
          path.lineTo(rect.left + rect.height, rect.top + (rect.width / 2));
          path.lineTo(rect.left, rect.top + rect.width);
          path.close();
        }
        break;
      case PointerPosition.right:
        path.moveTo(rect.left, rect.top + (rect.width / 2));
        path.lineTo(rect.left + rect.height, rect.top);
        path.lineTo(rect.left + rect.height, rect.top + rect.width);
        path.close();

        break;
      case PointerPosition.left:
        path.moveTo(rect.left, rect.top);
        path.lineTo(rect.left + rect.height, rect.top + (rect.width / 2));
        path.lineTo(rect.left, rect.top + rect.width);
        path.close();
        break;
      default:
        break;
    }

    canvas.drawPath(path, paint);
  }

  // Drawing the Diamond pointer

  _drawDiamond(Canvas canvas, Offset center, LinearGauge linearGauge) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    center = applyAnimations(linearGauge, center);
    Rect rect = Rect.fromLTWH(center.dx, center.dy, width, height);

    final path = Path();

    path.moveTo(rect.left + rect.width / 2.0, rect.top);
    path.lineTo(rect.left, rect.top + rect.height / 2.0);
    path.lineTo(rect.left + rect.width / 2.0, rect.top + rect.height);
    path.lineTo(rect.left + rect.width, rect.top + rect.height / 2.0);
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
  bool hitTestSelf(Offset position) {
    return true;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    LinearGaugeParentData parentDataRef = parentData as LinearGaugeParentData;
    linearGaugeLabel = parentDataRef.linearGaugeLabel;

    if (getPointerAnimation.value > 0) {
      drawPointer(shape, canvas, linearGauge, offset);
    }
  }
}
