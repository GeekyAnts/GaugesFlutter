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
                value: 50,
                shape: PointerShape.circle,
                enableAnimation: false,
                animationDuration: 2000,
                animationType: Curves.bounceIn,
                pointerAlignment: PointerAlignment.center,
                height: 20,
                width: 20,
                pointerPosition: PointerPosition.bottom,
                color: Colors.grey[800]),
            Pointer(
                value: 90,
                shape: PointerShape.circle,
                animationDuration: 2000,
                animationType: Curves.ease,
                pointerAlignment: PointerAlignment.center,
                height: 20,
                width: 20,
                pointerPosition: PointerPosition.bottom,
                color: Colors.grey[800]),
            Pointer(
                value: 20,
                shape: PointerShape.triangle,
                animationDuration: 1000,
                animationType: Curves.decelerate,
                pointerAlignment: PointerAlignment.center,
                height: 20,
                width: 20,
                pointerPosition: PointerPosition.bottom,
                color: Colors.grey[800])
          ],
          linearGaugeBoxDecoration:
              const LinearGaugeBoxDecoration(thickness: 10),
          rulers: const RulerStyle(
              inverseRulers: true,
              rulerPosition: RulerPosition.top,
              showLabel: true),
        ),
      ),
    );
  }
}
