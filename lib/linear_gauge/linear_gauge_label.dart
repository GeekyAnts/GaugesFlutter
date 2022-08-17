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

    // TODO::// BUG Alert
    // final LinearGaugeLabel lastLabel =
    //     _linearGaugeLabel[_linearGaugeLabel.length - 1];
    // if (lastLabel.value != start && lastLabel.value! < end) {
    //   _linearGaugeLabel.add(LinearGaugeLabel(text: end.toString(), value: end));
    // }
  }

  void addLabelsToMap() {
    _map.clear();
    for (final LinearGaugeLabel element in _linearGaugeLabel) {
      _map[element.value!] = element.text!;
    }
  }

  Size getLabelSize({required TextStyle textStyle, required double? value}) {
    final String? label = getMappedLabel[value];
    final TextSpan textSpan = TextSpan(text: label, style: textStyle);
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
}
