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
          children: [
            SizedBox(
              child: LinearGauge(
                value: 20,
                start: 10,
                end: 30,
                indicator: LinearGaugeIndicator(
                    value: 27.5, shape: PointerShape.circle),
                customLabels: [
                  CustomLinearGaugeLabel(text: "10%", value: 10),
                  CustomLinearGaugeLabel(text: "15%", value: 15),
                  CustomLinearGaugeLabel(text: "20%", value: 20),
                  CustomLinearGaugeLabel(text: "25%", value: 25),
                  CustomLinearGaugeLabel(text: "27.5%", value: 27.5),
                  CustomLinearGaugeLabel(text: "30%", value: 30)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
