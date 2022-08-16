import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';

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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const LinearGauge(
            color: Colors.amber,
            height: 5,
            primaryRulerColor: Colors.red,
            primaryRulersHeight: 30.0,
            primaryRulersWidth: 2,
            steps: 3,
            end: 60,
          ),
        ),
      ),
    );
  }
}
