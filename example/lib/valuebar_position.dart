import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

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
          gaugeOrientation: GaugeOrientation.vertical,
          start: 0,
          end: 100,
          pointers: [
            Pointer(
              value: 100,
              shape: PointerShape.triangle,
              height: 50,
              width: 50,
              pointerPosition: PointerPosition.center,
            )
          ],
          rulers:
              RulerStyle(rulerPosition: RulerPosition.center, showLabel: true),
        ),
      ),
    );
  }
}
