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

List allTests = [
  ...edgeCases,
  ...colorTests,
  ...valueTests,
  ...valueLabelTests
];
