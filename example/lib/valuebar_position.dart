import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:geekyants_flutter_gauges/linear_gauge/value_bar/value_bar.dart';

class MyValueBarPosition extends StatefulWidget {
  const MyValueBarPosition({super.key});

  @override
  State<MyValueBarPosition> createState() => _MyValueBarPositionState();
}

class _MyValueBarPositionState extends State<MyValueBarPosition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          start: 24,
          // end: 90,
          value: 50,

          valueBar: [
            ValueBar(
                value: 50,
                offset: 50,
                position: ValueBarPosition.top,
                color: Colors.amber),
            ValueBar(
                value: 40,
                offset: 60,
                position: ValueBarPosition.top,
                color: Colors.blue),
            ValueBar(
                value: 30,
                offset: 40,
                position: ValueBarPosition.top,
                color: Colors.orange),
            ValueBar(
                value: 29,
                offset: 10,
                position: ValueBarPosition.top,
                color: Colors.green),
          ],
          // valueBarOffset: 20,
          // valueBarPosition: ValueBarPosition.bottom,
          // valueBarOffset: 100.0,
          // valueBarPosition: ValueBarPosition.top,
        ),
      ),
    );
  }
}
