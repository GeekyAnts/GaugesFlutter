import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(const MaterialApp(home: MyGaugeExample()));
}

class MyGaugeExample extends StatefulWidget {
  const MyGaugeExample({Key? key}) : super(key: key);

  @override
  State<MyGaugeExample> createState() => _MyGaugeExampleState();
}

class _MyGaugeExampleState extends State<MyGaugeExample> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LinearGauge(
                value: 75.0,
                labelStyle: LabelStyle(
                  fontSize: 10,
                  color: Colors.red,
                  invertLabels: false,
                ),
                primaryRulerColor: Colors.red,
                indicator: LinearGaugeIndicator(
                  shape: PointerShape.triangle,
                  value: 0,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
