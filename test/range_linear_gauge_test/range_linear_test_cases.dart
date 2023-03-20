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
  // Start Value is equal to End Value
  {
    'rangeLinear': [
      RangeLinearGauge(
        end: 20,
        start: 20,
        color: Colors.red,
      ),
    ],
    'name': 'range-linear-gauge-start-value-equal-to-end-value',
    'Do': 'Start= End Linear Gauge should  be drawn at the start',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'rangeLinear': [
      RangeLinearGauge(
        end: 20,
        start: 20,
        color: Colors.red,
      ),
    ],
    'name': 'range-linear-gauge-start-value-equal-to-end-value-vertical',
    'Do': 'Start= End Linear Gauge should  be drawn at the start vertical',
  },
];

List gaugeThickness = [
  {
    'gaugeThickness': 30.0,
    'rangeLinear': [
      RangeLinearGauge(
        start: 0,
        end: 100,
        color: Colors.red,
      ),
    ],
    'name': 'range-linear-gauge-thickness-30-red-only',
    'Do': 'RangeLinearGauge should be drawn fully with thickness 30',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'gaugeThickness': 30.0,
    'rangeLinear': [
      RangeLinearGauge(
        start: 0,
        end: 100,
        color: Colors.red,
      ),
    ],
    'name': 'range-linear-gauge-thickness-30-vertical-red-only',
    'Do':
        'RangeLinearGauge should be drawn fully with thickness 30 with vertical ',
  }
];

// Extend Linear Gauge
List extendLinearGauge = [
  {
    'extendLinearGauge': 50.0,
    'rangeLinear': [
      RangeLinearGauge(
        end: 50,
        start: 0,
        color: Colors.red,
      ),
      RangeLinearGauge(
        end: 100,
        start: 50,
        color: Colors.green,
      ),
    ],
    'name': 'range-linear-gauge-0-to-50-to-100-extend-50',
    'Do':
        'RangeLinearGauge should be drawn 0-to-50-to-100 with rg and extend 50',
  },
  {
    'extendLinearGauge': 50.0,
    'rangeLinear': [
      RangeLinearGauge(
        end: 20,
        start: 50,
        color: Colors.red,
      ),
      RangeLinearGauge(
        start: 50,
        end: 100,
        color: Colors.green,
      ),
    ],
    'name': 'range-linear-gauge-20-to-50-to-100-extend-50',
    'Do':
        'RangeLinearGauge should be drawn 20-to-50-to-100 with rg and extend 50',
  },
  {
    'extendLinearGauge': 50.0,
    'rangeLinear': [
      RangeLinearGauge(
        start: 0,
        end: 50,
        color: Colors.red,
      ),
      RangeLinearGauge(
        start: 50,
        end: 80,
        color: Colors.green,
      ),
      RangeLinearGauge(
        start: 80,
        end: 100,
        color: Colors.blue,
      ),
    ],
    'name': 'range-linear-gauge-extend',
    'Do': 'RangeLinearGauge should be drawn with rgb and extend 50',
  },
  {
    'extendLinearGauge': 50.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'rangeLinear': [
      RangeLinearGauge(
        start: 0,
        end: 50,
        color: Colors.red,
      ),
      RangeLinearGauge(
        start: 50,
        end: 80,
        color: Colors.green,
      ),
      RangeLinearGauge(
        start: 80,
        end: 100,
        color: Colors.blue,
      ),
    ],
    'name': 'range-linear-gauge-extend-vertical',
    'Do': 'RangeLinearGauge should be drawn with rgb-vertical and extend 50',
  },
  {
    'extendLinearGauge': 50.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'rangeLinear': [
      RangeLinearGauge(
        start: 0,
        end: 50,
        color: Colors.red,
      ),
      RangeLinearGauge(
        start: 50,
        end: 100,
        color: Colors.green,
      ),
    ],
    'name': 'range-linear-gauge-0-to-50-to-100-extend-50-vertical',
    'Do':
        'RangeLinearGauge should be drawn vertically 0-to-50-to-100 with rg and extend 50',
  },
  {
    'extendLinearGauge': 50.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'rangeLinear': [
      RangeLinearGauge(
        start: 20,
        end: 50,
        color: Colors.red,
      ),
      RangeLinearGauge(
        start: 50,
        end: 100,
        color: Colors.green,
      ),
    ],
    'name': 'range-linear-gauge-20-to-50-to-100-extend-50-vertical',
    'Do':
        'RangeLinearGauge should be drawn vertically 20-to-50-to-100 with rg and extend 50',
  },
];

List startAndEndTest = [
  {
    'start': 100.0,
    'end': 500.0,
    'rangeLinear': [
      RangeLinearGauge(
        start: 100,
        end: 300,
        color: Colors.red,
      ),
      RangeLinearGauge(
        start: 300,
        end: 400,
        color: Colors.blue,
      ),
      RangeLinearGauge(
        start: 400,
        end: 500,
        color: Colors.green,
      ),
    ],
    'name': 'range-linear-gauge-start-100-end-500-rgb',
    'Do': 'RangeLinearGauge should be drawn fully with thickness 30 ',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'start': 100.0,
    'end': 500.0,
    'rangeLinear': [
      RangeLinearGauge(
        start: 100,
        end: 300,
        color: Colors.red,
      ),
      RangeLinearGauge(
        start: 300,
        end: 400,
        color: Colors.blue,
      ),
      RangeLinearGauge(
        start: 400,
        end: 500,
        color: Colors.green,
      ),
    ],
    'name': 'range-linear-gauge-start-100-end-500-rgb-vertical',
    'Do': 'RangeLinearGauge should be drawn fully with thickness 30 vertical',
  },
  {
    'start': -500.0,
    'end': 500.0,
    'rangeLinear': [
      RangeLinearGauge(
        start: -500,
        end: 0,
        color: Colors.red,
      ),
      RangeLinearGauge(
        start: 0,
        end: 300,
        color: Colors.blue,
      ),
      RangeLinearGauge(
        start: 300,
        end: 500,
        color: Colors.blue,
      ),
    ],
    'name': 'range-linear-gauge-start-negative-500-end-500-rgb',
    'Do':
        'RangeLinearGauge should be drawn with rgb and start negative 500 and end 500',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'start': -500.0,
    'end': 500.0,
    'rangeLinear': [
      RangeLinearGauge(
        start: -500,
        end: 0,
        color: Colors.red,
      ),
      RangeLinearGauge(
        start: 0,
        end: 300,
        color: Colors.blue,
      ),
      RangeLinearGauge(
        start: 300,
        end: 500,
        color: Colors.blue,
      ),
    ],
    'name': 'range-linear-gauge-start-negative-500-end-500-rgb-vertical',
    'Do':
        'RangeLinearGauge should be drawn with rgb and start negative 500 and end 500 vertical',
  },
];

List allTests = [
  ...edgeCases,
  ...gaugeThickness,
  ...extendLinearGauge,
  ...startAndEndTest,
];
