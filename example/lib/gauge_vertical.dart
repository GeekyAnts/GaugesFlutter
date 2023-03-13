import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:geekyants_flutter_gauges/linear_gauge/value_bar/value_bar.dart';

class MyVerticalGauge extends StatefulWidget {
  const MyVerticalGauge({super.key});

  @override
  State<MyVerticalGauge> createState() => _MyVerticalGaugeState();
}

class _MyVerticalGaugeState extends State<MyVerticalGauge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          start: 100,
          end: 200,
          enableAnimation: true,
          pointers: const [
            Pointer(
              shape: PointerShape.triangle,
              value: 170,
              showLabel: false,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
          valueBar: [
            ValueBar(
              value: 170,
              color: Colors.orange,
            ),
            ValueBar(
              position: ValueBarPosition.top,
              value: 160,
              color: Colors.red,
            ),
            ValueBar(
                position: ValueBarPosition.top,
                value: 120,
                color: Colors.green,
                offset: 4),
          ],
          gaugeOrientation: GaugeOrientation.horizontal,
          rulers: const RulerStyle(
            rulerPosition: RulerPosition.bottom,
          ),
        ),
      ),
    );
  }
}
