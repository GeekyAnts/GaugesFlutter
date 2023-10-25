import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class InversedRulerExample extends StatelessWidget {
  const InversedRulerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LinearGauge(
                rangeLinearGauge: [
                  RangeLinearGauge(color: Colors.red, start: 10, end: 20),
                  RangeLinearGauge(color: Colors.orange, start: 20, end: 30),
                ],
                // linearGaugeBoxDecoration:
                //     LinearGaugeBoxDecoration(borderRadius: 20, height: 50),
                rulers: RulerStyle(
                    rulerPosition: RulerPosition.bottom, inverseRulers: true),
                customLabels: const [
                  CustomRulerLabel(text: "\$10", value: 10),
                  CustomRulerLabel(text: "\$20", value: 20),
                  CustomRulerLabel(text: "\$25", value: 25),
                  CustomRulerLabel(text: "\$30", value: 30),
                  CustomRulerLabel(text: "\$40", value: 40),
                  CustomRulerLabel(text: "\$50", value: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
