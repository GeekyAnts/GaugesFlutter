import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class ThicknessExtendExample extends StatefulWidget {
  const ThicknessExtendExample({super.key});

  @override
  State<ThicknessExtendExample> createState() => _ThicknessExtendExampleState();
}

class _ThicknessExtendExampleState extends State<ThicknessExtendExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          start: 100,
          end: 200,
          extendLinearGauge: 20,
          valueBar: [
            ValueBar(
                value: 190,
                valueBarThickness: 10,
                position: ValueBarPosition.bottom)
          ],
          enableAnimation: true,
          linearGaugeBoxDecoration: LinearGaugeBoxDecoration(thickness: 20),
          pointers: const [
            Pointer(
              shape: PointerShape.circle,
              pointerPosition: PointerPosition.center,
              value: 170,
              showLabel: false,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
          gaugeOrientation: GaugeOrientation.horizontal,
          rulers: const RulerStyle(
            rulerPosition: RulerPosition.top,
          ),
        ),
      ),
    );
  }
}
