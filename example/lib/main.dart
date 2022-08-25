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
          children: const [
            SizedBox(
              child: LinearGauge(
                value: 30,
                steps: 5,
                secondaryRulerPerInterval: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
