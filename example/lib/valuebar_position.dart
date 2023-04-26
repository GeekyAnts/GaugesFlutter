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
          gaugeOrientation: GaugeOrientation.vertical,
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
            thickness: 15,
            backgroundColor: Colors.grey,
          ),
          pointers: [
            Pointer(
              shape: PointerShape.triangle,
              width: 150,
              height: 20,
              value: 0,
              pointerPosition: PointerPosition.left,
            ),
          ],
          extendLinearGauge: 200,
          rulers: const RulerStyle(
            // secondaryRulersHeight: 300,
            rulerPosition: RulerPosition.left,
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
