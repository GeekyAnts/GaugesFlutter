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
          enableAnimation: true,
          valueBar: [
            ValueBar(
              value: 30,
              offset: 50,
              position: ValueBarPosition.top,
            ),
          ],
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
