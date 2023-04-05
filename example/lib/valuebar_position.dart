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
          extendLinearGauge: 10,
          fillExtend: false,
          gaugeOrientation: GaugeOrientation.horizontal,
          enableAnimation: true,
          start: 0,
          end: 100,
          steps: 10,
          valueBar: [
            ValueBar(
              value: 100,
              valueBarThickness: 10,
              color: Colors.blue.shade300,
            )
          ],
          pointers: [
            Pointer(
                value: 10,
                shape: PointerShape.circle,
                pointerAlignment: PointerAlignment.center,
                height: 20,
                width: 20,
                pointerPosition: PointerPosition.bottom,
                color: Colors.grey[800])
          ],
          linearGaugeBoxDecoration:
              const LinearGaugeBoxDecoration(thickness: 10),
          rulers: const RulerStyle(
              inverseRulers: false,
              rulerPosition: RulerPosition.top,
              showLabel: true),
        ),
      ),
    );
  }
}
