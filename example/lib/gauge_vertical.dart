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
          enableAnimation: true,

          // valueBar: [ValueBar(value: 80, position: ValueBarPosition.center)],
          pointers: const [
            Pointer(
              color: Colors.red,
              shape: PointerShape.rectangle,
              width: 30,
              height: 30,
              pointerPosition: PointerPosition.right,
              value: 10,
              showLabel: false,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
          gaugeOrientation: GaugeOrientation.horizontal,
          rulers: const RulerStyle(
            showLabel: true,
            inverseRulers: false,
            rulerPosition: RulerPosition.bottom,
          ),
        ),
      ),
    );
  }
}
