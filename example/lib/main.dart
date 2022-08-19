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
      body: Container(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: const LinearGauge(
              start: 0,
              end: 100,
            ),
          ),
        ),
      ),
    );
  }
}
