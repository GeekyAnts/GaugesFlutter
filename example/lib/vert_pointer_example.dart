import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class VerticalValueBarExample extends StatelessWidget {
  const VerticalValueBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          start: 0,
          end: 200,
          valueBar: const [
            ValueBar(
              value: 150,
              offset: 10,
              position: ValueBarPosition.left,
              color: Colors.red,
            ),
            ValueBar(
              value: 150,
              offset: 0,
              position: ValueBarPosition.center,
              color: Colors.red,
            ),
            ValueBar(
              value: 50,
              offset: 10,
              position: ValueBarPosition.right,
              color: Colors.red,
            ),
          ],
          gaugeOrientation: GaugeOrientation.vertical,
          rulers: const RulerStyle(
            inverseRulers: false,
            rulerPosition: RulerPosition.left,
          ),
        ),
      ),
    );
  }
}
