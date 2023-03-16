import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

List valueTests = [
  // Circle TestCases
  {
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'circle-value-0',
    'Do': 'Pointer should be drawn at 0 value with with circle shape',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'circle-value-50',
    'Do': 'Pointer should be drawn at 0 value with with circle shape',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 100,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'circle-value-100',
    'Do': 'Pointer should be drawn at 0 value with with circle shape',
  },

  // Rectangle TestCases
  {
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'rectangle-value-0',
    'Do': 'Pointer should be drawn at 0 value with with rectangle shape',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'rectangle-value-50',
    'Do': 'Pointer should be drawn at 0 value with with rectangle shape',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 100,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'rectangle-value-100',
    'Do': 'Pointer should be drawn at 0 value with with rectangle shape',
  },

  //Triangle TestCases
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'triangle-value-0',
    'Do': 'Pointer should be drawn at 0 value with with triangle shape',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'triangle-value-50',
    'Do': 'Pointer should be drawn at 0 value with with triangle shape',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 100,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'triangle-value-100',
    'Do': 'Pointer should be drawn at 0 value with with triangle shape',
  },

  //Diamond TestCases
  {
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'diamond-value-0',
    'Do': 'Pointer should be drawn at 0 value with with diamond shape',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'diamond-value-50',
    'Do': 'Pointer should be drawn at 0 value with with diamond shape',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 100,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'diamond-value-100',
    'Do': 'Pointer should be drawn at 0 value with with diamond shape',
  },
];

List positionTestCases = [
  {
    // Circle TestCases with PointerPosition
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'top-circle-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Circle shape  and pointerPosition.top',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'center-circle-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Circle shape and pointerPosition.center',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 50,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'bottom-circle-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with diamond shape and pointerPosition.bottom',
  },

  // Rectangle TestCases with PointerPosition
  {
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'top-rectangle-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Rectangle shape and pointerPosition.top',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'center-rectangle-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Rectangle shape and pointerPosition.center',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 50,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'bottom-rectangle-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Rectangle shape and pointerPosition.bottom',
  },

  // Triangle TestCases with PointerPosition
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'top-triangle-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Triangle shape and pointerPosition.top',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'center-triangle-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Triangle shape and pointerPosition.center',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 50,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'bottom-triangle-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Triangle shape and pointerPosition.bottom',
  },

  // Diamond TestCases with PointerPosition
  {
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'top-diamond-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Diamond shape and pointerPosition.top',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'center-diamond-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Diamond shape and pointerPosition.center',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 50,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'bottom-diamond-value-50',
    'Do':
        'Pointer should be drawn at 50 value with with Diamond shape and pointerPosition.bottom',
  },
];

List valueTestCasesVertical = [
  // Circle TestCases
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 0,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'circle-value-0-vertical',
    'Do': 'Pointer should be drawn at 0 value with with circle shape',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 50,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'circle-value-50-vertical',
    'Do': 'Pointer should be drawn at 0 value with with circle shape',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'circle-value-100-vertical',
    'Do': 'Pointer should be drawn at 0 value with with circle shape',
  },

  // Rectangle TestCases
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 0,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'rectangle-value-0-vertical',
    'Do': 'Pointer should be drawn at 0 value with with rectangle shape',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 50,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'rectangle-value-50-vertical',
    'Do': 'Pointer should be drawn at 0 value with with rectangle shape',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'rectangle-value-100-vertical',
    'Do': 'Pointer should be drawn at 0 value with with rectangle shape',
  },

  //Triangle TestCases
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 0,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'triangle-value-0-vertical',
    'Do': 'Pointer should be drawn at 0 value with with triangle shape',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 50,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'triangle-value-50-vertical',
    'Do': 'Pointer should be drawn at 0 value with with triangle shape',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'triangle-value-100-vertical',
    'Do': 'Pointer should be drawn at 0 value with with triangle shape',
  },

  //Diamond TestCases
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 0,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'diamond-value-0-vertical',
    'Do': 'Pointer should be drawn at 0 value with with diamond shape',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 50,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'diamond-value-50-vertical',
    'Do': 'Pointer should be drawn at 0 value with with diamond shape',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'diamond-value-100-vertical',
    'Do': 'Pointer should be drawn at 0 value with with diamond shape',
  },
];

List edgeCases = [
  //Cirlce TestCases
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      width: 150,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'circle-value-0-width-150',
    'Do': 'Pointer should be drawn at 0 value with with Circle width 150',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      width: 150,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'circle-value-0-width-150-vertical',
    'Do': 'Pointer should be drawn at 0 value with with diamond shape',
  },
  //Rectangle TestCases
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      width: 150,
      height: 10,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'rectangle-value-0-width-150',
    'Do': 'Pointer should be drawn at 0 value with with Rectangle width 150',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      width: 150,
      height: 10,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'rectangle-value-0-width-150-vertical',
    'Do': 'Pointer should be drawn at 0 value with with Rectangle width 150',
  },
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      width: 10,
      height: 150,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'rectangle-value-0-height-150',
    'Do': 'Pointer should be drawn at 0 value with with Rectangle width 150',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      width: 10,
      height: 150,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'rectangle-value-0-height-150-vertical',
    'Do': 'Pointer should be drawn at 0 value with with Rectangle width 150',
  },

  // Triangle TestCases
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      width: 150,
      height: 20,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'triangle-value-0-width-150',
    'Do':
        'Pointer should be drawn at 0 value with with Triangle width 150 & height 20',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      width: 150,
      height: 20,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'triangle-value-0-width-150-vertical',
    'Do':
        'Pointer should be drawn at 0 value with with Triangle width 150 & height 20',
  },
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      width: 20,
      height: 150,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'triangle-value-0-height-150',
    'Do':
        'Pointer should be drawn at 0 value with with Triangle height 150 & width 20',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      width: 20,
      height: 150,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'triangle-value-0-height-150-vertical',
    'Do':
        'Pointer should be drawn at 0 value with with Triangle height 150 & width 20',
  },

  //Diamond TestCases
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      width: 150,
      height: 20,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'diamond-value-0-width-150',
    'Do':
        'Pointer should be drawn at 0 value with with Diamond width 150 & height 20',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      width: 150,
      height: 20,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'diamond-value-0-width-150-vertical',
    'Do':
        'Pointer should be drawn at 0 value with with Diamond width 150 & height 20',
  },
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      width: 20,
      height: 150,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'diamond-value-0-height-150',
    'Do':
        'Pointer should be drawn at 0 value with with Diamond height 150 & width 20',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      width: 20,
      height: 150,
      value: 100,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'diamond-value-0-height-150-vertical',
    'Do':
        'Pointer should be drawn at 0 value with with Diamond height 150 & width 20',
  },

  // Edge Cases Circle
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      width: 20,
      value: 100,
      pointerPosition: PointerPosition.right,
    ),
    'name': 'circle-value-100-vertical-ruler-right-pointer',
    'Do':
        'Pointer should be drawn at 100 value with with Circle height 20 and PointerPosition.right',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      width: 20,
      value: 100,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'circle-value-100-width-20-vertical-ruler-center-pointer',
    'Do':
        'Pointer should be drawn at 100 value with with Circle height 20 and PointerPosition.center',
  },

  // Edge Cases Rectangle
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      width: 20,
      value: 100,
      pointerPosition: PointerPosition.right,
    ),
    'name': 'rectangle-value-100-vertical-ruler-right-pointer',
    'Do':
        'Pointer should be drawn at 100 value with with Rectangle height 20 and PointerPosition.right',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      width: 20,
      value: 100,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'rectangle-value-100-width-20-vertical-ruler-center-pointer',
    'Do':
        'Pointer should be drawn at 100 value with with Rectangle height 20 and PointerPosition.center',
  },

  // Edge Cases Triangle
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      width: 20,
      value: 100,
      pointerPosition: PointerPosition.right,
    ),
    'name': 'triangle-value-100-vertical-ruler-right-pointer',
    'Do':
        'Pointer should be drawn at 100 value with with Triangle height 20 and PointerPosition.right',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      width: 20,
      value: 100,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'triangle-value-100-width-20-vertical-ruler-center-pointer',
    'Do':
        'Pointer should be drawn at 100 value with with Triangle height 20 and PointerPosition.center',
  },

  // Edge Cases Diamond
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      width: 20,
      value: 100,
      pointerPosition: PointerPosition.right,
    ),
    'name': 'diamond-value-100-vertical-ruler-right-pointer',
    'Do':
        'Pointer should be drawn at 100 value with with Diamond height 20 and PointerPosition.right',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      width: 20,
      value: 100,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'diamond-value-100-width-20-vertical-ruler-center-pointer',
    'Do':
        'Pointer should be drawn at 100 value with with Diamond height 20 and PointerPosition.center',
  },
];

List colorTests = [
  //Circle
  {
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'circle-color-blue',
    'Do': 'Circle Pointer should be drawn at 50 value with with blue Color',
  },
  // Rectangle
  {
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'rectangle-color-blue',
    'Do': 'Rectangle Pointer should be drawn at 50 value with with blue Color',
  },
  // Triangle
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'triangle-color-blue',
    'Do': 'Triangle Pointer should be drawn at 50 value with with blue Color',
  },
  // Diamond
  {
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'diamond-color-blue',
    'Do': 'Diamond Pointer should be drawn at 50 value with with blue Color',
  },
];

List valueLabelTests = [
  // For value 50
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 50,
      showLabel: true,
      pointerPosition: PointerPosition.top,
      labelStyle: TextStyle(
        fontFamily: "Roboto",
        color: Colors.black,
      ),
    ),
    'name': 'value-50-label-triangle',
    'Do': 'Should display value label for pointer',
  },
  // For Value 0
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 0,
      showLabel: true,
      pointerPosition: PointerPosition.top,
      labelStyle: TextStyle(
        fontFamily: "Roboto",
        color: Colors.black,
      ),
    ),
    'name': 'value-0-label-triangle',
    'Do': 'Should display value label for pointer',
  },
  //For value 100
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 100,
      showLabel: true,
      pointerPosition: PointerPosition.top,
      labelStyle: TextStyle(
        fontFamily: "Roboto",
        color: Colors.black,
      ),
    ),
    'name': 'value-100-label-triangle',
    'Do': 'Should display value label for pointer',
  },
  {
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 100,
      showLabel: true,
      pointerPosition: PointerPosition.top,
      height: 100,
      width: 100,
      labelStyle: TextStyle(
        fontFamily: "Roboto",
        color: Colors.black,
      ),
    ),
    'name': 'value-100-label-triangle-hw-100',
    'Do': 'Should display value label for pointer',
  }
];
List extendLinearGaugePointerTestsHorizontal = [
  //circle center
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-circle-center-value-50',
    'Do': 'Circle Pointer should be drawn at 50 value with center position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 0,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-circle-center-value-0',
    'Do': 'Circle Pointer should be drawn at 0 value with center position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 100,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-circle-center-value-100',
    'Do': 'Circle Pointer should be drawn at 100 value with center position',
  },

  //circle-bottom

  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'extendLinearGauge-circle-bottom-value-50',
    'Do': 'Circle Pointer should be drawn at 50 value with bottom position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 0,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'extendLinearGauge-circle-bottom-value-0',
    'Do': 'Circle Pointer should be drawn at 0 value with bottom position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 100,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'extendLinearGauge-circle-bottom-value-100',
    'Do': 'Circle Pointer should be drawn at 100 value with bottom position',
  },

  //circle-top

  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'extendLinearGauge-circle-top-value-50',
    'Do': 'Circle Pointer should be drawn at 50 value with top position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 0,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'extendLinearGauge-circle-top-value-0',
    'Do': 'Circle Pointer should be drawn at 0 value with top position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 100,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'extendLinearGauge-circle-top-value-100',
    'Do': 'Circle Pointer should be drawn at 100 value with top position',
  },

  {
    'extendLinearGauge': 100.0,
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 0,
      width: 20,
      height: 20,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'extendLinearGauge-circle-left-value-0-height-20-width-20-inverse',
    'Do':
        'Circle Pointer should be drawn at 0 value with left position and 20 height and 20 width for inverse',
  },

  //triangle with random values and positions
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 60,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'extendLinearGauge-triangle-top-value-60',
    'Do': 'Triangle Pointer should be drawn at 60 value with top position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 0,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-triangle-center-value-0',
    'Do': 'Triangle Pointer should be drawn at 0 value with center position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 100,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'extendLinearGauge-triangle-bottom-value-100',
    'Do': 'Triangle Pointer should be drawn at 100 value with bottom position',
  },

  {
    'extendLinearGauge': 100.0,
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 100,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'extendLinearGauge-triangle-bottom-value-100-inverse',
    'Do':
        'Triangle Pointer should be drawn at 100 value with bottom position inverse',
  },

  //diamond with random values and positions
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 20,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'extendLinearGauge-diamond-top-value-20',
    'Do': 'Diamond Pointer should be drawn at 20 value with top position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 80,
      height: 30,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'extendLinearGauge-diamond-top-value-80-height-30',
    'Do':
        'Diamond Pointer should be drawn at 80 value with top position and height 30',
  },
  {
    'extendLinearGauge': 100.0,
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 80,
      height: 30,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'extendLinearGauge-diamond-top-value-80-height-30-inverse',
    'Do':
        'Diamond Pointer should be drawn at 80 value with top position and height 30 inverse',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 0,
      height: 30,
      width: 20,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-diamond-center-value-0-height-30-width-20',
    'Do':
        'Diamond Pointer should be drawn at 0 value with center position and height 30 & width 20',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 100,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'extendLinearGauge-diamond-bottom-value-100',
    'Do': 'Diamond Pointer should be drawn at 100 value with bottom position',
  },
  {
    'extendLinearGauge': 10.0,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 90,
      height: 40,
      width: 30,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'extendLinearGauge-diamond-bottom-value-90-height-40-width-30',
    'Do':
        'Diamond Pointer should be drawn at 90 value with bottom position and 40 height & 30 width',
  },
  //rectangle with random values and positions
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 30,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'extendLinearGauge-rectangle-top-value-30',
    'Do': 'Rectangle Pointer should be drawn at 30 value with top position',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 0,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-rectangle-center-value-0',
    'Do': 'Rectangle Pointer should be drawn at 0 value with center position',
  },
  {
    'extendLinearGauge': 100.0,
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 0,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-rectangle-center-value-0-inverse',
    'Do':
        'Rectangle Pointer should be drawn at 0 value with center position inverse',
  },
  {
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 0,
      height: 40,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-rectangle-center-value-0-height-40',
    'Do':
        'Rectangle Pointer should be drawn at 0 value with center position and height 40',
  },
  {
    'extendLinearGauge': 50.0,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 100,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'extendLinearGauge-rectangle-bottom-value-100',
    'Do': 'Rectangle Pointer should be drawn at 100 value with bottom position',
  },
];

List extendLinearGaugePointerTestsVertical = [
  //circle with random values and positions for vertical orientation
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-circle-center-value-50-vertical',
    'Do':
        'Circle Pointer should be drawn at 50 value with center position vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 0,
      width: 20,
      height: 20,
      pointerPosition: PointerPosition.left,
    ),
    'name': 'extendLinearGauge-circle-left-value-0-height-20-width-20-vertical',
    'Do':
        'Circle Pointer should be drawn at 0 value with left position and 20 height and 20 width for vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 0,
      width: 20,
      height: 20,
      pointerPosition: PointerPosition.left,
    ),
    'name':
        'extendLinearGauge-circle-left-value-0-height-20-width-20-vertical-inverse',
    'Do':
        'Circle Pointer should be drawn inverse at 0 value with left position and 20 height and 20 width for vertical ',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      color: Colors.blue,
      value: 90,
      pointerPosition: PointerPosition.right,
    ),
    'name': 'extendLinearGauge-circle-right-value-90-vertical',
    'Do':
        'Circle Pointer should be drawn at 90 value with right position for vertical',
  },

  //triangle with random values and positions for vertical orientation

  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-triangle-center-value-50-vertical',
    'Do':
        'Triangle Pointer should be drawn at 50 value with center position vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 0,
      width: 20,
      height: 20,
      pointerPosition: PointerPosition.left,
    ),
    'name':
        'extendLinearGauge-triangle-left-value-0-height-20-width-20-vertical',
    'Do':
        'Triangle Pointer should be drawn at 0 value with left position and 20 height and 20 width for vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 0,
      width: 20,
      height: 20,
      pointerPosition: PointerPosition.left,
    ),
    'name':
        'extendLinearGauge-triangle-left-value-0-height-20-width-20-vertical-inverse',
    'Do':
        'Triangle Pointer should be drawn inverse at 0 value with left position and 20 height and 20 width for vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      color: Colors.blue,
      value: 30,
      width: 20,
      height: 20,
      pointerPosition: PointerPosition.right,
    ),
    'name':
        'extendLinearGauge-triangle-right-value-30-height-20-width-20-vertical',
    'Do':
        'Triangle Pointer should be drawn at 30 value with right position and 20 height and 20 width for vertical',
  },
  //diamond with random values and positions for vertical orientation

  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-diamond-center-value-50-vertical',
    'Do':
        'Diamond Pointer should be drawn at 50 value with center position vertical',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-diamond-center-value-50-vertical-inverse',
    'Do':
        'Diamond Pointer should be drawn inverse at 50 value with center position vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 0,
      width: 40,
      height: 40,
      pointerPosition: PointerPosition.left,
    ),
    'name':
        'extendLinearGauge-diamond-left-value-0-height-40-width-40-vertical',
    'Do':
        'Diamond Pointer should be drawn at 0 value with left position and 40 height and 40 width for vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      color: Colors.blue,
      value: 30,
      width: 30,
      height: 50,
      pointerPosition: PointerPosition.right,
    ),
    'name':
        'extendLinearGauge-diamond-right-value-30-height-50-width-30-vertical',
    'Do':
        'Diamond Pointer should be drawn at 30 value with right position and 50 height and 30 width for vertical',
  },
  //rectangle with random values and positions for vertical orientation

  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'extendLinearGauge': 100.0,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 50,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'extendLinearGauge-rectangle-center-value-50-vertical',
    'Do':
        'Rectangle Pointer should be drawn at 50 value with center position vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 0,
      width: 40,
      height: 40,
      pointerPosition: PointerPosition.left,
    ),
    'name':
        'extendLinearGauge-rectangle-left-value-0-height-40-width-40-vertical',
    'Do':
        'Rectangle Pointer should be drawn at 0 value with left position and 40 height and 40 width for vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 30,
      width: 60,
      height: 20,
      pointerPosition: PointerPosition.right,
    ),
    'name':
        'extendLinearGauge-rectangle-right-value-30-height-20-width-60-vertical',
    'Do':
        'Rectangle Pointer should be drawn at 30 value with right position and 20 height and 60 width for vertical',
  },
  {
    'extendLinearGauge': 100.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'rulers': const RulerStyle(
      rulerPosition: RulerPosition.center,
      inverseRulers: true,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      color: Colors.blue,
      value: 30,
      width: 60,
      height: 20,
      pointerPosition: PointerPosition.right,
    ),
    'name':
        'extendLinearGauge-rectangle-right-value-30-height-20-width-60-vertical-inverse',
    'Do':
        'Rectangle Pointer should be drawn inverse at 30 value with right position and 20 height and 60 width for vertical',
  },
];

List extendLinearGaugePointersAlltests = [
  ...extendLinearGaugePointerTestsHorizontal,
  ...extendLinearGaugePointerTestsVertical,
];

// Add a key value pair as 'inverse' : true to test the inverse pointer

List inverseValueTests = [
  //  Inverse Circle TestCases with PointerPosition
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 30,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'top-circle-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Circle shape  and pointerPosition.top and inverse rulers',
  },
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 30,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'center-circle-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Circle shape and pointerPosition.center and inverse rulers',
  },
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.circle,
      value: 30,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'bottom-circle-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with diamond shape and pointerPosition.bottom and inverse rulers',
  },

  // Inverse Rectangle TestCases with PointerPosition
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 30,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'top-rectangle-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Rectangle shape  and pointerPosition.top and inverse rulers',
  },
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 30,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'center-rectangle-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Rectangle shape and pointerPosition.center and inverse rulers',
  },
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.rectangle,
      value: 30,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'bottom-rectangle-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Rectangle shape and pointerPosition.bottom and inverse rulers',
  },

  // Inverse Triangle TestCases with PointerPosition
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 30,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'top-triangle-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Triangle shape  and pointerPosition.top and inverse rulers',
  },
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 30,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'center-triangle-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Triangle shape and pointerPosition.center and inverse rulers',
  },
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.triangle,
      value: 30,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'bottom-triangle-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Triangle shape and pointerPosition.bottom and inverse rulers',
  },

  // Inverse Diamond TestCases with PointerPosition
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 30,
      pointerPosition: PointerPosition.top,
    ),
    'name': 'top-diamond-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Diamond shape  and pointerPosition.top and inverse rulers',
  },
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 30,
      pointerPosition: PointerPosition.center,
    ),
    'name': 'center-diamond-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Diamond shape and pointerPosition.center and inverse rulers',
  },
  {
    'inverse': true,
    'pointer': const Pointer(
      shape: PointerShape.diamond,
      value: 30,
      pointerPosition: PointerPosition.bottom,
    ),
    'name': 'bottom-diamond-value-30-inverse',
    'Do':
        'Pointer should be drawn at 30 value with with Diamond shape and pointerPosition.bottom and inverse rulers',
  },
];

List allTests = [
  ...edgeCases,
  ...colorTests,
  ...valueTests,
  ...valueLabelTests,
  ...inverseValueTests
];
