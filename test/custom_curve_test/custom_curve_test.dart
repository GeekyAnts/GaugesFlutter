import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import './custom_curve_test_cases.dart';

void main() {
  group("Test the Pointer Functionality", () {
    final testCases = allTests;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await tester.pumpWidgetBuilder(
          MyCustomCurveGauge(
            curves: [...testCase['curves'] as List<CustomCurve>],
            rulers: testCase['rulers'] as RulerStyle?,
            extendLinearGauge: testCase['extendLinearGauge'] as double?,
            rulerPosition: testCase['rulerPosition'] as RulerPosition?,
            gaugeOrientation: testCase['gaugeOrientation'] as GaugeOrientation?,
          ),
          surfaceSize: const Size(1200, 900),
        );
        await screenMatchesGolden(tester, testCase['name'] as String);
      });
    }
  });
}

class MyCustomCurveGauge extends StatelessWidget {
  final RulerPosition? rulerPosition;
  final bool? showLabel;
  final double? thickness;
  final double? extendLinearGauge;
  final GaugeOrientation? gaugeOrientation;
  final List<CustomCurve> curves;

  final RulerStyle? rulers;

  const MyCustomCurveGauge({
    Key? key,
    this.rulerPosition,
    this.showLabel,
    this.curves = const [],
    this.thickness,
    this.extendLinearGauge,
    this.gaugeOrientation,
    this.rulers,
  }) : super(key: key);

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
            curves: [...curves],
            rulers: rulers ??
                RulerStyle(
                  showLabel: showLabel ?? true,
                  inverseRulers: false,
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
