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
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LinearGauge(
                start: 10,
                end: 50,
                value: 25,
                indicator: LinearGaugeIndicator(shape: PointerShape.circle),
                linearGaugeBoxDecoration: LinearGaugeBoxDecoration(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
