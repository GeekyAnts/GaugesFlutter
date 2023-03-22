import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

import 'range_linear_test_cases.dart';

void main() {
  group("Test the ValueBar Functionality", () {
    final testCases = allTests;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await tester.pumpWidgetBuilder(
          MyRangeLinearGauge(
            start: testCase['start'] as double?,
            end: testCase['end'] as double?,
            extendLinearGauge: testCase['extendLinearGauge'] as double?,
            thickness: testCase['gaugeThickness'] as double?,
            inverseRulers: testCase['inverse'] as bool?,
            gaugeOrientation: testCase['gaugeOrientation'] as GaugeOrientation?,
            fillExtend: testCase['fillExtend'] as bool?,

            rulers: testCase['rulers'] as RulerStyle?,
            linearGaugeBoxDecoration: testCase['linearGaugeBoxDecoration']
                as LinearGaugeBoxDecoration?,

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
  final double? start;
  final double? end;
  final List<RangeLinearGauge>? rangeLinearGaugeList;
  final double? extendLinearGauge;
  final GaugeOrientation? gaugeOrientation;
  final bool? inverseRulers;
  final double? thickness;
  final bool? fillExtend;
  final LinearGaugeBoxDecoration? linearGaugeBoxDecoration;
  final RulerStyle? rulers;


  const MyRangeLinearGauge({
    super.key,
    this.start,
    this.end,
    this.rangeLinearGaugeList,
    this.extendLinearGauge,
    this.gaugeOrientation,
    this.inverseRulers,
    this.thickness,
    this.fillExtend,
    this.linearGaugeBoxDecoration,
    this.rulers,

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
            start: start ?? 0,
            end: end ?? 100,
            fillExtend: fillExtend ?? false,
            extendLinearGauge: extendLinearGauge ?? 0.0,
            linearGaugeBoxDecoration: linearGaugeBoxDecoration ??
                LinearGaugeBoxDecoration(
                  thickness: thickness ?? 4.0,
                ),
            gaugeOrientation: gaugeOrientation ?? GaugeOrientation.horizontal,
            rangeLinearGauge: rangeLinearGaugeList,
            rulers: rulers ??
                RulerStyle(
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
