import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

List extendLinearGaugeTest = [
  {
    'extendLinearGauge': 50.0,
    'name': 'extend-linear-gauge-50',
    'Do': 'Linear gauge should we extended by 50',
  },
  {
    'extendLinearGauge': 0.0,
    'name': 'extend-linear-gauge-0',
    'Do': 'Linear gauge should we extended by 0',
  },
  {
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
      thickness: 20,
      backgroundColor: Colors.grey,
    ),
    'extendLinearGauge': 100.0,
    'name': 'extend-linear-gauge-100-thickness-20',
    'Do': 'Linear gauge of 20 thickness should we extended by 100',
  },
  {
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.bottom,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
      thickness: 15,
      backgroundColor: Colors.grey,
    ),
    'extendLinearGauge': 200.0,
    'name': 'extend-linear-gauge-200-thickness-15-bottom',
    'Do': 'Linear gauge of 15 thickness should we extended by 200 at bottom',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 50.0,
    'name': 'extend-linear-gauge-50-vertical',
    'Do': 'Vertical Linear gauge should we extended by 50',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 0.0,
    'name': 'extend-linear-gauge-0-vertical',
    'Do': 'Vertical Linear gauge should we extended by 0',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
      thickness: 20,
      backgroundColor: Colors.grey,
    ),
    'extendLinearGauge': 100.0,
    'name': 'extend-linear-gauge-100-thickness-20-vertical',
    'Do': 'Vertical Linear gauge of 20 thickness should we extended by 100',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.right,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
      thickness: 25,
      backgroundColor: Colors.grey,
    ),
    'extendLinearGauge': 20.0,
    'name': 'extend-linear-gauge-20-thickness-15-right',
    'Do': 'Linear gauge of 25 thickness should we extended by 20 at right',
  },
];

List allTests = [
  ...extendLinearGaugeTest,
];
