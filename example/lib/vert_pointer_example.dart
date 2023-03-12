import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:geekyants_flutter_gauges/linear_gauge/linear_gauge.dart';
import 'package:geekyants_flutter_gauges/linear_gauge/styles/linear_gauge_ruler_style.dart';
import 'package:geekyants_flutter_gauges/utils/enums.dart';

class VerticalPointerExample extends StatelessWidget {
  const VerticalPointerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          pointers: [
            Pointer(
                value: 60,
                showLabel: true,
                labelStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                color: Colors.red,
                shape: PointerShape.diamond,
                quarterTurns: QuarterTurns.zero,
                width: 80,
                height: 18),
          ],
          gaugeOrientation: GaugeOrientation.vertical,
          rulers: const RulerStyle(
            rulersOffset: 10,
            labelOffset: 10,
            inverseRulers: false,
            rulerPosition: RulerPosition.center,
            secondaryRulerColor: Colors.red,
            primaryRulerColor: Colors.blue,
            showLabel: true,
          ),
        ),
      ),
    );
  }
}
