import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class PointerValueLabel extends StatefulWidget {
  const PointerValueLabel({super.key});

  @override
  State<PointerValueLabel> createState() => _PointerValueLabelState();
}

class _PointerValueLabelState extends State<PointerValueLabel> {
  @override
  Widget build(BuildContext context) {
    return const LinearGauge(
      value: 30,
      pointer: Pointer(
        color: Colors.red,
        width: 70,
        height: 390,
        shape: PointerShape.rectangle,
        quarterTurns: QuarterTurns.three,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      steps: 1,
      start: 0,
      end: 50,
      rulers: RulerStyle(rulerPosition: RulerPosition.top),
    );
  }
}
