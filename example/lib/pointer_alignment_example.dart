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
          ShapePointer(
            color: Colors.red,
            value: 30,
            width: 20,
            height: 20,
            shape: PointerShape.rectangle,
            pointerPosition: PointerPosition.left,
            pointerAlignment: PointerAlignment.end,
          ),
          ShapePointer(
            color: Colors.green,
            value: 50,
            width: 70,
            height: 20,
            shape: PointerShape.rectangle,
            pointerPosition: PointerPosition.left,
            pointerAlignment: PointerAlignment.end,
          ),
          ShapePointer(
            color: Colors.indigo,
            value: 80,
            width: 30,
            height: 20,
            shape: PointerShape.rectangle,
            pointerPosition: PointerPosition.center,
            pointerAlignment: PointerAlignment.start,
          ),
          ShapePointer(
            color: Colors.black,
            value: 10,
            width: 30,
            height: 20,
            shape: PointerShape.rectangle,
            pointerPosition: PointerPosition.right,
            pointerAlignment: PointerAlignment.center,
          ),
        ],
        rulers: const RulerStyle(
          inverseRulers: false,
          rulerPosition: RulerPosition.left,
        ),
      ),
    );
  }
}
