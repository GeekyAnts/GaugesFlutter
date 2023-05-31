import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class MultiplePointerExample extends StatefulWidget {
  const MultiplePointerExample({super.key});

  @override
  State<MultiplePointerExample> createState() => _MultiplePointerExampleState();
}

class _MultiplePointerExampleState extends State<MultiplePointerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          rulers: RulerStyle(
              inverseRulers: false, rulerPosition: RulerPosition.bottom),
          valueBar: const [
            ValueBar(value: 23, color: Colors.red),
          ],
          pointers: const [
            Pointer(
              value: 28,
              width: 20,
              height: 120,
              showLabel: true,
              shape: PointerShape.rectangle,
              quarterTurns: QuarterTurns.two,
              labelStyle: TextStyle(color: Colors.green),
              color: Color(0xff624CAB),
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 38,
              width: 20,
              height: 50,
              showLabel: true,
              shape: PointerShape.rectangle,
              labelStyle: TextStyle(color: Colors.green),
              color: Colors.red,
            ),
            Pointer(
              value: 8,
              width: 20,
              height: 70,
              showLabel: true,
              shape: PointerShape.rectangle,
              labelStyle: TextStyle(color: Colors.red),
              color: Color(0xffD64933),
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 68,
              width: 20,
              height: 45,
              showLabel: true,
              shape: PointerShape.rectangle,
              labelStyle: TextStyle(color: Colors.red),
              color: Color(0xffB5FFE9),
              // shape: PointerShape.circle,
            ),
          ],
        ),
      ),
    );
  }
}
