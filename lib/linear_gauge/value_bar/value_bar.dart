import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

import '../linear_gauge_painter.dart';

class ValueBar {
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

  ValueBar({
    required this.value,
    this.offset = 0,
    this.position = ValueBarPosition.center,
    this.color = Colors.blue,
    this.valueBarThickness = 4.0,
    this.edgeStyle = LinearEdgeStyle.bothCurve,
    this.borderRadius,
  });

  /// The `value` sets the value of the [ValueBar].
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       value: 50,
  ///       position: ValueBarPosition.top,
  ///       ),
  ///     ]
  /// ),
  /// ```
  final double value;

  /// The `valueBarThickness` sets the thickness of the [ValueBar].
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       valueBarThickness: 10,
  ///       ),
  ///     ]
  /// ),
  /// ```
  final double valueBarThickness;

  ///
  /// The `offset` sets the offset of the [ValueBar] from the [LinearGauge].
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     offset: 50,
  ///     position: ValueBarPosition.top,
  ///      ),
  ///    ]
  /// ),
  /// ```
  /// The default value of `offset` is `0`.
  ///
  double offset;

  ///
  /// The `position` sets the position of the [ValueBar] in the [LinearGauge].
  /// The [ValueBarPosition] can be `top`, `bottom` or `center`.
  /// The default value of `position` is `ValueBarPosition.center`.
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       value: 50,
  ///       position: ValueBarPosition.top,
  ///      ),
  ///   ],
  /// ),
  /// ```
  ///
  final ValueBarPosition position;

  ///
  /// The `color` sets the color of the [ValueBar].
  /// The default value of `color` is `Colors.blue`.
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     position: ValueBarPosition.top,
  ///     color: Colors.amber,
  ///         ),
  ///       ],
  ///   ),
  /// ```
  Color color;

  ///
  /// `borderRadius` Set corners to soft edges/rounded  of the ValueBar
  ///
  /// ```dart
  /// const LinearGauge(
  ///             linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///              linearGradient: LinearGradient(
  ///                colors: [Colors.blue, Colors.pink],
  ///                borderRadius: 10.0,
  ///              ),
  ///            ),
  ///          ),
  /// ```
  final double? borderRadius;

  ///
  /// `edgeStyle` Set the style of the edges of the ValueBar.
  ///
  /// default is to `edgeStyle =`LinearEdgeStyle.bothCurve`
  ///
  ///
  ///  Note : It tells to which edge of the valuebar to apply the supplied
  ///         borderRadius. It has no use if borderRadius is not supplied or is zero.
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     borderRadius:10,
  ///     edgeStyle:LinearEdgeStyle.bothCurve,
  ///         ),
  ///       ],
  ///   ),
  /// ```
  LinearEdgeStyle edgeStyle;

  ///
  /// Painter Method to Draw [ValueBar]
  ///

  void drawValueBar(Canvas canvas, double start, double end, double totalWidth,
      RenderLinearGauge linearGauge) {
    assert(value >= linearGauge.getStart && value <= linearGauge.getEnd,
        'Value should be between start and end values');

    // Start and End values of the Linear Gauge
    double endValue = linearGauge.getEnd;

    double startValue = linearGauge.getStart;
    GaugeOrientation gaugeOrientation = linearGauge.getGaugeOrientation;

    //  width of the value bar in pixels based on the value
    double valueBarWidth = ((value - startValue) / (endValue - startValue)) *
        (totalWidth - 2 * linearGauge.getExtendLinearGauge);

    double valueBarHeight = ((value - endValue) / (startValue - endValue)) *
        (totalWidth - 2 * linearGauge.getExtendLinearGauge);

    valueBarWidth = linearGauge.getAnimationValue != null
        ? valueBarWidth * (linearGauge.getAnimationValue!)
        : valueBarWidth;

    final ValueBarPosition valueBarPosition = position;
    final getLinearGaugeBoxDecoration = linearGauge.getLinearGaugeBoxDecoration;
    final Paint linearGaugeContainerPaint = Paint();
    linearGaugeContainerPaint.color = color;

    //For get Offset Height
    double linearGaugeThickness = linearGauge.getThickness;

    double totalValOffset =
        _getOffsetHeight(valueBarPosition, linearGaugeThickness, offset);
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

      gaugeContainer = Rect.fromLTWH(
        startValue,
        totalValOffset + (linearGaugeThickness - valueBarThickness) / 2,
        !getInversedRulers ? valueBarWidth : -valueBarWidth,
        valueBarThickness,
      );
    } else {
      double barTop = (!getInversedRulers)
          ? start + valueBarHeight
          : start - linearGauge.getExtendLinearGauge;
      double barLeft = _getOffsetHeight(
        position,
        linearGaugeThickness,
        offset,
      ); // adjust left position as needed

      if (!linearGauge.getFillExtend) {
        barTop = !getInversedRulers
            ? (barTop + linearGauge.getExtendLinearGauge)
            : (barTop + 2 * linearGauge.getExtendLinearGauge);
      } else {
        barTop = barTop + linearGauge.getExtendLinearGauge;

        if (linearGauge.getEnd == value) {
          barTop = !getInversedRulers
              ? (barTop - linearGauge.getExtendLinearGauge)
              : (barTop);

          valueBarWidth += 2 * linearGauge.getExtendLinearGauge;
        } else {
          valueBarWidth += linearGauge.getExtendLinearGauge;
        }
      }

      gaugeContainer = Rect.fromLTWH(
        barLeft + (linearGaugeThickness - valueBarThickness) / 2,
        barTop,
        valueBarThickness, // set width to half of the gauge width
        valueBarWidth,
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
  double _getOffsetHeight(
      ValueBarPosition position, double height, double valueBarOffset) {
    switch (position) {
      case ValueBarPosition.center:
        return 0.0;
      case ValueBarPosition.top:
        return -(height + valueBarOffset);
      case ValueBarPosition.bottom:
        return height + valueBarOffset;
      case ValueBarPosition.left:
        return -(height + valueBarOffset);
      case ValueBarPosition.right:
        return height + valueBarOffset;
      default:
        return 0;
    }
  }

  RRect _getRoundedContainer({
    required Rect gaugeContainer,
    required var linearGauge,
  }) {
    GaugeOrientation gaugeOrientation = linearGauge.getGaugeOrientation;
    var rectangularBox;
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
