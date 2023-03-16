import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'valuebar_test_cases.dart';

void main() {
  group("Test the Pointer Functionality", () {
    final testCases = valueBar;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await tester.pumpWidgetBuilder(
          MyPointerTestLinearGauge(
            rulerPosition: testCase['rulerPosition'] as RulerPosition?,
            gaugeOrientation: testCase['gaugeOrientation'] as GaugeOrientation?,
            valueBar: testCase['valueBar'] as ValueBar?,
          ),
          surfaceSize: const Size(1200, 900),
        );
        await screenMatchesGolden(tester, testCase['name'] as String);
      });
    }
  });
}

class MyPointerTestLinearGauge extends StatelessWidget {
  final RulerPosition? rulerPosition;
  final GaugeOrientation? gaugeOrientation;

  final ValueBar? valueBar;
  const MyPointerTestLinearGauge({
    super.key,
    this.rulerPosition,
    this.gaugeOrientation,
    this.valueBar,
  });

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
            gaugeOrientation: gaugeOrientation ?? GaugeOrientation.horizontal,
            valueBar: [valueBar!],
            rulers: RulerStyle(
              rulerPosition: RulerPosition.center,
              textStyle: const TextStyle(
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
