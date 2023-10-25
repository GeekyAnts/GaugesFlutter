import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

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
              height: 30,
              child: LinearGauge(
                // value: 50,

                valueBarPosition: ValueBarPosition.bottom,
                rulers: RulerStyle(rulerPosition: RulerPosition.bottom),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
