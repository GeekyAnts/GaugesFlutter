import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class CustomCurveExample extends StatelessWidget {
  const CustomCurveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearGauge(
        curves: const [
          CustomCurve(
              midPoint: 50,
              startHeight: 100,
              endHeight: 100,
              color: Colors.blue,
              curvePosition: CurvePosition.top),
          CustomCurve(
              midPoint: 50, midHeight: 100, curvePosition: CurvePosition.top)
        ],
        rulers: const RulerStyle(rulerPosition: RulerPosition.bottom),
      ),
    );
  }
}
