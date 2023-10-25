import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class MyVerticalGauge extends StatefulWidget {
  const MyVerticalGauge({super.key});

  @override
  State<MyVerticalGauge> createState() => _MyVerticalGaugeState();
}

class _MyVerticalGaugeState extends State<MyVerticalGauge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: LinearGauge(
              end: 126,
              gaugeOrientation: GaugeOrientation.vertical,
              rulers: RulerStyle(
                rulerPosition: RulerPosition.right,
              ),
              pointers: const [
                Pointer(
                  value: 50,
                  height: 20,
                  color: Colors.green,
                  width: 20,
                  shape: PointerShape.triangle,
                  isInteractive: true,
                  onChanged: null,
                  pointerPosition: PointerPosition.left,
                ),
              ],
              curves: const [
                CustomCurve(
                  startHeight: 4,
                  endHeight: 50,
                  midHeight: 5,
                  curvePosition: CurvePosition.left,
                  end: 126,
                  midPoint: 50 * 0.8,
                ),
              ],
            )),
      ),
    );
  }
}
