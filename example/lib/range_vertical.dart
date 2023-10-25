import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

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
          extendLinearGauge: 20,
          rangeLinearGauge: [
            RangeLinearGauge(
              start: 0,
              end: 20,
              color: Colors.red,
            ),
            RangeLinearGauge(
              end: 20,
              start: 30,
              color: Colors.green,
            ),
          ],
          linearGaugeBoxDecoration:
              const LinearGaugeBoxDecoration(thickness: 10),
          gaugeOrientation: GaugeOrientation.horizontal,
          rulers: RulerStyle(
            rulersOffset: 10,
            labelOffset: 10,
            inverseRulers: true,
            rulerPosition: RulerPosition.center,
            showLabel: true,
          ),
          // customLabels: [
          //   CustomRulerLabel(text: "10%", value: 10),
          //   CustomRulerLabel(text: "15%", value: 15),
          //   CustomRulerLabel(text: "20%", value: 20),
          //   CustomRulerLabel(text: "25%", value: 25),
          //   CustomRulerLabel(text: "30%", value: 30),
          // ],
        ),
      ),
    );
  }
}
