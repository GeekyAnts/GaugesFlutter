import 'package:flutter/material.dart';

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
      double labelTopMargin) {
    primaryRulers.clear();

    Offset a = Offset(startLabel.width / 2, linearGaugeBoxContainerHeight);
    Offset b = Offset(
        size.width - (endLabel.width / 2), linearGaugeBoxContainerHeight);
    for (int i = 0; i < _linearGaugeLabel.length; i++) {
      double x = a.dx * (1 - ((i) / (_linearGaugeLabel.length - 1))) +
          b.dx * (i / (_linearGaugeLabel.length - 1));
      double y = a.dy * (1 - ((i) / (_linearGaugeLabel.length - 1))) +
          b.dy * (i / (_linearGaugeLabel.length - 1));
      // print(Offset(x, y));
      // print(Offset(x, primaryRulersHeight));

      primaryRulers[_linearGaugeLabel[i].text!] = [
        Offset(x, y),
        Offset(x, primaryRulersHeight)
      ];
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
      bool inverted,
      double linearGaugeHeight) {
    Iterable<List<Offset>> offset = primaryRulers.values;
    int i = 0;
    for (var element in offset) {
      if (i != offset.length - 1) {
        Offset a = element[0];
        Offset b = offset.elementAt(i + 1)[0];

        for (int i = 0; i < totalRulers + 1; i++) {
          double x = a.dx * (1 - ((i) / (totalRulers + 1))) +
              b.dx * (i / (totalRulers + 1));
          double y = a.dy * (1 - ((i) / (totalRulers + 1))) +
              b.dy * (i / (totalRulers + 1));

          if (Offset(x, y) != a) {
            if (inverted) {
              canvas.drawLine(
                  Offset(x, y),
                  Offset(x, -(5 + height - linearGaugeHeight)),
                  secondaryRulersPaint);
            } else {
              canvas.drawLine(
                  //the value 5 for the offset y axis is the height parameter for the secondary rulers
                  Offset(x, y),
                  Offset(x, 5 + height),
                  secondaryRulersPaint);
            }
            // canvas.drawLine(
            //     Offset(x, y), Offset(x, 5 + height), secondaryRulersPaint);
          }
        }
        i = i + 1;
      }
    }
  }

  Size getLabelSize({required TextStyle textStyle, required double? value}) {
    final TextSpan textSpan =
        TextSpan(text: value!.toInt().toString(), style: textStyle);
    _textPainter.text = textSpan;
    _textPainter.layout();

    return Size(_textPainter.width, _textPainter.height);
  }

  List<LinearGaugeLabel> get getListOfLabel => _linearGaugeLabel;

  Map<String, List<Offset>> get getPrimaryRulersOffset => primaryRulers;
}
