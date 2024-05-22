import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'radial_pointer_test_cases.dart';

// import 'pointer_test_cases.dart';

void main() {
  group("Test the Radial Pointer Shapes", () {
    final testCases = pointerTests;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await loadAppFonts();
        await tester.pumpWidgetBuilder(
          MyPointerTestLinearGauge(
            shape: testCase['pointer'] as RadialShapePointer?,
          ),
          surfaceSize: const Size(1200, 900),
        );
        await screenMatchesGolden(tester, testCase['name'] as String);
      });
    }
  });

  // group("Test the Pointer Functionality with extendLinearGauge", () {
  //   final testCases = [];

  //   for (final testCase in testCases) {
  //     testGoldens(testCase['Do'] as String, (tester) async {
  //       await tester.pumpWidgetBuilder(
  //         MyPointerTestLinearGauge(
  //          shape: t,
  //         ),
  //         surfaceSize: const Size(1200, 900),
  //       );
  //       await screenMatchesGolden(tester, testCase['name'] as String);
  //     });
  //   }
  // });
}

class MyPointerTestLinearGauge extends StatelessWidget {
  final RadialShapePointer? shape;
  final double value;
  // final bool? inverseRuler;
  const MyPointerTestLinearGauge({
    super.key,
    this.shape,
    this.value = 50,
    // this.inverseRuler,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Default Radial Gauge"),
        ),
        body: Center(
          child: RadialGauge(
            track: const RadialTrack(
              trackStyle: TrackStyle(
                labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
              color: Colors.black,
              start: 0,
              end: 100,
            ),
            shapePointer: [
              shape!,
            ],
          ),
        ),
      ),
    );
  }
}
