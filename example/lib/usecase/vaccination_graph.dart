import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyVaccinationGraph(),
    ),
  );
}

class MyVaccinationGraph extends StatelessWidget {
  const MyVaccinationGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LinearGauge(
              linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                  thickness: 30.0,
                  linearGaugeValueColor: Colors.green,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  backgroundColor: Colors.grey),
              start: 0,
              end: 100,
              gaugeOrientation: GaugeOrientation.horizontal,
              valueBar: [
                ValueBar(
                  value: 70,
                  color: Colors.green,
                  valueBarThickness: 30,
                ),
                ValueBar(
                  value: 70,
                  color: Colors.green.shade700,
                  position: ValueBarPosition.top,
                  valueBarThickness: 10,
                )
              ],
              rulers: const RulerStyle(
                secondaryRulersWidth: 4,
                secondaryRulerPerInterval: 1,
                secondaryRulersHeight: 25,
                secondaryRulerColor: Colors.white,
                showPrimaryRulers: false,
                rulersOffset: 10,
                labelOffset: 10,
                inverseRulers: false,
                rulerPosition: RulerPosition.center,
                showLabel: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Center(
                child: LinearGauge(
                  extendLinearGauge: 0,
                  start: 0,
                  end: 50,
                  linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
                    thickness: 1,
                  ),
                  rulers: const RulerStyle(
                    rulerPosition: RulerPosition.bottom,
                    showSecondaryRulers: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
