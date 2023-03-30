import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyServerUtilizationExample(),
    ),
  );
}

class MyServerUtilizationExample extends StatelessWidget {
  const MyServerUtilizationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          start: 0,
          end: 100,
          rangeLinearGauge: [
            RangeLinearGauge(color: Colors.green, start: 0, end: 25),
            RangeLinearGauge(color: Colors.orange, start: 25, end: 50),
            RangeLinearGauge(color: Colors.pink.shade300, start: 50, end: 75),
            RangeLinearGauge(color: Colors.red, start: 75, end: 100),
          ],
          pointers: const [
            Pointer(
                value: 75,
                height: 30,
                width: 40,
                shape: PointerShape.triangle,
                color: Colors.black,
                pointerAlignment: PointerAlignment.center,
                pointerPosition: PointerPosition.top)
          ],
          customLabels: const [
            CustomRulerLabel(text: "0%", value: 0),
            CustomRulerLabel(text: "25%", value: 25),
            CustomRulerLabel(text: "50%", value: 50),
            CustomRulerLabel(text: "75%", value: 75),
            CustomRulerLabel(text: "100%", value: 100),
          ],
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
            thickness: 40,
          ),
          rulers: const RulerStyle(
            rulerPosition: RulerPosition.bottom,
            showSecondaryRulers: false,
          ),
        ),
      ),
    );
  }
}

class CpuExample extends StatelessWidget {
  const CpuExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          start: 0,
          end: 100,
          valueBar: [
            ValueBar(value: 100, color: Colors.red, valueBarThickness: 40),
            ValueBar(
                value: 75, color: Colors.pink.shade300, valueBarThickness: 40),
            ValueBar(value: 50, color: Colors.orange, valueBarThickness: 40),
            ValueBar(value: 25, color: Colors.green, valueBarThickness: 40),
          ],
          pointers: const [
            Pointer(
                value: 75,
                height: 40,
                width: 60,
                shape: PointerShape.triangle,
                color: Colors.black,
                showLabel: true,
                pointerAlignment: PointerAlignment.center,
                labelStyle: TextStyle(
                  color: Colors.black,
                  // fontSize: 20,
                ),
                pointerPosition: PointerPosition.top)
          ],
          customLabels: const [
            CustomRulerLabel(text: "0%", value: 0),
            CustomRulerLabel(text: "25%", value: 25),
            CustomRulerLabel(text: "50%", value: 50),
            CustomRulerLabel(text: "75%", value: 75),
            CustomRulerLabel(text: "100%", value: 100),
          ],
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
            thickness: 40,
          ),
          rulers: const RulerStyle(
            rulerPosition: RulerPosition.bottom,
            showSecondaryRulers: false,
          ),
        ),
      ),
    );
  }
}
