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
        child: Container(
          color: Colors.amber.withOpacity(0.3),
          child: LinearGauge(
            gaugeOrientation: GaugeOrientation.horizontal,
            start: 0,
            end: 100,
            pointers: const [
              Pointer(
                value: 10,
                shape: PointerShape.circle,
                pointerAlignment: PointerAlignment.center,
                showLabel: true,
                // quarterTurns: QuarterTurns.one,
                labelStyle: TextStyle(
                  color: Colors.black,
                  backgroundColor: Colors.red,
                ),
                height: 50,
                width: 100,
                pointerPosition: PointerPosition.bottom,
              )
            ],
            // linearGaugeBoxDecoration: LinearGaugeBoxDecoration(thickness: 40),
            rulers: const RulerStyle(
                // primaryRulersHeight: 180,
                // inverseRulers: true,
                rulerPosition: RulerPosition.center,
                showLabel: true),
          ),
        ),
      ),
    );
  }
}
