import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: MyGaugeExample()));
}

class MyGaugeExample extends StatefulWidget {
  const MyGaugeExample({Key? key}) : super(key: key);

  @override
  State<MyGaugeExample> createState() => _MyGaugeExampleState();
}

class _MyGaugeExampleState extends State<MyGaugeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              child: LinearGauge(
                value: 20,
                start: 10,
                end: 30,
                rulers: RulerStyle(
                  rulersOffset: 10,
                ),
                indicator: LinearGaugeIndicator(
                    value: 27.5, shape: PointerShape.circle),
                customLabels: [
                  CustomRulerLabel(text: "10%", value: 10),
                  CustomRulerLabel(text: "15%", value: 15),
                  CustomRulerLabel(text: "20%", value: 20),
                  CustomRulerLabel(text: "25%", value: 25),
                  CustomRulerLabel(text: "27.5%", value: 27.5),
                  CustomRulerLabel(text: "30%", value: 30)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
