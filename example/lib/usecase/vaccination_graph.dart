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
        height: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LinearGauge(
                extendLinearGauge: 0,
                start: 0,
                end: 50,
                valueBar: [
                  ValueBar(
                    value: 13.8,
                    color: Colors.green,
                    position: ValueBarPosition.center,
                  )
                ],
                linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
                  thickness: 4,
                ),
                rulers: const RulerStyle(
                  rulerPosition: RulerPosition.bottom,
                  showSecondaryRulers: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
