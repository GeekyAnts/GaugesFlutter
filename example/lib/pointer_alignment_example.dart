import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class PointerAlignmentExample extends StatefulWidget {
  const PointerAlignmentExample({super.key});

  @override
  State<PointerAlignmentExample> createState() =>
      _PointerAlignmentExampleState();
}

class _PointerAlignmentExampleState extends State<PointerAlignmentExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearGauge(
        gaugeOrientation: GaugeOrientation.vertical,
        pointers: const [
          Pointer(
            color: Colors.red,
            value: 30,
            width: 20,
            height: 20,
            shape: PointerShape.rectangle,
            pointerPosition: PointerPosition.left,
            pointerAlignment: PointerAlignment.end,
          ),
          Pointer(
            color: Colors.green,
            value: 50,
            width: 70,
            height: 20,
            shape: PointerShape.rectangle,
            pointerPosition: PointerPosition.left,
            pointerAlignment: PointerAlignment.end,
          ),
          Pointer(
            color: Colors.indigo,
            value: 80,
            width: 30,
            height: 20,
            shape: PointerShape.rectangle,
            pointerPosition: PointerPosition.center,
            pointerAlignment: PointerAlignment.start,
          ),
          Pointer(
            color: Colors.black,
            value: 10,
            width: 30,
            height: 20,
            shape: PointerShape.rectangle,
            pointerPosition: PointerPosition.right,
            pointerAlignment: PointerAlignment.center,
          ),
        ],
        rulers: RulerStyle(
          inverseRulers: false,
          rulerPosition: RulerPosition.left,
        ),
      ),
    );
  }
}
