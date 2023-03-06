import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class PointerValueLabel extends StatelessWidget {
  const PointerValueLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearGauge(
      start: 0,
      value: 50,
      end: 100,
      pointer: Pointer(
        color: Colors.blue,
        shape: PointerShape.triangle,
        quaterTurns: QuaterTurns.two,
        labelStyle: TextStyle(
          color: Colors.red,
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
