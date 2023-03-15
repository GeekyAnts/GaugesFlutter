import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

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
        child: LinearGauge(
          start: 0,
          end: 100,
          enableAnimation: false,
          pointers: const [
            Pointer(
              shape: PointerShape.diamond,
              width: 20,
              height: 150,
              value: 100,
              pointerPosition: PointerPosition.left,
            ),
          ],
          gaugeOrientation: GaugeOrientation.vertical,
          rulers: const RulerStyle(
            showLabel: true,
            inverseRulers: false,
            rulerPosition: RulerPosition.right,
          ),
        ),
      ),
    );
  }
}
