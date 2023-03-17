import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'test_cases.dart';

void main() {
  group("Test the Pointer Functionality", () {
    final testCases = allTests;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await tester.pumpWidgetBuilder(
          MyPointerTestLinearGauge(
            thickness: testCase['gaugeThickness'] as double?,
            rulerPosition: testCase['rulerPosition'] as RulerPosition?,
            pointer: testCase['pointer'] as Pointer?,
            gaugeOrientation: testCase['gaugeOrientation'] as GaugeOrientation?,
          ),
          surfaceSize: const Size(1200, 900),
        );
        await screenMatchesGolden(tester, testCase['name'] as String);
      });
    }
  });

  group("Test the Pointer Functionality with extendLinearGauge", () {
    final testCases = extendLinearGaugePointersAlltests;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await tester.pumpWidgetBuilder(
          MyPointerTestLinearGauge(
            rulers: testCase['rulers'] as RulerStyle?,
            extendLinearGauge: testCase['extendLinearGauge'] as double?,
            rulerPosition: testCase['rulerPosition'] as RulerPosition?,
            pointer: testCase['pointer'] as Pointer?,
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
  final double? thickness;
  final double? extendLinearGauge;
  final GaugeOrientation? gaugeOrientation;
  final Pointer? pointer;
  final RulerStyle? rulers;

  const MyPointerTestLinearGauge({
    super.key,
    this.extendLinearGauge,
    this.rulers,
    this.pointer,
    this.rulerPosition,
    this.gaugeOrientation,
    this.thickness,
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
            linearGaugeBoxDecoration:
                LinearGaugeBoxDecoration(thickness: thickness ?? 4),
            extendLinearGauge: extendLinearGauge ?? 0,
            gaugeOrientation: gaugeOrientation ?? GaugeOrientation.horizontal,
            pointers: [pointer!],
            rulers: rulers ??
                const RulerStyle(
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
