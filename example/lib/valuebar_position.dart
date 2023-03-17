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
          start: -50,
          end: 100,
          valueBar: [
            ValueBar(
              value: -50,
              position: ValueBarPosition.center,
              color: Colors.indigo,
            ),
            ValueBar(
              value: 50,
              position: ValueBarPosition.bottom,
              color: Colors.purple,
            ),
            ValueBar(
              value: 50,
              offset: 8,
              position: ValueBarPosition.top,
              color: Colors.red,
            ),
            ValueBar(
              value: 30,
              offset: 4,
              position: ValueBarPosition.top,
              color: Colors.orange,
            ),
            ValueBar(
              value: 29,
              offset: 0,
              position: ValueBarPosition.top,
              color: Colors.green,
            ),
          ],
          rulers: RulerStyle(rulerPosition: RulerPosition.top),
        ),
      ),
    );
  }
}
