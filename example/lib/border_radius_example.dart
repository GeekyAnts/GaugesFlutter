import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class BorderRadiusExample extends StatefulWidget {
  const BorderRadiusExample({super.key});

  @override
  State<BorderRadiusExample> createState() => _BorderRadiusExampleState();
}

class _BorderRadiusExampleState extends State<BorderRadiusExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          enableAnimation: true,
          extendLinearGauge: 9,
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
            thickness: 20,
            borderRadius: 10,
            edgeStyle: LinearEdgeStyle.bothCurve,
          ),
          gaugeOrientation: GaugeOrientation.horizontal,
          rulers: const RulerStyle(
            inverseRulers: false,
            rulerPosition: RulerPosition.top,
          ),
        ),
      ),
    );
  }
}
