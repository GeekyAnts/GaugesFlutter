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
          gaugeOrientation: GaugeOrientation.vertical,
          rulers: const RulerStyle(
            rulersOffset: 10,
            labelOffset: 10,
            inverseRulers: false,
            rulerPosition: RulerPosition.right,
            secondaryRulerColor: Colors.red,
            primaryRulerColor: Colors.blue,
            showLabel: true,
          ),
          // customLabels: [
          //   CustomRulerLabel(text: "10%", value: 10),
          //   CustomRulerLabel(text: "20%", value: 20),
          //   CustomRulerLabel(text: "25%", value: 25),
          //   CustomRulerLabel(text: "30%", value: 30),
          // ],
        ),
      ),
    );
  }
}
