import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group("Test the Pointer Functionality", () {
    testGoldens('Should draw pointer on 50 ', (tester) async {
      await tester.pumpWidgetBuilder(
        const MyPointerTestLinearGauge(
          value: 50,
        ),
        surfaceSize: const Size(1200, 900),
      );
      await screenMatchesGolden(tester, 'pointer-value-50');
    });
    testGoldens('Should draw pointer on 0 ', (tester) async {
      await tester.pumpWidgetBuilder(
        const MyPointerTestLinearGauge(
          value: 0,
        ),
        surfaceSize: const Size(1200, 900),
      );
      await screenMatchesGolden(tester, 'pointer-value-0');
    });
  });
}

class MyPointerTestLinearGauge extends StatelessWidget {
  final double value;
  const MyPointerTestLinearGauge({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Default LinearGauge"),
        ),
        body: Center(
          child: LinearGauge(
            pointers: [
              Pointer(
                shape: PointerShape.triangle,
                value: value,
                labelStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              )
            ],
            rulers: const RulerStyle(
              rulerPosition: RulerPosition.center,
              textStyle: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
