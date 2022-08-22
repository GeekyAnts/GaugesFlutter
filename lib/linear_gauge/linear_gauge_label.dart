import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:gauges/gauges.dart';

class LinearGaugeLabel {
  String? text;
  double? value;
  LinearGaugeLabel({this.text, this.value});

  // Will be adding other members as required

  final List<LinearGaugeLabel> _linearGaugeLabel = [];
  late final Map<double, String> _map = {};
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
      double linearGaugeBoxContainerHeight) {
    primaryRulers.clear();
    Offset a = Offset(startLabel.width / 2, linearGaugeBoxContainerHeight);
    Offset b = Offset(
        size.width - ((endLabel.width / 2) - (startLabel.width / 2)),
        linearGaugeBoxContainerHeight);
    for (int i = 0; i < _linearGaugeLabel.length; i++) {
      double x = a.dx * (1 - (_linearGaugeLabel[i].value! / end)) +
          b.dx * (_linearGaugeLabel[i].value! / end);
      double y = a.dy * (1 - (_linearGaugeLabel[i].value! / end)) +
          b.dy * (_linearGaugeLabel[i].value! / end);
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
      double totalRulers, Canvas canvas, Paint secondaryRulersPaint) {
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
            canvas.drawLine(Offset(x, y), Offset(x, 10), secondaryRulersPaint);
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
