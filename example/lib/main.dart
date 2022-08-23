import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'dart:math' as math;

void main() {
  runApp(const MaterialApp(home: MyGaugeExample()));
}

class MyGaugeExample extends StatefulWidget {
  const MyGaugeExample({Key? key}) : super(key: key);

  @override
  State<MyGaugeExample> createState() => _MyGaugeExampleState();
}

class _MyGaugeExampleState extends State<MyGaugeExample> {
  Color c = Colors.red;

  void changeState() {
    setState(() {
      c = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const LinearGauge(
                start: 100,
                end: 1000,
                value: 10,
                primaryRulerColor: Colors.purple,
                primaryRulersHeight: 30,
                primaryRulersWidth: 5,
                secondaryRulerPerInterval: 10,
                secondaryRulersHeight: 30,
                steps: 200,
                labelTopMargin: 40,
                secondaryRulerColor: Colors.green,
                secondaryRulersWidth: 5.0,
                showLinearGaugeContainer: false,
                textStyle: TextStyle(color: Colors.red),
                linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
                  height: 30,
                  borderRadius: 10,
                  linearGaugeValueColor: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
