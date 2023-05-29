import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

List valueTestsHorizontal = [
  {
    'valueBar': [
      const ValueBar(value: 50),
    ],
    'name': 'value-bar-value-50',
    'Do': 'ValueBar should be drawn till 50 value',
  },
  {
    'valueBar': [
      const ValueBar(value: 0),
    ],
    'name': 'value-bar-value-0',
    'Do': 'ValueBar should be drawn till 0 value',
  },
  {
    'valueBar': [
      const ValueBar(value: 100),
    ],
    'name': 'value-bar-value-100',
    'Do': 'ValueBar should be drawn till 100 value',
  },
  {
    'valueBar': [
      const ValueBar(value: 35),
    ],
    'name': 'value-bar-value-35',
    'Do': 'ValueBar should be drawn till 35 value',
  },
  {
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.center,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
      inverseRulers: true,
    ),
    'valueBar': [
      const ValueBar(value: 35),
    ],
    'name': 'value-bar-value-35-inverse',
    'Do': 'Inverse ValueBar should be drawn till 35 value',
  },
];

List multipleValueBarHorizontal = [
  {
    'valueBar': [
      ValueBar(
        value: 100,
        color: Colors.orange[800]!,
        position: ValueBarPosition.top,
      ),
      const ValueBar(
        value: 100,
        color: Colors.white,
        position: ValueBarPosition.center,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.bottom,
      ),
    ],
    'name': 'multi-value-bar-value-100',
    'Do':
        'Multiple ValueBar should be drawn till 100 value with diff colors & positions',
  },
  {
    'valueBar': [
      ValueBar(
        value: 50,
        color: Colors.orange[800]!,
        position: ValueBarPosition.top,
      ),
      const ValueBar(
        value: 60,
        color: Colors.black,
        position: ValueBarPosition.center,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.bottom,
      ),
    ],
    'name': 'multi-value-bar-value-50-60-100',
    'Do':
        'Multiple ValueBar should be drawn till 50,60,100 value with diff colors & positions',
  },
  {
    'valueBar': [
      ValueBar(
        value: 100,
        color: Colors.orange[800]!,
        position: ValueBarPosition.top,
        valueBarThickness: 10,
      ),
      const ValueBar(
        value: 100,
        color: Colors.blue,
        position: ValueBarPosition.top,
        valueBarThickness: 10,
        offset: 10,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.top,
        valueBarThickness: 10,
        offset: 20,
      ),
    ],
    'name': 'multi-value-bar-value-100-thickness-10-top',
    'Do':
        'Multiple ValueBar of 10 thickness should be drawn till 100 value with diff colors & top position',
  },
  {
    'valueBar': [
      ValueBar(
        value: 100,
        color: Colors.orange[800]!,
        position: ValueBarPosition.center,
        valueBarThickness: 30,
      ),
      const ValueBar(
        value: 100,
        color: Colors.blue,
        position: ValueBarPosition.center,
        valueBarThickness: 20,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.center,
        valueBarThickness: 10,
      ),
    ],
    'name': 'multi-value-bar-value-100-thickness-30-20-10-center',
    'Do':
        'Multiple ValueBar of 30,20,10 thickness should be drawn till 100 value with diff colors & center position',
  },
  {
    'valueBar': [
      ValueBar(
        value: 100,
        color: Colors.orange[800]!,
        position: ValueBarPosition.center,
        valueBarThickness: 10,
        offset: 20,
      ),
      const ValueBar(
        value: 100,
        color: Colors.white,
        position: ValueBarPosition.center,
        valueBarThickness: 10,
        offset: 10,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.center,
        valueBarThickness: 10,
      ),
    ],
    'name': 'multi-value-bar-value-100-offset-20-10-0-thickness-10-center',
    'Do':
        'Multiple ValueBar of 10 thickness and 20, 10 , 0 offset should be drawn till 100 value with diff colors & center position',
  },
  {
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
      thickness: 10,
      backgroundColor: Colors.grey,
    ),
    'valueBar': [
      ValueBar(
        value: 100,
        color: Colors.orange[800]!,
        position: ValueBarPosition.bottom,
        valueBarThickness: 10,
      ),
      const ValueBar(
        value: 100,
        color: Colors.blue,
        position: ValueBarPosition.bottom,
        valueBarThickness: 10,
        offset: 10,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.bottom,
        valueBarThickness: 10,
        offset: 20,
      ),
    ],
    'name': 'multi-value-bar-value-100-offset-0-10-20-thickness-10-bottom',
    'Do':
        'Multiple ValueBar of 10 thickness and offset 0-10-20 should be drawn till 100 value with diff colors & bottom position',
  },
];

List valueTestsVertical = [
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [
      const ValueBar(value: 50),
    ],
    'name': 'value-bar-value-50-vertical',
    'Do': 'Vertical  ValueBar should be drawn till 50 value',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [
      const ValueBar(value: 0),
    ],
    'name': 'value-bar-value-0-vertical',
    'Do': 'Vertical ValueBar should be drawn till 0 value',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [
      const ValueBar(value: 100),
    ],
    'name': 'value-bar-value-100-vertical',
    'Do': 'Vertical ValueBar should be drawn till 100 value',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [
      const ValueBar(value: 35),
    ],
    'name': 'value-bar-value-35-vertical',
    'Do': 'Vertical ValueBar should be drawn till 35 value',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.center,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
      inverseRulers: true,
    ),
    'valueBar': [
      const ValueBar(value: 35),
    ],
    'name': 'value-bar-value-35-inverse-vertical',
    'Do': 'Vertical Inverse ValueBar should be drawn till 35 value',
  },
];

List multipleValueBarVertical = [
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [
      ValueBar(
        value: 100,
        color: Colors.orange[800]!,
        position: ValueBarPosition.left,
      ),
      const ValueBar(
        value: 100,
        color: Colors.white,
        position: ValueBarPosition.center,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.right,
      ),
    ],
    'name': 'multi-value-bar-value-100-vertical',
    'Do':
        'Multiple vertical ValueBar should be drawn till 100 value with diff colors & positions',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [
      ValueBar(
        value: 100,
        color: Colors.orange[800]!,
        position: ValueBarPosition.left,
        valueBarThickness: 10,
      ),
      const ValueBar(
        value: 100,
        color: Colors.blue,
        position: ValueBarPosition.left,
        valueBarThickness: 10,
        offset: 10,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.left,
        valueBarThickness: 10,
        offset: 20,
      ),
    ],
    'name': 'multi-value-bar-value-100-thickness-10-left-vertical',
    'Do':
        'Multiple vertical ValueBar of 10 thickness should be drawn till 100 value with diff colors & left position',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [
      ValueBar(
        value: 100,
        color: Colors.orange[800]!,
        position: ValueBarPosition.center,
        valueBarThickness: 30,
      ),
      const ValueBar(
        value: 100,
        color: Colors.blue,
        position: ValueBarPosition.center,
        valueBarThickness: 20,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.center,
        valueBarThickness: 10,
      ),
    ],
    'name': 'multi-value-bar-value-100-thickness-30-20-10-center-vertical',
    'Do':
        'Multiple Vertical ValueBar of 30,20,10 thickness should be drawn till 100 value with diff colors & center position',
  },
  {
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
      thickness: 10,
      backgroundColor: Colors.grey,
    ),
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [
      ValueBar(
        value: 100,
        color: Colors.orange[800]!,
        position: ValueBarPosition.right,
        valueBarThickness: 10,
      ),
      const ValueBar(
        value: 100,
        color: Colors.blue,
        position: ValueBarPosition.right,
        valueBarThickness: 10,
        offset: 10,
      ),
      ValueBar(
        value: 100,
        color: Colors.green[800]!,
        position: ValueBarPosition.right,
        valueBarThickness: 10,
        offset: 20,
      ),
    ],
    'name':
        'multi-value-bar-value-100-offset-0-10-20-thickness-10-right-vertical',
    'Do':
        'Multiple Vertical ValueBar of 10 thickness and offset 0-10-20 should be drawn till 100 value with diff colors & right position',
  },
];

List gaugeThickness = [
  {
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
      thickness: 20,
    ),
    'valueBar': [
      const ValueBar(
        value: 50,
        valueBarThickness: 10,
      ),
    ],
    'name': 'value-bar-thickness-10-value-50-gauge-thickness-20',
    'Do':
        'ValueBar should be drawn till 50 value with thickness 10 and gauge thickness 20',
  },
  {
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
      thickness: 20,
    ),
    'valueBar': [
      const ValueBar(
        value: 50,
        valueBarThickness: 10,
        position: ValueBarPosition.bottom,
      ),
    ],
    'name': 'value-bar-thickness-10-value-50-gauge-thickness-20-bottom',
    'Do':
        'ValueBar should be drawn till 50 value with thickness 10 and gauge thickness 20 at bottom',
  },
  {
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
      thickness: 20,
    ),
    'valueBar': [
      const ValueBar(
        value: 50,
        valueBarThickness: 10,
        position: ValueBarPosition.bottom,
        offset: -10,
      ),
    ],
    'name':
        'value-bar-thickness-10-value-50-gauge-thickness-20-bottom-negative-offset',
    'Do':
        'ValueBar should be drawn till 50 value with negative offset with thickness 10 and gauge thickness 20 at bottom ',
  },
];

List extendLinearGauge = [
  {
    'extendLinearGauge': 50.0,
    'valueBar': [
      const ValueBar(value: 50),
    ],
    'name': 'extendLinearGauge-value-bar-value-50',
    'Do': 'ValueBar should be drawn till 50 value with 50 extendedLinearGauge',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 50.0,
    'valueBar': [
      const ValueBar(value: 50),
    ],
    'name': 'extendLinearGauge-value-bar-value-50-vertical',
    'Do':
        'Vertical ValueBar should be drawn till 50 value with 50 extendedLinearGauge',
  },
  {
    'extendLinearGauge': 100.0,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(value: 30),
    ],
    'name': 'extendLinearGauge-value-bar-value-30-inverse',
    'Do':
        'Inverse ValueBar should be drawn till 30 value with 100 extendedLinearGauge',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 50.0,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(value: 100),
    ],
    'name': 'extendLinearGauge-value-bar-value-100-vertical-inverse',
    'Do':
        'Inverse Vertical ValueBar should be drawn till 100 value with 50 extendedLinearGauge',
  },
  {
    'extendLinearGauge': 50.0,
    'fillExtend': true,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.top,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(value: 100),
    ],
    'name': 'fillExtend-extendLinearGauge-value-bar-value-100',
    'Do':
        'ValueBar with fillExtend true should be drawn till 100 value with 50 extendedLinearGauge',
  },
  {
    'extendLinearGauge': 50.0,
    'fillExtend': true,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.bottom,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(value: 50),
    ],
    'name': 'fillExtend-extendLinearGauge-value-bar-value-50',
    'Do':
        'ValueBar with fillExtend true should be drawn till 50 value with 50 extendedLinearGauge',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 50.0,
    'fillExtend': true,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.left,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(value: 100),
    ],
    'name': 'fillExtend-extendLinearGauge-value-bar-value-100-vertical',
    'Do':
        'Vertical ValueBar with fillExtend true should be drawn till 100 value with 50 extendedLinearGauge',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 50.0,
    'fillExtend': true,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.right,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(value: 50),
    ],
    'name': 'fillExtend-extendLinearGauge-value-bar-value-50-vertical',
    'Do':
        'Vertical ValueBar with fillExtend true should be drawn till 50 value with 50 extendedLinearGauge',
  },
];

List borderRadiusHorizontal = [
  {
    'extendLinearGauge': 10.0,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.top,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(
        value: 50,
        borderRadius: 10,
        valueBarThickness: 20,
        edgeStyle: LinearEdgeStyle.startCurve,
      ),
    ],
    'name': 'start-edge-border-radius-value-bar',
    'Do': 'ValueBar should be drawn with starting edge of 50 border radius',
  },
  {
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.top,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(
        value: 80,
        borderRadius: 10,
        valueBarThickness: 10,
        edgeStyle: LinearEdgeStyle.endCurve,
      ),
    ],
    'name': 'end-edge-border-radius-value-bar',
    'Do': 'ValueBar should be drawn with ending edge of 80 border radius',
  },
  {
    'extendLinearGauge': 10.0,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.top,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(
        value: 20,
        borderRadius: 10,
        edgeStyle: LinearEdgeStyle.bothCurve,
      ),
    ],
    'name': 'both-edge-border-radius-value-bar',
    'Do': 'ValueBar should be drawn with both edge of 20 border radius',
  }
];
List borderRadiusVertical = [
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 10.0,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.left,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(
        value: 20,
        borderRadius: 5,
        valueBarThickness: 40,
        edgeStyle: LinearEdgeStyle.startCurve,
      ),
    ],
    'name': 'start-edge-border-radius-value-bar-vertical',
    'Do':
        'ValueBar should be drawn vertically with starting edge of 5 border radius',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.right,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(
        value: 20,
        borderRadius: 10,
        valueBarThickness: 10,
        edgeStyle: LinearEdgeStyle.endCurve,
      ),
    ],
    'name': 'end-edge-border-radius-value-bar-vertical',
    'Do':
        'ValueBar should be drawn vertically with ending edge of 10 border radius',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 10.0,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.right,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'valueBar': [
      const ValueBar(
        value: 20,
        borderRadius: 10,
        valueBarThickness: 25,
        edgeStyle: LinearEdgeStyle.bothCurve,
      ),
    ],
    'name': 'both-edge-border-radius-value-bar-vertical',
    'Do':
        'ValueBar should be drawn vertically with both edge of 10 border radius',
  }
];

List allTests = [
  ...valueTestsHorizontal,
  ...valueTestsVertical,
  ...multipleValueBarHorizontal,
  ...multipleValueBarVertical,
  ...gaugeThickness,
  ...extendLinearGauge,
  ...borderRadiusHorizontal,
  ...borderRadiusVertical,
];
