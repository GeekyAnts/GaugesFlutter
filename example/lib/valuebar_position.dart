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
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
            borderRadius: 20,
            thickness: 35,
            backgroundColor: Colors.grey,
          ),
          valueBar: [
            ValueBar(
              value: 100,
              valueBarThickness: 20,
              borderRadius: 20,
              linearGradient: const LinearGradient(
                colors: [Colors.orange, Colors.red],
              ),
            ),
          ],
          rulers: const RulerStyle(
            showPrimaryRulers: false,
            showSecondaryRulers: false,
            showLabel: false,
            // secondaryRulersHeight: 300,
            rulerPosition: RulerPosition.bottom,
            textStyle: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
