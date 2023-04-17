import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

List valueTests = [
  // Without MidHeight
  {
    'curves': [CustomCurve(midPoint: 50, curvePosition: CurvePosition.bottom)],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-midpoint-50-bottom',
    'Do': 'Custom Curve with midPoint 50 and curvePosition bottom',
  },
  {
    'curves': [CustomCurve(midPoint: 50, curvePosition: CurvePosition.top)],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-midpoint-50-top',
    'Do': 'Custom Curve with midPoint 50 and curvePosition top',
  },
  {
    'curves': [CustomCurve(midPoint: 50, curvePosition: CurvePosition.left)],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-midpoint-50-vertical-left',
    'Do': 'Custom Curve with midPoint 50 and curvePosition left',
  },
  {
    'curves': [CustomCurve(midPoint: 50, curvePosition: CurvePosition.right)],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-midpoint-50-vertical-right',
    'Do': 'Custom Curve with midPoint 50 and curvePosition right',
  },
];

List concaveConvexTests = [
  {
    'curves': [
      CustomCurve(
          midPoint: 50,
          startHeight: 100,
          midHeight: -90,
          endHeight: 100,
          curvePosition: CurvePosition.top),
      CustomCurve(
          midPoint: 50,
          startHeight: 100,
          midHeight: -90,
          endHeight: 100,
          curvePosition: CurvePosition.bottom)
    ],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-concave-midpoint-50-top-bottom',
    'Do':
        'Custom Curves with midPoint 50 and curvePosition top and bottom -concave',
  },
  //Left and right
  {
    'curves': [
      CustomCurve(
          midPoint: 50,
          startHeight: 100,
          midHeight: -90,
          endHeight: 100,
          curvePosition: CurvePosition.left),
      CustomCurve(
          midPoint: 50,
          startHeight: 100,
          midHeight: -90,
          endHeight: 100,
          curvePosition: CurvePosition.right)
    ],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-concave-midpoint-50-left-right',
    'Do':
        'Custom Curves with midPoint 50 and curvePosition left and right- concave',
  },
  {
    'curves': [
      CustomCurve(
          midPoint: 50,
          startHeight: 00,
          midHeight: 100,
          endHeight: 00,
          curvePosition: CurvePosition.top),
      CustomCurve(
          midPoint: 50,
          startHeight: 00,
          midHeight: 100,
          endHeight: 00,
          curvePosition: CurvePosition.bottom)
    ],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-convex-midpoint-50-top-bottom',
    'Do':
        'Custom Curves with midPoint 50 and curvePosition top and bottom- convex',
  },
  //Left and right
  {
    'curves': [
      CustomCurve(
          midPoint: 50,
          startHeight: 00,
          midHeight: 100,
          endHeight: 00,
          curvePosition: CurvePosition.left),
      CustomCurve(
          midPoint: 50,
          startHeight: 00,
          midHeight: 100,
          endHeight: 00,
          curvePosition: CurvePosition.right)
    ],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-convex-midpoint-50-left-right',
    'Do':
        'Custom Curves with midPoint 50 and curvePosition left and right- convex',
  },
];

List bezierTests = [
  {
    'curves': [
      CustomCurve(
          midPoint: 0,
          startHeight: 00,
          midHeight: 150,
          endHeight: 00,
          curveStyle: CurveStyle.bezier,
          color: Colors.blue,
          curvePosition: CurvePosition.bottom),
      CustomCurve(
          midPoint: 0,
          startHeight: 00,
          midHeight: 150,
          endHeight: 00,
          curveStyle: CurveStyle.bezier,
          curvePosition: CurvePosition.top)
    ],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-bezier-midpoint-0-top-bottom',
    'Do': 'Custom Curves with midPoint 0 and curvePosition top and bottom',
  },
  {
    'curves': [
      CustomCurve(
          midPoint: 0,
          startHeight: 00,
          midHeight: 150,
          endHeight: 00,
          curveStyle: CurveStyle.bezier,
          color: Colors.blue,
          curvePosition: CurvePosition.left),
      CustomCurve(
          midPoint: 0,
          startHeight: 00,
          midHeight: 150,
          endHeight: 00,
          curveStyle: CurveStyle.bezier,
          curvePosition: CurvePosition.right)
    ],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-bezier-midpoint-0-left-right',
    'Do': 'Custom Curves with midPoint 0 and curvePosition left and right',
  },
  {
    'curves': [
      CustomCurve(
          midPoint: 100,
          startHeight: 00,
          midHeight: 150,
          endHeight: 00,
          curveStyle: CurveStyle.bezier,
          color: Colors.blue,
          curvePosition: CurvePosition.bottom),
      CustomCurve(
          midPoint: 100,
          startHeight: 00,
          midHeight: 150,
          endHeight: 00,
          curveStyle: CurveStyle.bezier,
          curvePosition: CurvePosition.top)
    ],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-bezier-midpoint-100-top-bottom',
    'Do': 'Custom Curves with midPoint 100 and curvePosition top and bottom',
  },
  {
    'curves': [
      CustomCurve(
          midPoint: 100,
          startHeight: 00,
          midHeight: 150,
          endHeight: 00,
          curveStyle: CurveStyle.bezier,
          color: Colors.blue,
          curvePosition: CurvePosition.left),
      CustomCurve(
          midPoint: 100,
          startHeight: 00,
          midHeight: 150,
          endHeight: 00,
          curveStyle: CurveStyle.bezier,
          curvePosition: CurvePosition.right)
    ],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-bezier-midpoint-100-left-right',
    'Do': 'Custom Curves with midPoint 100 and curvePosition left and right',
  },
];

List extendLinearGaugeTests = [
  {
    'extendLinearGauge': 30.0,
    'curves': [
      CustomCurve(
          midPoint: 10,
          startHeight: 0,
          midHeight: 100,
          endHeight: 100,
          curveStyle: CurveStyle.bezier,
          curvePosition: CurvePosition.top,
          color: Colors.blue),
      CustomCurve(
        midPoint: 10,
        startHeight: 0,
        midHeight: 100,
        endHeight: 100,
        curveStyle: CurveStyle.bezier,
        curvePosition: CurvePosition.bottom,
      ),
    ],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-bezier-endHeight-100-top-bottom-extendLinearGauge',
    'Do':
        'Custom Curves with endHeight 100 and curvePosition top and bottom - extendLinearGauge',
  },
  // Left and right
  {
    'extendLinearGauge': 30.0,
    'curves': [
      CustomCurve(
          midPoint: 10,
          startHeight: 0,
          midHeight: 100,
          endHeight: 100,
          curveStyle: CurveStyle.bezier,
          curvePosition: CurvePosition.left,
          color: Colors.blue),
      CustomCurve(
        midPoint: 10,
        startHeight: 0,
        midHeight: 100,
        endHeight: 100,
        curveStyle: CurveStyle.bezier,
        curvePosition: CurvePosition.right,
      ),
    ],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-bezier-endHeight-100-left-right-extendLinearGauge',
    'Do':
        'Custom Curves with endHeight 100 and curvePosition left and right- extendLinearGauge',
  },
  // linear style
  {
    'extendLinearGauge': 30.0,
    'curves': [
      CustomCurve(
          midPoint: 10,
          startHeight: 0,
          midHeight: 100,
          endHeight: 0,
          curveStyle: CurveStyle.linear,
          curvePosition: CurvePosition.top,
          color: Colors.blue),
      CustomCurve(
        midPoint: 10,
        startHeight: 0,
        midHeight: 100,
        endHeight: 0,
        curveStyle: CurveStyle.linear,
        curvePosition: CurvePosition.bottom,
      ),
    ],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-linear-endHeight-100-top-bottom-exendLinearGauge',
    'Do':
        'Custom Curves with endHeight 100 and curvePosition top and bottom - extendLinearGauge',
  },
  {
    'extendLinearGauge': 30.0,
    'curves': [
      CustomCurve(
          midPoint: 10,
          startHeight: 0,
          midHeight: 100,
          endHeight: 0,
          curveStyle: CurveStyle.linear,
          curvePosition: CurvePosition.left,
          color: Colors.blue),
      CustomCurve(
        midPoint: 10,
        startHeight: 0,
        midHeight: 100,
        endHeight: 0,
        curveStyle: CurveStyle.linear,
        curvePosition: CurvePosition.right,
      ),
    ],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-linear-endHeight-100-left-right-extendLinearGauge',
    'Do':
        'Custom Curves with endHeight 100 and curvePosition left and right - extendLinearGauge',
  },
];

List strokeTests = [
  {
    'curves': [
      CustomCurve(
          midPoint: 50,
          startHeight: 0,
          midHeight: 100,
          endHeight: 0,
          curveStyle: CurveStyle.linear,
          paintStyle: PaintStyle.stroke,
          curvePosition: CurvePosition.top,
          color: Colors.blue),
      CustomCurve(
        midPoint: 50,
        startHeight: 0,
        midHeight: 100,
        endHeight: 0,
        curveStyle: CurveStyle.linear,
        paintStyle: PaintStyle.stroke,
        curvePosition: CurvePosition.bottom,
      ),
    ],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-linear-midHeight-100-top-bottom',
    'Do': 'Custom Curves with midHeight 100 and curvePosition top and bottom',
  },
  // Left and right
  {
    'curves': [
      CustomCurve(
          midPoint: 50,
          startHeight: 0,
          midHeight: 100,
          endHeight: 0,
          curveStyle: CurveStyle.linear,
          paintStyle: PaintStyle.stroke,
          curvePosition: CurvePosition.left,
          color: Colors.blue),
      CustomCurve(
        midPoint: 50,
        startHeight: 0,
        midHeight: 100,
        endHeight: 0,
        curveStyle: CurveStyle.linear,
        paintStyle: PaintStyle.stroke,
        curvePosition: CurvePosition.right,
      ),
    ],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-linear-midHeight-100-left-right',
    'Do': 'Custom Curves with midHeight 100 and curvePosition left and right',
  },
];

List startAndEndTests = [
  {
    'curves': [
      CustomCurve(
          start: 10,
          end: 90,
          midPoint: 50,
          startHeight: 0,
          midHeight: 100,
          endHeight: 100,
          curveStyle: CurveStyle.bezier,
          curvePosition: CurvePosition.top,
          color: Colors.blue),
      CustomCurve(
        start: 30,
        midPoint: 60,
        end: 80,
        startHeight: 0,
        midHeight: 100,
        endHeight: 100,
        curveStyle: CurveStyle.bezier,
        curvePosition: CurvePosition.bottom,
      ),
    ],
    'gaugeOrientation': GaugeOrientation.horizontal,
    'name': 'custom-curve-linear-midHeight-100-top-bottom-custom-start-end',
    'Do':
        'Custom Curves with midHeight 100 and curvePosition top and bottom and custom start and end',
  },
  // left and right
  {
    'curves': [
      CustomCurve(
          start: 10,
          end: 90,
          midPoint: 50,
          startHeight: 0,
          midHeight: 100,
          endHeight: 100,
          curveStyle: CurveStyle.bezier,
          curvePosition: CurvePosition.left,
          color: Colors.blue),
      CustomCurve(
        start: 30,
        midPoint: 60,
        end: 80,
        startHeight: 0,
        midHeight: 100,
        endHeight: 100,
        curveStyle: CurveStyle.bezier,
        curvePosition: CurvePosition.right,
      ),
    ],
    'gaugeOrientation': GaugeOrientation.vertical,
    'name': 'custom-curve-linear-midHeight-100-left-right-custom-start-end',
    'Do':
        'Custom Curves with midHeight 100 and curvePosition left and right and custom start and end',
  },
];

List allTests = [
  ...valueTests,
  ...concaveConvexTests,
  ...bezierTests,
  ...extendLinearGaugeTests,
  ...strokeTests,
  ...startAndEndTests,
];
