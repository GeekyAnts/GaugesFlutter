import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'radial_position_test_cases.dart';

// import '../../linear_gauge/pointers_test/pointer_test_cases.dart';

// import 'pointer_test_cases.dart';

void main() {
  group("Test the Radial Pointer Shapes", () {
    final testCases = positionTests;

    for (final testCase in testCases) {
      testGoldens(testCase['Do'] as String, (tester) async {
        await loadAppFonts();
        await tester.pumpWidgetBuilder(
          MyPointerTestLinearGauge(
            needlePointer: testCase['needlePointer'] as NeedlePointer?,
            x: testCase['xCordinate'] as double,
            y: testCase['yCordinate'] as double,
            radius: testCase['radius'] as double,
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
  final NeedlePointer? needlePointer;
  final double radius;
  final double x;
  final double y;

  // final bool? inverseRuler;
  const MyPointerTestLinearGauge({
    super.key,
    this.needlePointer,
    this.radius = 0.9,
    this.x = 0.5,
    this.y = 0.5,

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
            xCenterCoordinate: x,
            yCenterCoordinate: y,
            radiusFactor: radius,
            track: const RadialTrack(
              trackStyle: TrackStyle(
                showLastLabel: false,
                labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
              color: Colors.black,
              start: 0,
              end: 100,
              startAngle: 0,
              endAngle: 360,
            ),
            needlePointer: [
              needlePointer!,
            ],
          ),
        ),
      ),
    );
  }
}
