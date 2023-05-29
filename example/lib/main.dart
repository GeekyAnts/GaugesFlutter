import 'package:example/valuebar_position.dart';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyGaugeExample(),
    ),
  );
}

class MyGaugeExample extends StatefulWidget {
  const MyGaugeExample({Key? key}) : super(key: key);

  @override
  State<MyGaugeExample> createState() => _MyGaugeExampleState();
}

class _MyGaugeExampleState extends State<MyGaugeExample> {
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RadialGauge(
          needlePointer: [
            NeedlePointer(value: 30),
          ],
          track: RadialTrack(
            start: 0,
            end: 100,
          ),
        ),
      ),
    );
  }
}
