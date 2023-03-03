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
      _linearGaugeLabel
          .add(LinearGaugeLabel(text: i.toInt().toString(), value: i));
    }

    final LinearGaugeLabel localLabel =
        _linearGaugeLabel[_linearGaugeLabel.length - 1];
    if (localLabel.value != end && localLabel.value! < end) {
      _linearGaugeLabel
          .add(LinearGaugeLabel(text: end.toInt().toString(), value: end));
    }
  }

  void addCustomLabels({
    required List<CustomLinearGaugeLabel> labelList,
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
    double linearGaugeBoxContainerHeight,
    double labelTopMargin,
    LinearGaugeIndicator indicator,
    Size labelSymbolSize,
  ) {
    primaryRulers.clear();

    Offset a = Offset((startLabel.width / 2) + (indicator.width! / 2),
        linearGaugeBoxContainerHeight);
    Offset b = Offset(
        size.width -
            ((endLabel.width + labelSymbolSize.width) / 2) -
            (indicator.width! / 2),
        linearGaugeBoxContainerHeight);

    for (int i = 0; i < _linearGaugeLabel.length; i++) {
      double n1 = ((_linearGaugeLabel[i].value! - _linearGaugeLabel[0].value!) /
              (_linearGaugeLabel[_linearGaugeLabel.length - 1].value! -
                  _linearGaugeLabel[0].value!)) *
          100;

      n1 = 100 / n1;
      double n = (_linearGaugeLabel[0].value! +
              _linearGaugeLabel[_linearGaugeLabel.length - 1].value!) /
          _linearGaugeLabel[i].value!;

      if (i == 0) {
        primaryRulers[_linearGaugeLabel[i].text!] = [
          a,
          Offset(a.dx, primaryRulersHeight)
        ];
      } else if (i == _linearGaugeLabel.length - 1) {
        primaryRulers[_linearGaugeLabel[i].text!] = [
          b,
          Offset(b.dx, primaryRulersHeight)
        ];
      } else {
        double x = ((n1 - 1) / n1) * a.dx + (1 / n1) * b.dx;
        double y = ((n1 - 1) / n1) * a.dy + (1 / n1) * b.dy;

        primaryRulers[_linearGaugeLabel[i].text!] = [
          Offset(x, y),
          Offset(x, primaryRulersHeight)
        ];
      }

      // double x = a.dx * (1 - ((i) / (_linearGaugeLabel.length - 1))) +
      //     b.dx * (i / (_linearGaugeLabel.length - 1));
      // double y = a.dy * (1 - ((i) / (_linearGaugeLabel.length - 1))) +
      //     b.dy * (i / (_linearGaugeLabel.length - 1));

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
    double linearGaugeHeight,
    LinearGaugeIndicator indicator,
    List<RangeLinearGauge> rangeLinearGauge,
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

          // print(x);

          if (Offset(x, y) != a) {
            Offset secondaryRulerStartPoint;
            Offset secondaryRulerEndPoint;

            switch (rulerPosition) {
              case RulerPosition.top:
                //the value 5 for the offset y axis is the height parameter for the secondary rulers
                secondaryRulerStartPoint = Offset(x, y);

                secondaryRulerEndPoint =
                    Offset(x, -(5 + height - linearGaugeHeight));
                break;
              case RulerPosition.center:
                //the staring point is shifted half of the secondary ruler height from the
                //center of the gauge container
                secondaryRulerStartPoint =
                    Offset(x, (y / 2) - ((5 + height - linearGaugeHeight) / 2));
                //the y co-ordinate of the ending point is halved from it's original position
                secondaryRulerEndPoint = Offset(x, (5 + height) / 2);
                break;
              case RulerPosition.bottom:
                //the value 5 for the offset y axis is the height parameter for the secondary rulers
                secondaryRulerStartPoint = Offset(x, y);

                secondaryRulerEndPoint = Offset(x, 5 + height);
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
