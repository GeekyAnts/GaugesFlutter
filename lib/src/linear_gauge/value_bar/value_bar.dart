import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/linear_gauge_painter.dart';
import '../../base/base_value_bar.dart';

///
/// The [ValueBar]  can be used to represent the current value of the [LinearGauge].
///
///
///
/// ```dart
/// LinearGauge(
/// valueBar: [
/// ValueBar(
/// value: 50,
/// position: ValueBarPosition.top,
/// color: Colors.amber,
///   ),
///  ]
/// ),
/// ```
///

class ValueBar extends BaseValueBar {
  const ValueBar({
    required super.value,
    super.offset = 0,
    super.position = ValueBarPosition.center,
    super.color = Colors.blue,
    super.valueBarThickness = 4.0,
    super.edgeStyle = LinearEdgeStyle.bothCurve,
    super.borderRadius,
    super.animationDuration = 1000,
    super.animationType = Curves.ease,
    super.enableAnimation = true,
  });

  ///
  /// Painter Method to Draw [ValueBar]
  ///

  void drawValueBar(Canvas canvas, double start, double end, double totalWidth,
      int index, RenderLinearGauge linearGauge) {
    assert(value >= linearGauge.getStart && value <= linearGauge.getEnd,
        'Value should be between start and end values');

    // Start and End values of the Linear Gauge
    double endValue = linearGauge.getEnd;

    double startValue = linearGauge.getStart;
    GaugeOrientation gaugeOrientation = linearGauge.getGaugeOrientation;

    //  width of the value bar in pixels based on the value
    double valueBarWidth = ((value - startValue) / (endValue - startValue)) *
        (totalWidth - 2 * linearGauge.getExtendLinearGauge);

    double valueBarAnimationValue =
        linearGauge.getValueBarAnimation[index].value;

    valueBarWidth = (enableAnimation)
        ? valueBarWidth * valueBarAnimationValue
        : valueBarWidth;

    final ValueBarPosition valueBarPosition = position;
    final Paint linearGaugeContainerPaint = Paint();
    linearGaugeContainerPaint.color = color;

    //For get Offset Height
    double linearGaugeThickness = linearGauge.getThickness;

    double totalValOffset = _getOffsetHeight(
        valueBarPosition, linearGaugeThickness, offset, linearGauge);
    bool getInversedRulers = linearGauge.getInversedRulers;
    // Drawing Value Bar
    final Rect gaugeContainer;

    if (gaugeOrientation == GaugeOrientation.horizontal) {
      double startValue = (!getInversedRulers) ? start : (start + end);

      if (!linearGauge.getFillExtend) {
        startValue = !getInversedRulers
            ? (startValue + linearGauge.getExtendLinearGauge)
            : (startValue - linearGauge.getExtendLinearGauge);
      } else {
        if (linearGauge.getEnd == value) {
          valueBarWidth += 2 * linearGauge.getExtendLinearGauge;
        } else {
          valueBarWidth += linearGauge.getExtendLinearGauge;
        }
      }

      var topOffset = totalValOffset;

      if (position == ValueBarPosition.center) {
        topOffset = totalValOffset +
            (linearGaugeThickness - valueBarThickness) / 2 +
            linearGauge.yAxisForGaugeContainer;
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

      if (!linearGauge.getFillExtend) {
        barTop = !getInversedRulers
            ? (barTop - linearGauge.getExtendLinearGauge)
            : (barTop + linearGauge.getExtendLinearGauge);
      } else {
        // barTop = barTop + 2 * linearGauge.getExtendLinearGauge;

        if (linearGauge.getEnd == value) {
          valueBarWidth += 2 * linearGauge.getExtendLinearGauge;
        } else {
          valueBarWidth += linearGauge.getExtendLinearGauge;
        }
      }

      var startOffset = barLeft;

      if (position == ValueBarPosition.center) {
        startOffset = barLeft +
            (linearGaugeThickness - valueBarThickness) / 2 +
            linearGauge.xAxisForGaugeContainer;
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
      double valueBarOffset, RenderLinearGauge linearGauge) {
    switch (position) {
      case ValueBarPosition.center:
        return 0.0;
      case ValueBarPosition.top:
        return (linearGauge.yAxisForGaugeContainer -
            valueBarThickness -
            offset);
      case ValueBarPosition.bottom:
        return height + valueBarOffset + linearGauge.yAxisForGaugeContainer;
      case ValueBarPosition.left:
        return linearGauge.xAxisForGaugeContainer - valueBarOffset;
      case ValueBarPosition.right:
        return height + valueBarOffset + linearGauge.xAxisForGaugeContainer;
      default:
        return 0;
    }
  }

  RRect _getRoundedContainer({
    required Rect gaugeContainer,
    required var linearGauge,
  }) {
    GaugeOrientation gaugeOrientation = linearGauge.getGaugeOrientation;
    RRect rectangularBox;
    switch (edgeStyle) {
      case LinearEdgeStyle.startCurve:
        gaugeOrientation == GaugeOrientation.horizontal
            ? rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topLeft: Radius.circular(borderRadius!),
                bottomLeft: (linearGauge.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius!)
                    : Radius.zero,
                topRight: (linearGauge.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius!),
              )
            : rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topRight: (linearGauge.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius!)
                    : Radius.zero,
                bottomLeft: (linearGauge.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius!),
                bottomRight: Radius.circular(borderRadius!),
              );
        break;
      case LinearEdgeStyle.endCurve:
        gaugeOrientation == GaugeOrientation.horizontal
            ? rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topRight: (linearGauge.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius!)
                    : Radius.zero,
                bottomLeft: (linearGauge.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius!),
                bottomRight: Radius.circular(borderRadius!),
              )
            : rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topLeft: Radius.circular(borderRadius!),
                bottomLeft: (linearGauge.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius!)
                    : Radius.zero,
                topRight: (linearGauge.getGaugeOrientation ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius!),
              );
        break;

      default:
        rectangularBox = RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(borderRadius!),
        );
        break;
    }

    return rectangularBox;
  }
}
