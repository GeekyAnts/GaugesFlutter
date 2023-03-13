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
          end: 200,
          value: 190,
          enableAnimation: true,
          pointers: const [
            Pointer(
              shape: PointerShape.triangle,
              value: 170,
              showLabel: false,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
          valueBar: [
            ValueBar(
              value: 170,
              color: Colors.orange,
            ),
          ],
          gaugeOrientation: GaugeOrientation.horizontal,
          rulers: const RulerStyle(
            rulerPosition: RulerPosition.bottom,
          ),
        ),
      ),
    );
  }
}
