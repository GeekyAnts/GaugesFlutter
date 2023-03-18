import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

import 'range_linear_test_cases.dart';

void main() {
  group("Test the ValueBar Functionality", () {
    final testCases = edgeCases;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await tester.pumpWidgetBuilder(
          MyRangeLinearGauge(
            thickness: testCase['gaugeThickness'] as double?,
            inverseRulers: testCase['inverse'] as bool?,
            gaugeOrientation: testCase['gaugeOrientation'] as GaugeOrientation?,
            rangeLinearGaugeList:
                testCase['rangeLinear'] as List<RangeLinearGauge>?,
          ),
          surfaceSize: const Size(1200, 900),
        );
        await screenMatchesGolden(tester, testCase['name'] as String);
      });
    }
  });
}

class MyRangeLinearGauge extends StatelessWidget {
  final List<RangeLinearGauge>? rangeLinearGaugeList;
  final GaugeOrientation? gaugeOrientation;
  final bool? inverseRulers;
  final double? thickness;

  const MyRangeLinearGauge({
    super.key,
    this.rangeLinearGaugeList,
    this.gaugeOrientation,
    this.inverseRulers,
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
            linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
              thickness: thickness ?? 4.0,
            ),
            gaugeOrientation: gaugeOrientation ?? GaugeOrientation.horizontal,
            rangeLinearGauge: rangeLinearGaugeList,
            rulers: RulerStyle(
              inverseRulers: inverseRulers ?? false,
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
