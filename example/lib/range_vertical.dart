import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class MyVerticalRange extends StatefulWidget {
  const MyVerticalRange({super.key});

  @override
  State<MyVerticalRange> createState() => _MyVerticalRangeState();
}

class _MyVerticalRangeState extends State<MyVerticalRange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          value: 10,
          rangeLinearGauge: [
            RangeLinearGauge(color: Colors.red, start: 10, end: 20),
            RangeLinearGauge(color: Colors.amber, start: 20, end: 30),
          ],
          gaugeOrientation: GaugeOrientation.vertical,
          rulers: const RulerStyle(
            rulersOffset: 10,
            labelOffset: 10,
            inverseRulers: false,
            rulerPosition: RulerPosition.center,
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
