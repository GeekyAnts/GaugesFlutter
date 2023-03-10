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
              height: 30,
              child: LinearGauge(
                // value: 50,
                valueBarOffset: 0,
                valueBarPosition: ValueBarPosition.bottom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
