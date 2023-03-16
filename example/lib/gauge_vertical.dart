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
