import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'test_cases.dart';

void main() {
  group("Test the ValueBar Functionality", () {
    final testCases = allTests;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await tester.pumpWidgetBuilder(
          MyValuBarTestLinearGauge(
            gaugeOrientation: testCase['gaugeOrientation'] as GaugeOrientation?,
            linearGaugeBoxDecoration: testCase['linearGaugeBoxDecoration']
                as LinearGaugeBoxDecoration?,
            valueBar: testCase['valueBar'] as List<ValueBar>?,
            rulers: testCase['rulers'] as RulerStyle?,
            extendLinearGauge: testCase['extendLinearGauge'] as double?,
          ),
          surfaceSize: const Size(1200, 900),
        );
        await screenMatchesGolden(tester, testCase['name'] as String);
      });
    }
  });
}

class MyValuBarTestLinearGauge extends StatelessWidget {
  final double? extendLinearGauge;
  final GaugeOrientation? gaugeOrientation;
  final RulerStyle? rulers;
  final List<ValueBar>? valueBar;
  final LinearGaugeBoxDecoration? linearGaugeBoxDecoration;

  const MyValuBarTestLinearGauge(
      {super.key,
      this.extendLinearGauge,
      this.rulers,
      this.gaugeOrientation,
      this.valueBar,
      this.linearGaugeBoxDecoration});

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
            linearGaugeBoxDecoration: linearGaugeBoxDecoration ??
                const LinearGaugeBoxDecoration(
                  thickness: 4.0,
                  linearGaugeValueColor: Colors.blue,
                  backgroundColor: Colors.grey,
                ),
            extendLinearGauge: extendLinearGauge ?? 0,
            gaugeOrientation: gaugeOrientation ?? GaugeOrientation.horizontal,
            valueBar: valueBar,
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
