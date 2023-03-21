import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

List shaderPaintHorizontal = [
  {
    'valueBar': [
      ValueBar(value: 0, valueBarThickness: 20, borderRadius: 20),
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
      linearGradient: LinearGradient(
        colors: [Colors.orange, Colors.red, Colors.green],
      ),
    ),
    'name': 'value-bar-value-0-with-shader-Horizontal',
    'Do': 'Horizontal - Should draw value with Shaders BG of LinearGauge',
  },
];

List shaderPaintVertical = [
  {
    'valueBar': [
      ValueBar(value: 0, valueBarThickness: 20, borderRadius: 20),
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
      linearGradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [Colors.orange, Colors.red, Colors.green],
      ),
    ),
    'name': 'value-bar-value-0-with-shader-vertical',
    'Do': 'Vertical - Should draw value with Shaders BG of LinearGauge',
  },
];

List allTests = [
  ...shaderPaintHorizontal,
  ...shaderPaintVertical,
];
