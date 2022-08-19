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

  void addLabels(
      {required double distanceValueInRangeOfHundred,
      required double start,
      required double end}) {
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
        size.width - ((endLabel.width / 2) + (startLabel.width / 2)),
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

  void addLabelsToMap() {
    _map.clear();
    for (final LinearGaugeLabel element in _linearGaugeLabel) {
      _map[element.value!] = element.text!;
    }
  }

  Size getLabelSize({required TextStyle textStyle, required double? value}) {
    final TextSpan textSpan =
        TextSpan(text: value!.toInt().toString(), style: textStyle);
    _textPainter.text = textSpan;
    _textPainter.layout();

    return Size(_textPainter.width, _textPainter.height);
  }

  double getMaxLabelSize({
    required TextStyle textStyle,
    required GaugeOrientation gaugeOrientation,
    required double labelTopMargin,
  }) {
    double labelHeight = 0;
    double labelWidth = 0;

    // should only calculate when there is label needs to be displayed
    for (final LinearGaugeLabel label in _linearGaugeLabel) {
      final Size size = getLabelSize(textStyle: textStyle, value: label.value);
      labelWidth = math.max(labelWidth, size.width);
      labelHeight = math.max(labelHeight, size.height);
    }
    return (gaugeOrientation == GaugeOrientation.horizontal
            ? labelHeight
            : labelWidth) +
        labelTopMargin;
  }

  List<LinearGaugeLabel> get getListOfLabel => _linearGaugeLabel;
  get getMappedLabel => _map;
  Map<String, List<Offset>> get getPrimaryRulersOffset => primaryRulers;
}
