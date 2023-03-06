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
          children: const [
            SizedBox(
              child: LinearGauge(
                value: 20,
                rulers: RulerStyle(
                  rulerPosition: RulerPosition.bottom,
                  rulersOffset: 15,
                ),
                pointer: Pointer(
                  value: 17.5,
                  shape: PointerShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
