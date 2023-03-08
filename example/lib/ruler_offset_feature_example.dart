import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class MyRulerOffset extends StatelessWidget {
  const MyRulerOffset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LinearGauge(
                value: 20,
                rulers: RulerStyle(
                  rulerPosition: RulerPosition.top,
                  rulersOffset: 15,
                ),
                customLabels: [],
                pointer: Pointer(
                  value: 20,
                  height: 30,
                  labelStyle: TextStyle(color: Colors.black),
                  width: 30,
                  quaterTurns: QuaterTurns.two,
                  shape: PointerShape.triangle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
