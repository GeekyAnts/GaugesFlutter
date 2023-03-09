import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class MultiplePointerExample extends StatefulWidget {
  const MultiplePointerExample({super.key});

  @override
  State<MultiplePointerExample> createState() => _MultiplePointerExampleState();
}

class _MultiplePointerExampleState extends State<MultiplePointerExample> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LinearGauge(
          // showLinearGaugeContainer: false,
          rulers: RulerStyle(
              inverseRulers: false, rulerPosition: RulerPosition.bottom),
          pointers: [
            Pointer(
              value: 25,
              showLabel: true,
              width: 20,
              height: 20,
              shape: PointerShape.circle,
              quarterTurns: QuarterTurns.one,
              labelStyle: TextStyle(color: Colors.red),
              color: Colors.blue,
              // quarterTurns: QuarterTurns.three
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 28,
              width: 20,
              height: 120,
              showLabel: true,
              shape: PointerShape.diamond,
              quarterTurns: QuarterTurns.two,
              labelStyle: TextStyle(color: Colors.green),
              color: Color(0xff624CAB),
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 48,
              width: 20,
              height: 120,
              showLabel: true,
              shape: PointerShape.diamond,

              quarterTurns: QuarterTurns.two,
              labelStyle: TextStyle(color: Colors.green),
              color: Color(0xff45CB85),
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 38,
              width: 20,
              height: 50,
              showLabel: true,
              shape: PointerShape.triangle,
              labelStyle: TextStyle(color: Colors.green),
              color: Colors.red,
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 18,
              // width: 20,
              // height: 30,
              showLabel: true,
              shape: PointerShape.triangle,
              labelStyle: TextStyle(color: Colors.red),
              color: Colors.blue,
              // shape: PointerShape.circle,
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
            Pointer(
              value: 78,
              width: 20,
              height: 100,
              showLabel: true,
              shape: PointerShape.triangle,
              labelStyle: TextStyle(color: Colors.red),
              color: Colors.red,
              // shape: PointerShape.circle,
            ),
          ],
        ),
      ),
    );
  }
}
