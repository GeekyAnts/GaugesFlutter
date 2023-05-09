import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/gauge_container/linear_gauge_container.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/rulers/rulers_painter.dart';

class LinearGaugeLabel {
  String? text;
  double? value;
  LinearGaugeLabel({this.text, this.value});

  // Will be adding other members as required

  static final List<LinearGaugeLabel> _linearGaugeLabel = [];

  static final Map<String, List<Offset>> primaryRulers = {};
  final TextPainter _textPainter =
      TextPainter(textDirection: TextDirection.ltr);

  void addLabels({
    required double distanceValueInRangeOfHundred,
    required double start,
    required double end,
  }) {
    _linearGaugeLabel.clear();

    for (double i = start; i <= end; i += distanceValueInRangeOfHundred) {
      _linearGaugeLabel.add(LinearGaugeLabel(text: i.toString(), value: i));
    }

    final LinearGaugeLabel localLabel =
        _linearGaugeLabel[_linearGaugeLabel.length - 1];
    if (localLabel.value != end && localLabel.value! < end) {
      _linearGaugeLabel.add(LinearGaugeLabel(text: end.toString(), value: end));
    }
  }

  void addCustomLabels({
    required List<CustomRulerLabel> labelList,
  }) {
    _linearGaugeLabel.clear();

    for (int i = 0; i < labelList.length; i++) {
      _linearGaugeLabel.add(
          LinearGaugeLabel(text: labelList[i].text, value: labelList[i].value));
    }
  }

  ///
  /// The formula is from the below source
  /// (!)[https://stackoverflow.com/a/3542512/4565953]
  void generateOffSetsForLabel(
      Size startLabel,
      Size endLabel,
      Size size,
      double end,
      double primaryRulersHeight,
      double thickness,
      double labelTopMargin,
      bool isCustomLabelsGiven,
      bool isRulersInversed,
      GaugeOrientation orientation,
      double extendLinearGauge,
      RenderLinearGaugeContainer linearGauge) {
    primaryRulers.clear();
    late Offset a;
    late Offset b;
    double largestPointerSize = linearGauge.getLargestPointerSize();

    if (orientation == GaugeOrientation.horizontal) {
      if (linearGauge.showLabel) {
        a = Offset(
            (startLabel.width / 2) +
                (largestPointerSize / 2) +
                extendLinearGauge,
            thickness);
        b = Offset(
            size.width -
                (endLabel.width / 2) -
                (largestPointerSize / 2) -
                extendLinearGauge,
            thickness);
      } else {
        a = Offset((largestPointerSize / 2) + extendLinearGauge, thickness);
        b = Offset(size.width - (largestPointerSize / 2) - extendLinearGauge,
            thickness);
      }
    } else {
      if (linearGauge.showLabel) {
        a = Offset(
            (startLabel.height / 2) +
                (largestPointerSize / 2) +
                extendLinearGauge,
            thickness);
        b = Offset(
          size.height -
              (endLabel.height / 2) -
              (largestPointerSize / 2) -
              extendLinearGauge,
          thickness,
        );
      } else {
        a = Offset((largestPointerSize / 2) + extendLinearGauge, thickness);
        b = Offset(size.height - extendLinearGauge - largestPointerSize / 2,
            thickness);
      }

      // this will allow to start from bottom
      Offset temp = a;
      a = b;
      b = temp;
    }
    if (isRulersInversed) {
      Offset temp = a;
      a = b;
      b = temp;
    }
    if (isCustomLabelsGiven) {
      for (int i = 0; i < _linearGaugeLabel.length; i++) {
        // n is the nth point of the line
        double n = 100 /
            (((_linearGaugeLabel[i].value! - _linearGaugeLabel.first.value!) /
                    (_linearGaugeLabel.last.value! -
                        _linearGaugeLabel.first.value!)) *
                100);

        if (i == 0) {
          if (GaugeOrientation.horizontal == orientation) {
            primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
              a,
              Offset(a.dx, primaryRulersHeight)
            ];
          } else {
            primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
              Offset(a.dy, a.dx),
              Offset(primaryRulersHeight, a.dx)
            ];
          }
        } else if (i == _linearGaugeLabel.length - 1) {
          if (GaugeOrientation.horizontal == orientation) {
            primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
              b,
              Offset(b.dx, primaryRulersHeight)
            ];
          } else {
            primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
              Offset(b.dy, b.dx),
              Offset(primaryRulersHeight, b.dx)
            ];
          }
        } else {
          double x = ((n - 1) / n) * a.dx + (1 / n) * b.dx;
          double y = ((n - 1) / n) * a.dy + (1 / n) * b.dy;

          if (GaugeOrientation.horizontal == orientation) {
            primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
              Offset(x, y),
              Offset(x, primaryRulersHeight)
            ];
          } else {
            primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
              Offset(y, x),
              Offset(primaryRulersHeight, x)
            ];
          }
        }
      }
    } else {
      for (int i = 0; i < _linearGaugeLabel.length; i++) {
        double x = a.dx * (1 - ((i) / (_linearGaugeLabel.length - 1))) +
            b.dx * (i / (_linearGaugeLabel.length - 1));
        double y = a.dy * (1 - ((i) / (_linearGaugeLabel.length - 1))) +
            b.dy * (i / (_linearGaugeLabel.length - 1));

        if (GaugeOrientation.horizontal == orientation) {
          primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
            Offset(x, y),
            Offset(x, primaryRulersHeight)
          ];
        } else {
          primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
            Offset(y, x),
            Offset(primaryRulersHeight, x)
          ];
          // Inverted the axis here
          // primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
          //   Offset(y + primaryRulersHeight, x + primaryRulersHeight),
          //   Offset(primaryRulersHeight * 2, (x - y) + primaryRulersHeight)
          // ];
        }
      }
    }
  }

  ///
  /// The formula is from the below source
  /// (!)[https://stackoverflow.com/a/3542512/4565953]
  void generateSecondaryRulers(
    double totalRulers,
    Canvas canvas,
    Paint secondaryRulersPaint,
    double height,
    RulerPosition rulerPosition,
    List<RangeLinearGauge> rangeLinearGauge,
    double rulersOffset,
    GaugeOrientation gaugeOrientation,
    double linearGaugeHeight,
    RenderRulers rulers,
  ) {
    Iterable<List<Offset>> offset = primaryRulers.values;
    Iterable<String> keys = primaryRulers.keys;
    Color fallBackColor = secondaryRulersPaint.color;

    int j = 0;
    for (var element in offset) {
      if (j != offset.length - 1) {
        Offset a = element[0];
        Offset b = offset.elementAt(j + 1)[0];

        for (int i = 0; i < totalRulers + 1; i++) {
          double x = a.dx * (1 - ((i) / (totalRulers + 1))) +
              b.dx * (i / (totalRulers + 1));
          double y = a.dy * (1 - ((i) / (totalRulers + 1))) +
              b.dy * (i / (totalRulers + 1));

          if (Offset(x, y) != a) {
            Offset secondaryRulerStartPoint;
            Offset secondaryRulerEndPoint;

            switch (rulerPosition) {
              case RulerPosition.top:
                //the value 5 for the offset y axis is the height parameter for the secondary rulers
                secondaryRulerStartPoint =
                    Offset(x, -rulersOffset + rulers.yAxisForGaugeContainer);

                secondaryRulerEndPoint = Offset(
                    x,
                    -(height + rulersOffset - y) +
                        rulers.yAxisForGaugeContainer);
                break;
              case RulerPosition.center:
                if (gaugeOrientation == GaugeOrientation.horizontal) {
                  //the staring point is shifted half of the secondary ruler height from the
                  //center of the gauge container
                  secondaryRulerStartPoint = Offset(
                      x,
                      (y / 2) -
                          ((height - linearGaugeHeight) / 2) +
                          rulers.yAxisForGaugeContainer);
                  //the y co-ordinate of the ending point is halved from it's original position
                  secondaryRulerEndPoint =
                      Offset(x, (height) / 2 + rulers.yAxisForGaugeContainer);
                } else {
                  //the staring point is shifted half of the secondary ruler height from the
                  //center of the gauge container
                  secondaryRulerStartPoint = Offset(
                      (x / 2) -
                          ((height - linearGaugeHeight) / 2) +
                          rulers.xAxisForGaugeContainer,
                      y);
                  //the y co-ordinate of the ending point is halved from it's original position
                  secondaryRulerEndPoint = Offset(
                      (((height) / 2) + rulers.xAxisForGaugeContainer), y);
                }
                break;
              case RulerPosition.bottom:
                //the value 5 for the offset y axis is the height parameter for the secondary rulers

                secondaryRulerStartPoint = Offset(
                  x,
                  y + rulersOffset + rulers.yAxisForGaugeContainer,
                );

                secondaryRulerEndPoint = Offset(
                  x,
                  height + rulersOffset + rulers.yAxisForGaugeContainer,
                );

                break;
              case RulerPosition.right:

                //the value 5 for the offset y axis is the height parameter for the secondary rulers
                secondaryRulerStartPoint =
                    Offset(x + rulersOffset + rulers.xAxisForGaugeContainer, y);

                secondaryRulerEndPoint = Offset(
                    rulersOffset + height + rulers.xAxisForGaugeContainer, (y));

                break;
              case RulerPosition.left:

                //the value 5 for the offset y axis is the height parameter for the secondary rulers
                secondaryRulerStartPoint =
                    Offset(-rulersOffset + rulers.xAxisForGaugeContainer, y);
                secondaryRulerEndPoint = Offset(
                    -(rulersOffset +
                        height -
                        x -
                        rulers.xAxisForGaugeContainer),
                    y);

                break;
            }

            Color secondaryRulerColor = secondaryRulersPaint.color;
            for (int k = 0; k < rangeLinearGauge.length; k++) {
              var range = rangeLinearGauge[k].end;
              var offset = double.parse(keys.elementAt(j));
              if (offset >= rangeLinearGauge[k].start && offset < range) {
                secondaryRulerColor = rangeLinearGauge[k].color;
                secondaryRulersPaint.color = secondaryRulerColor;

                break;
              } else {
                secondaryRulersPaint.color = fallBackColor;
              }
            }
            secondaryRulersPaint.color =
                rulers.setAnimatedColor(secondaryRulersPaint.color);

            canvas.drawLine(secondaryRulerStartPoint, secondaryRulerEndPoint,
                secondaryRulersPaint);
          }
        }
        j = j + 1;
      }
    }
  }

  Size getLabelSize({required TextStyle textStyle, required String? value}) {
    final TextSpan textSpan = TextSpan(text: value!, style: textStyle);
    _textPainter.text = textSpan;
    _textPainter.layout();

    return Size(_textPainter.width, _textPainter.height);
  }

  List<LinearGaugeLabel> get getListOfLabel => _linearGaugeLabel;

  Map<String, List<Offset>> get getPrimaryRulersOffset => primaryRulers;
}
