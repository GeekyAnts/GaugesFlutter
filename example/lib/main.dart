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
                rulers: RulerStyle(
                    value: 75.0,
                    primaryRulerColor: Colors.red,
                    indicator: LinearGaugeIndicator(
                      width: 20,
                      value: 0,
                      shape: PointerShape.arrow,
                      color: Colors.red,
                    ),
                    textStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    ),
                    rulerPosition: RulerPosition.top,
                    labelOffset: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
