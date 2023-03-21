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
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.orange,
          Colors.red,
        ],
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
        colors: [
          Colors.orange,
          Colors.red,
        ],
      ),
    ),
    'name': 'value-bar-value-0-with-shader-vertical',
    'Do': 'Vertical - Should draw value with Shaders BG of LinearGauge',
  },
];

List shaderValuePaintVertical = [
  {
    'valueBar': [
      ValueBar(
        value: 50,
        valueBarThickness: 20,
        borderRadius: 20,
        linearGradient: const LinearGradient(
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
    'name': 'value-bar-value-50-with-shader-vertical',
    'Do': 'Vertical - Should draw value at 50 with Shaders',
  },
  {
    'valueBar': [
      ValueBar(
        value: 50,
        valueBarThickness: 20,
        borderRadius: 20,
        offset: 30,
        position: ValueBarPosition.right,
        linearGradient: const LinearGradient(
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
    'name': 'value-bar-offset-value-50-with-shader-vertical',
    'Do': 'Offset Vertical - Should draw value with at 50 with Shaders',
  },
];

List shaderValuePaintHorizontal = [
  {
    'valueBar': [
      ValueBar(
        value: 50,
        valueBarThickness: 20,
        borderRadius: 20,
        linearGradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.orange,
            Colors.red,
          ],
        ),
      ),
    ],
    "gaugeOrientation": GaugeOrientation.horizontal,
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
    'name': 'value-bar-value-50-with-shader-horizontal',
    'Do': 'Horizontal - Should draw value at 50 with Shaders',
  },
];
List allTests = [
  ...shaderPaintHorizontal,
  ...shaderPaintVertical,
  ...shaderValuePaintVertical,
  ...shaderValuePaintHorizontal
];
