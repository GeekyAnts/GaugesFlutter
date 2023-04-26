import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/gauge_container.dart/linear_gauge_container.dart';
import '../../../geekyants_flutter_gauges.dart';

class RenderValueBar extends RenderBox {
  RenderValueBar({
    Key? key,
    required LinearGauge linearGauge,
    required double value,
    required double offset,
    required ValueBarPosition position,
    required Color color,
    required double valueBarThickness,
    required LinearEdgeStyle edgeStyle,
    required double borderRadius,
    required int animationDuration,
    required Curve animationType,
    required bool enableAnimation,
  })  : _linearGauge = linearGauge,
        _value = value,
        _position = position,
        _color = color,
        _thickness = valueBarThickness,
        _borderRadius = borderRadius,
        _offset = offset,
        _edgeStyle = edgeStyle;

  double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;

  late Size _axisActualSize;

  LinearGauge get linearGauge => _linearGauge;
  LinearGauge _linearGauge;

  double get value => _value;
  double _value;
  set setValue(double val) {
    if (_value == val) {
      return;
    }
    _value = val;
    markNeedsPaint();
  }

  /// Gets the pointerPosition assigned to [RenderValueBar].
  ValueBarPosition get position => _position;
  ValueBarPosition _position;

  /// Sets the pointerPosition for [RenderValueBar].
  set setPosition(ValueBarPosition value) {
    if (value == _position) {
      return;
    }

    _position = value;
    markNeedsPaint();
  }

  /// Gets the color assigned to [RenderValueBar].
  Color get color => _color;
  Color _color;

  /// Sets the color for [RenderValueBar].
  set setColor(Color value) {
    if (value == _color) {
      return;
    }

    _color = value;
    markNeedsPaint();
  }

  /// Getter and Setter for the [_thickness] parameter.
  ///
  double get valueBarThickness => _thickness;
  double _thickness;
  set setThickness(double val) {
    if (_thickness == val) return;
    _thickness = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_offset] parameter.
  ///

  double get offset => _offset;
  double _offset;
  set setOffset(double val) {
    if (_offset == val) return;
    _offset = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_borderRadius] parameter.
  ///

  double get borderRadius => _borderRadius;
  double _borderRadius;
  set setBorderRadius(double val) {
    if (_borderRadius == val) return;
    _borderRadius = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_edgeStyle] parameter.
  ///

  LinearEdgeStyle get edgeStyle => _edgeStyle;
  LinearEdgeStyle _edgeStyle;
  set setEdgeStyle(LinearEdgeStyle val) {
    if (_edgeStyle == val) return;
    _edgeStyle = val;
    markNeedsLayout();
  }

  void drawValueBar(Canvas canvas, double start, double end, double totalWidth,
      int index, LinearGauge linearGauge) {
    assert(value >= linearGauge.start! && value <= linearGauge.end!,
        'Value should be between start and end values');

    // Start and End values of the Linear Gauge
    double endValue = linearGauge.end!;

    double startValue = linearGauge.start!;
    GaugeOrientation gaugeOrientation = linearGauge.gaugeOrientation!;

    //  width of the value bar in pixels based on the value
    double valueBarWidth = ((value - startValue) / (endValue - startValue)) *
        (totalWidth - 2 * linearGauge.extendLinearGauge!);

    // double valueBarAnimationValue =
    //     linearGauge.getValueBarAnimation[index].value;

    // valueBarWidth = (enableAnimation)
    //     ? valueBarWidth * valueBarAnimationValue
    //     : valueBarWidth;

    final ValueBarPosition valueBarPosition = position;
    final Paint linearGaugeContainerPaint = Paint();
    linearGaugeContainerPaint.color = color;

    //For get Offset Height
    double linearGaugeThickness =
        linearGauge.linearGaugeBoxDecoration!.thickness!;

    double totalValOffset = _getOffsetHeight(
        valueBarPosition, linearGaugeThickness, offset, linearGauge);
    bool getInversedRulers = linearGauge.rulers!.inverseRulers!;
    // Drawing Value Bar
    final Rect gaugeContainer;

    if (gaugeOrientation == GaugeOrientation.horizontal) {
      double startValue = (!getInversedRulers) ? start : (start + end);

      if (!linearGauge.fillExtend) {
        startValue = !getInversedRulers
            ? (startValue + linearGauge.extendLinearGauge!)
            : (startValue - linearGauge.extendLinearGauge!);
      } else {
        if (linearGauge.end! == value) {
          valueBarWidth += 2 * linearGauge.extendLinearGauge!;
        } else {
          valueBarWidth += linearGauge.extendLinearGauge!;
        }
      }

      var topOffset = totalValOffset;

      if (position == ValueBarPosition.center) {
        topOffset = totalValOffset +
            (linearGaugeThickness - valueBarThickness) / 2 +
            yAxisForGaugeContainer;
      }

      gaugeContainer = Rect.fromLTWH(
        startValue,
        topOffset,
        !getInversedRulers ? valueBarWidth : -valueBarWidth,
        valueBarThickness,
      );
    } else {
      double barTop = (!getInversedRulers) ? start + end : start;
      double barLeft = _getOffsetHeight(
        position,
        linearGaugeThickness,
        offset,
        linearGauge,
      ); // adjust left position as needed

      if (!linearGauge.fillExtend) {
        barTop = !getInversedRulers
            ? (barTop - linearGauge.extendLinearGauge!)
            : (barTop + linearGauge.extendLinearGauge!);
      } else {
        // barTop = barTop + 2 * linearGauge.extendLinearGauge!;

        if (linearGauge.end! == value) {
          valueBarWidth += 2 * linearGauge.extendLinearGauge!;
        } else {
          valueBarWidth += linearGauge.extendLinearGauge!;
        }
      }

      var startOffset = barLeft;

      if (position == ValueBarPosition.center) {
        startOffset = barLeft +
            (linearGaugeThickness - valueBarThickness) / 2 +
            xAxisForGaugeContainer;
      }

      gaugeContainer = Rect.fromLTWH(
        startOffset,
        barTop,
        (position == ValueBarPosition.left)
            ? -valueBarThickness
            : valueBarThickness, // set width to half of the gauge width
        !getInversedRulers ? -valueBarWidth : valueBarWidth,
      );
    }

    if (borderRadius != null) {
      var rectangularBox = _getRoundedContainer(
        gaugeContainer: gaugeContainer,
        linearGauge: linearGauge,
      );
      canvas.drawRRect(rectangularBox, linearGaugeContainerPaint);
    } else {
      canvas.drawRect(gaugeContainer, linearGaugeContainerPaint);
    }
  }

  // Calculating Offset Height for Value Bar
  double _getOffsetHeight(ValueBarPosition position, double height,
      double valueBarOffset, LinearGauge linearGauge) {
    switch (position) {
      case ValueBarPosition.center:
        return 0.0;
      case ValueBarPosition.top:
        return (yAxisForGaugeContainer - valueBarThickness - offset);
      case ValueBarPosition.bottom:
        return height + valueBarOffset + yAxisForGaugeContainer;
      case ValueBarPosition.left:
        return xAxisForGaugeContainer - valueBarOffset;
      case ValueBarPosition.right:
        return height + valueBarOffset + xAxisForGaugeContainer;
      default:
        return 0;
    }
  }

  RRect _getRoundedContainer({
    required Rect gaugeContainer,
    required var linearGauge,
  }) {
    GaugeOrientation gaugeOrientation = linearGauge.gaugeOrientation!;
    RRect rectangularBox;
    switch (edgeStyle) {
      case LinearEdgeStyle.startCurve:
        gaugeOrientation == GaugeOrientation.horizontal
            ? rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topLeft: Radius.circular(borderRadius),
                bottomLeft: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius)
                    : Radius.zero,
                topRight: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius),
              )
            : rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topRight: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius)
                    : Radius.zero,
                bottomLeft: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              );
        break;
      case LinearEdgeStyle.endCurve:
        gaugeOrientation == GaugeOrientation.horizontal
            ? rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topRight: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius)
                    : Radius.zero,
                bottomLeft: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              )
            : rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topLeft: Radius.circular(borderRadius),
                bottomLeft: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius)
                    : Radius.zero,
                topRight: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius),
              );
        break;

      default:
        rectangularBox = RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(borderRadius),
        );
        break;
    }

    return rectangularBox;
  }

  @override
  void performLayout() {
    double parentWidgetSize;

    final double actualParentWidth = constraints.maxWidth;
    final double actualParentHeight = constraints.maxHeight;

    if (linearGauge.gaugeOrientation == GaugeOrientation.vertical) {
      parentWidgetSize = actualParentWidth;
    } else {
      parentWidgetSize = actualParentHeight;
    }

    if (linearGauge.gaugeOrientation == GaugeOrientation.vertical) {
      _axisActualSize = Size(parentWidgetSize, valueBarThickness);
    } else {
      _axisActualSize = Size(valueBarThickness, parentWidgetSize);
    }

    size = _axisActualSize;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    xAxisForGaugeContainer = offset.dx;
    yAxisForGaugeContainer = offset.dy;
    drawValueBar(
        canvas,
        RenderLinearGaugeContainer.gaugeStart,
        RenderLinearGaugeContainer.gaugeEnd,
        RenderLinearGaugeContainer.gaugeEnd,
        0,
        linearGauge);
  }
}
