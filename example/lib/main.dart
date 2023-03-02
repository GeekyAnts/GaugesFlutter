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
                value: 60,
                indicator: LinearGaugeIndicator(shape: PointerShape.circle),
                linearGaugeBoxDecoration: LinearGaugeBoxDecoration(),
                rangeLinearGauge: [
                  RangeLinearGauge(color: Colors.green, start: 0, end: 10),
                  RangeLinearGauge(color: Colors.yellow, start: 10, end: 25),
                  RangeLinearGauge(color: Colors.amber, start: 25, end: 50),
                  RangeLinearGauge(color: Colors.blue, start: 50, end: 75),
                  RangeLinearGauge(color: Colors.red, start: 75, end: 100)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
