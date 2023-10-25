import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

List linearGaugeContainerBorderRadiusHorizontal = [
  {
    'extendLinearGauge': 10.0,
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.top,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
        thickness: 20, borderRadius: 10, edgeStyle: LinearEdgeStyle.startCurve),
    'name': 'start-edge-border-radius-linear-gauge-container',
    'Do':
        'Linear Gauge container should be drawn with starting edge of 10 border radius',
  },
  {
    'rulers': RulerStyle(
      rulerPosition: RulerPosition.top,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
    ),
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
        thickness: 20, borderRadius: 10, edgeStyle: LinearEdgeStyle.endCurve),
    'name': 'end-edge-border-radius-linear-gauge-container',
    'Do':
        'Linear Gauge container should be drawn with ending edge of 10 border radius',
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
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
        thickness: 10,
        borderRadius: 5,
        edgeStyle: LinearEdgeStyle.bothCurve,
        backgroundColor: Colors.pink),
    'name': 'both-edge-border-radius-linear-gauge-container',
    'Do':
        'Linear Gauge container should be drawn with both edge of 5 border radius',
  }
];

List linearGaugeContainerBorderRadiusVertical = [
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
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
        thickness: 20, borderRadius: 10, edgeStyle: LinearEdgeStyle.startCurve),
    'name': 'start-edge-border-radius-linear-gauge-container-vertical',
    'Do':
        'Linear Gauge container should be drawn vertically with starting edge of 10 border radius',
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
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
        thickness: 20, borderRadius: 10, edgeStyle: LinearEdgeStyle.endCurve),
    'name': 'end-edge-border-radius-linear-gauge-container-vertical',
    'Do':
        'Linear Gauge container should be drawn vertically with ending edge of 10 border radius',
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
    'linearGaugeBoxDecoration': const LinearGaugeBoxDecoration(
        thickness: 10,
        borderRadius: 5,
        edgeStyle: LinearEdgeStyle.bothCurve,
        backgroundColor: Colors.pink),
    'name': 'both-edge-border-radius-linear-gauge-container-vertical',
    'Do':
        'Linear Gauge container should be drawn vertically with both edge of 5 border radius',
  }
];

List allTests = [
  ...linearGaugeContainerBorderRadiusHorizontal,
  ...linearGaugeContainerBorderRadiusVertical,
];
