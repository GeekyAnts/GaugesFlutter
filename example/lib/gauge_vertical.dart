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
          start: 100,
          end: 900,
          enableAnimation: false,
          valueBar: [
            ValueBar(
              value: 600,
              position: ValueBarPosition.center,
            )
          ],
          pointers: const [
            Pointer(
              color: Colors.red,
              shape: PointerShape.triangle,
              width: 30,
              height: 30,
              pointerPosition: PointerPosition.right,
              value: 600,
              showLabel: false,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
          gaugeOrientation: GaugeOrientation.vertical,
          rulers: const RulerStyle(
            showLabel: true,
            inverseRulers: true,
            rulerPosition: RulerPosition.right,
          ),
        ),
      ),
    );
  }
}
