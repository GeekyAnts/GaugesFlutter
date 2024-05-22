import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'custom_labels_test_cases.dart';

void main() {
  group("Test the CustomLabel Functionality", () {
    final testCases = allTests;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await tester.pumpWidgetBuilder(
          MyPointerTestLinearGauge(
            valueBar: testCase['valueBar'] as List<ValueBar>?,
            extendLinearGauge: testCase['extendLinearGauge'] as double?,
            rulerPosition: testCase['rulerPosition'] as RulerPosition?,
            inverseRuler: testCase['inverse'] as bool?,
            customLabels: testCase['customLabels'] as List<CustomRulerLabel>?,
            gaugeOrientation: testCase['gaugeOrientation'] as GaugeOrientation?,
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
  final List<CustomRulerLabel>? customLabels;
  final List<ValueBar>? valueBar;
  final double? extendLinearGauge;
  final GaugeOrientation? gaugeOrientation;
  final bool? inverseRuler;
  const MyPointerTestLinearGauge({
    super.key,
    this.extendLinearGauge,
    this.customLabels,
    this.rulerPosition,
    this.gaugeOrientation,
    this.valueBar,
    this.inverseRuler,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Default LinearGauge"),
        ),
        body: Center(
          child: LinearGauge(
            customLabels: customLabels,
            extendLinearGauge: extendLinearGauge ?? 0,
            valueBar: valueBar ?? [],
            gaugeOrientation: gaugeOrientation ?? GaugeOrientation.horizontal,
            rulers: RulerStyle(
              inverseRulers: inverseRuler ?? false,
              rulerPosition: rulerPosition ?? RulerPosition.center,
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
