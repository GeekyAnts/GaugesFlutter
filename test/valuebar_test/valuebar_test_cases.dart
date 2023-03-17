import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

List valueBar = [
  // With no Offset - Horizontal
  {
    'valueBar': ValueBar(
      value: 0,
    ),
    'name': 'valuebar-value-0-horizontal',
    'Do': 'ValueBar with value 0 should be displayed in horizontal',
  },
  {
    'valueBar': ValueBar(
      value: 50,
    ),
    'name': 'valuebar-value-50-horizontal',
    'Do': 'ValueBar with value 50 should be displayed in horizontal',
  },
  {
    'valueBar': ValueBar(
      value: 100,
    ),
    'name': 'valuebar-value-100-horizontal',
    'Do': 'ValueBar with value 100 should be displayed in horizontal',
  },
  // With no Offset - Vertical
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': ValueBar(
      value: 0,
    ),
    'name': 'valuebar-value-0-vertical',
    'Do': 'ValueBar with value 0 should be displayed in vertical',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': ValueBar(
      value: 50,
    ),
    'name': 'valuebar-value-50-vertical',
    'Do': 'ValueBar with value 50 should be displayed in vertical',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': ValueBar(
      value: 100,
    ),
    'name': 'valuebar-value-100-vertical',
    'Do': 'ValueBar with value 100 should be displayed in vertical',
  },

  // With Offset - Horizontal
  {
    'valueBar': ValueBar(
      value: 50,
      offset: 10,
      position: ValueBarPosition.top,
    ),
    'name': 'valuebar-value-50-horizontal-offset-10-top',
    'Do':
        'ValueBar with value 50 should be displayed in horizontal with offset 10',
  },
  {
    'valueBar': ValueBar(
      value: 50,
      offset: 50,
      position: ValueBarPosition.top,
    ),
    'name': 'valuebar-value-50-horizontal-offset-50-top',
    'Do':
        'ValueBar with value 50 should be displayed in horizontal with offset 50',
  },

  {
    'valueBar': ValueBar(
      value: 50,
      position: ValueBarPosition.bottom,
    ),
    'name': 'valuebar-value-50-horizontal-bottom',
    'Do': 'ValueBar with value 50 should be displayed in horizontal',
  },

  // With Offset - Vertical
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': ValueBar(
      value: 50,
      position: ValueBarPosition.right,
    ),
    'name': 'valuebar-value-50-position-right-ruler-right',
    'Do': 'ValueBar with value 50 should be displayed in vertical',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': ValueBar(
      value: 50,
      position: ValueBarPosition.left,
    ),
    'name': 'valuebar-value-50-position-left-ruler-vertical',
    'Do': 'ValueBar with value 50 in vertical with Position Left',
  },

  // Inverse Ruler
  {
    'rulerInverse': true,
    'gaugeOrientation': GaugeOrientation.horizontal,
    'valueBar': ValueBar(
      value: 50,
      position: ValueBarPosition.top,
    ),
    'name': 'inverse-ruler-valuebar-value-50-horizontal-top',
    'Do':
        'ValueBar with value 50 should be displayed in horizontal in Inverse Ruler',
  }
];
