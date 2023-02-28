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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LinearGauge(
                value: 50.0,
                labelStyle: LabelStyle(
                  fontSize: 10,
                  color: Colors.red,
                  rulerPosition: RulerPosition.top,
                ),
                primaryRulerColor: Colors.red,
                indicator: LinearGaugeIndicator(
                  value: 60,
                  height: 30,
                  width: 30,
                  // value: ,

                  // shape: PointerShape.triangle,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
