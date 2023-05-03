import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

List shaderPaintHorizontal = [
  {
    'valueBar': [
      const ValueBar(
        value: 100,
        valueBarThickness: 20,
        borderRadius: 20,
        linearGradient: LinearGradient(
          colors: [Colors.orange, Colors.red],
        ),
      ),
    ],
    "rulers": const RulerStyle(
      rulerPosition: RulerPosition.bottom,
      showPrimaryRulers: false,
      showLabel: false,
      showSecondaryRulers: false,
    ),
    "linearGaugeBoxDecoration": const LinearGaugeBoxDecoration(
      borderRadius: 30,
      thickness: 20,
    ),
    'name': 'value-bar-value-100-with-shader',
    'Do': 'Horizontal - Should draw value with Shaders BG of LinearGauge',
  },
];

List shaderPaintVertical = [
  {
    'valueBar': [
      const ValueBar(
        value: 100,
        valueBarThickness: 20,
        borderRadius: 20,
        linearGradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.orange,
            Colors.red,
          ],
        ),
      ),
    ],
    "gaugeOrientation": GaugeOrientation.vertical,
    "rulers": const RulerStyle(
      rulerPosition: RulerPosition.right,
      showPrimaryRulers: false,
      showLabel: false,
      showSecondaryRulers: false,
    ),
    "linearGaugeBoxDecoration": const LinearGaugeBoxDecoration(
      borderRadius: 30,
      thickness: 20,
    ),
    'name': 'value-bar-value-100-with-shader-vertical',
    'Do': 'Vertical - Should draw value with Shaders BG of LinearGauge',
  },
];

List allTests = [
  ...shaderPaintHorizontal,
  ...shaderPaintVertical,
];
