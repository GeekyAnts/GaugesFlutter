import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

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
          extendLinearGauge: 10,
          valueBar: const [
            ValueBar(
                value: 190,
                valueBarThickness: 10,
                position: ValueBarPosition.left)
          ],
          enableGaugeAnimation: true,
          linearGaugeBoxDecoration:
              const LinearGaugeBoxDecoration(thickness: 20),
          pointers: [
            Pointer(
              shape: PointerShape.triangle,
              pointerPosition: PointerPosition.left,
              width: 20,
              value: 150,
              showLabel: false,
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
          gaugeOrientation: GaugeOrientation.vertical,
          rulers: RulerStyle(
              rulerPosition: RulerPosition.left, inverseRulers: true),
        ),
      ),
    );
  }
}
