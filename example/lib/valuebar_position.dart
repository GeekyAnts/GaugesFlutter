import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

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
          gaugeOrientation: GaugeOrientation.horizontal,
          enableAnimation: true,
          start: 0,
          end: 100,
          steps: 10,
          pointers: [
            Pointer(
                value: 100,
                shape: PointerShape.triangle,
                height: 20,
                width: 20,
                pointerPosition: PointerPosition.top,
                color: Colors.grey[800])
          ],
          rulers: const RulerStyle(
              rulerPosition: RulerPosition.center, showLabel: true),
        ),
      ),
    );
  }
}
