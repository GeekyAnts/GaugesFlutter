import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class LinearGaugeLabel {
  String? text;
  double? value;
  LinearGaugeLabel({this.text, this.value});

  // Will be adding other members as required

  final List<LinearGaugeLabel> _linearGaugeLabel = [];

  late final Map<String, List<Offset>> primaryRulers = {};
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
    LinearGaugeBoxDecoration linearGaugeBoxDecoration,
    double labelTopMargin,
    Pointer pointer,
    bool isCustomLabelsGiven,
    bool isRulersInversed,
    GaugeOrientation orientation,
  ) {
    primaryRulers.clear();
    late Offset a;
    late Offset b;

    if (orientation == GaugeOrientation.horizontal) {
      a = Offset((startLabel.width / 2) + (pointer.width! / 2),
          linearGaugeBoxDecoration.height);
      b = Offset(size.width - (endLabel.width / 2) - (pointer.width! / 2),
          linearGaugeBoxDecoration.height);
    } else {
      a = Offset((startLabel.height / 2) + (pointer.width! / 2),
          linearGaugeBoxDecoration.width);
      b = Offset(
        size.height - (endLabel.height / 2) - (pointer.width! / 2),
        linearGaugeBoxDecoration.width,
      );
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
          primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
            a,
            Offset(a.dx, primaryRulersHeight)
          ];
        } else if (i == _linearGaugeLabel.length - 1) {
          primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
            b,
            Offset(b.dx, primaryRulersHeight)
          ];
        } else {
          double x = ((n - 1) / n) * a.dx + (1 / n) * b.dx;
          double y = ((n - 1) / n) * a.dy + (1 / n) * b.dy;

          primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
            Offset(x, y),
            Offset(x, primaryRulersHeight)
          ];
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
          print("${x},${y}");
          primaryRulers[_linearGaugeLabel[i].value!.toString()] = [
            Offset(y, x),
            Offset(primaryRulersHeight, x - y)
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
    Pointer pointer,
    List<RangeLinearGauge> rangeLinearGauge,
    double rulersOffset,
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
                secondaryRulerStartPoint = Offset(x, -rulersOffset);

                secondaryRulerEndPoint =
                    Offset(x, -(5 + height + rulersOffset));
                break;
              case RulerPosition.center:
                //the staring point is shifted half of the secondary ruler height from the
                //center of the gauge container
                secondaryRulerStartPoint =
                    Offset(x, (y / 2) - ((5 + height) / 2));
                //the y co-ordinate of the ending point is halved from it's original position
                secondaryRulerEndPoint = Offset(x, (5 + height) / 2);
                break;
              case RulerPosition.bottom:
                //the value 5 for the offset y axis is the height parameter for the secondary rulers

                secondaryRulerStartPoint = Offset(x, y + rulersOffset);

                secondaryRulerEndPoint = Offset(x, 5 + height + rulersOffset);

                break;
              case RulerPosition.right:

                //the value 5 for the offset y axis is the height parameter for the secondary rulers
                secondaryRulerStartPoint = Offset(x + rulersOffset, y);

                secondaryRulerEndPoint = Offset(rulersOffset + height + 5, (y));

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
