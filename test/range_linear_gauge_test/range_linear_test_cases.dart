import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

List valueTestCases = [
  // For Horizontal
  {
    'rangeLinear': [
      RangeLinearGauge(
        end: 0,
        start: 50,
        color: Colors.green,
      ),
      RangeLinearGauge(
        end: 50,
        start: 80,
        color: Colors.amber,
      ),
      RangeLinearGauge(
        end: 80,
        start: 100,
        color: Colors.red,
      ),
    ],
    'name': 'range-linear-gauge',
    'Do': 'RangeLinearGauge should be drawn with Green, Amber, Red',
  },
  {
    'rangeLinear': [
      RangeLinearGauge(
        end: 0,
        start: 50,
        color: Colors.red,
      ),
      RangeLinearGauge(
        end: 50,
        start: 80,
        color: Colors.green,
      ),
      RangeLinearGauge(
        end: 80,
        start: 100,
        color: Colors.blue,
      ),
    ],
    'name': 'range-linear-gauge-rbg',
    'Do': 'RangeLinearGauge should be drawn with rgb',
  },

  // For Vertical

  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'rangeLinear': [
      RangeLinearGauge(
        end: 0,
        start: 50,
        color: Colors.red,
      ),
      RangeLinearGauge(
        end: 50,
        start: 80,
        color: Colors.blue,
      ),
      RangeLinearGauge(
        end: 80,
        start: 100,
        color: Colors.green,
      ),
    ],
    'name': 'range-linear-gauge-1-vertical-rbg',
    'Do': 'RangeLinearGauge should be drawn with rgb-vertical',
  },

  //Inverse Horizontal
  {
    'inverse': true,
    'rangeLinear': [
      RangeLinearGauge(
        end: 0,
        start: 50,
        color: Colors.red,
      ),
      RangeLinearGauge(
        end: 50,
        start: 80,
        color: Colors.green,
      ),
      RangeLinearGauge(
        end: 80,
        start: 100,
        color: Colors.blue,
      ),
    ],
    'name': 'inverse-range-linear-gauge-rgb',
    'Do': 'RangeLinearGauge should be drawn with rgb-inverse',
  },

  //Inverse Vertical
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'inverse': true,
    'rangeLinear': [
      RangeLinearGauge(
        end: 0,
        start: 50,
        color: Colors.red,
      ),
      RangeLinearGauge(
        end: 50,
        start: 80,
        color: Colors.green,
      ),
      RangeLinearGauge(
        end: 80,
        start: 100,
        color: Colors.blue,
      ),
    ],
    'name': 'inverse-range-linear-gauge-rgb-vertical',
    'Do': 'RangeLinearGauge should be drawn with rgb-inverse-vertical',
  },
];

// Edge Cases Where the Linear Gauge should not be drawn
List edgeCases = [
  // Start Value is greater than End Value
  {
    'rangeLinear': [
      RangeLinearGauge(
        end: 0,
        start: 50,
        color: Colors.red,
      ),
    ],
    'name': 'range-linear-gauge-start-value-greater-than-end-value',
    'Do': 'Start> End Linear Gauge should not be drawn',
  },
  // Start Value is equal to End Value
  {
    'rangeLinear': [
      RangeLinearGauge(
        end: 0,
        start: 0,
        color: Colors.red,
      ),
    ],
    'name': 'range-linear-gauge-start-value-equal-to-end-value',
    'Do': 'Start= End Linear Gauge should not be drawn',
  },

  {
    'rangeLinear': [
      RangeLinearGauge(
        end: 20,
        start: 40,
        color: Colors.red,
      ),
    ],
    'name': 'range-linear-gauge-start-value-equal-to-end-value',
    'Do': 'Start= End Linear Gauge should not be drawn',
  },
  {
    'gaugeThickness': 30.0,
    'rangeLinear': [
      RangeLinearGauge(
        end: 0,
        start: 100,
        color: Colors.red,
      ),
    ],
    'name': 'range-linear-gauge-thickness-30',
    'Do': 'RangeLinearGauge should be drawn fully with thickness 30 ',
  }
];
