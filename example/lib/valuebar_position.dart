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
          animationGap: 0.8,
          animationDuration: 5000,
          extendLinearGauge: 10,
          fillExtend: false,
          gaugeOrientation: GaugeOrientation.horizontal,
          enableGaugeAnimation: true,
          start: 0,
          end: 100,
          steps: 10,
          valueBar: [
            // ValueBar(
            //     value: 100,
            //     valueBarThickness: 10,
            //     color: Colors.blue.shade300,
            //     animationType: Curves.bounceInOut),
          ],
          pointers: [
            // Pointer(
            //     value: 95,
            //     shape: PointerShape.triangle,
            //     animationDuration: 5000,
            //     animationType: Curves.ease,
            //     pointerAlignment: PointerAlignment.center,
            //     height: 20,
            //     width: 20,
            //     pointerPosition: PointerPosition.bottom,
            //     color: Colors.grey[800]),
            // Pointer(
            //     value: 5,
            //     shape: PointerShape.triangle,
            //     animationDuration: 3000,
            //     animationType: Curves.bounceIn,
            //     pointerAlignment: PointerAlignment.center,
            //     height: 20,
            //     width: 20,
            //     pointerPosition: PointerPosition.bottom,
            //     color: Colors.grey[800]),
          ],
          // rangeLinearGauge: [
          //   RangeLinearGauge(color: Colors.red, start: 0, end: 50),
          //   RangeLinearGauge(color: Colors.yellow, start: 50, end: 100)
          // ],
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
