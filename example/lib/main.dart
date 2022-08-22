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
              child: LinearGauge(
                start: 0,
                end: 900,
                secondaryRulerPerInterval: 1,
                linearGaugeBoxDecoration:
                    LinearGaugeBoxDecoration(color: c, borderRadius: 0),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  changeState();
                },
                child: const Text("Update Color"))
          ],
        ),
      ),
    );
  }
}
