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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              child: LinearGauge(
                value: 900,
                secondaryRulerPerInterval: 4,
                start: 400,
                end: 4000,
                linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
                    borderRadius: 30.0,
                    linearGradient:
                        LinearGradient(colors: [Colors.blue, Colors.green])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
