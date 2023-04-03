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
          enableAnimation: true,
          valueBar: [ValueBar(value: 50)],
          gaugeOrientation: GaugeOrientation.horizontal,
          start: 0,
          end: 100,
          pointers: const [
            Pointer(
              value: 70,
              shape: PointerShape.circle,
              height: 50,
              // width: 50,
              pointerPosition: PointerPosition.top,
            )
          ],
          rulers: RulerStyle(
              rulerPosition: RulerPosition.top,
              showLabel: true,
              inverseRulers: true),
        ),
      ),
    );
  }
}
