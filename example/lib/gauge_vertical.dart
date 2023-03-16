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
          linearGaugeBoxDecoration:
              LinearGaugeBoxDecoration(thickness: 30, borderRadius: 300),
          start: 0,
          end: 100,
          enableAnimation: false,
          pointers: const [
            Pointer(
              shape: PointerShape.circle,
              color: Colors.blue,
              width: 50,
              height: 20,
              value: 50,
              showLabel: true,
              pointerPosition: PointerPosition.bottom,
              quarterTurns: QuarterTurns.zero,
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
