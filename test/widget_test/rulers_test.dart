import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
<<<<<<< HEAD
  var linearGauge = MaterialApp(
    home: Scaffold(
      body: LinearGauge(
        start: 0,
        end: 100,
        rulers: const RulerStyle(
          rulerPosition: RulerPosition.bottom,
        ),
      ),
=======
  LinearGauge linearGauge = LinearGauge(
    start: 0,
    end: 100,
    rulers: RulerStyle(
      rulerPosition: RulerPosition.bottom,
>>>>>>> 3c83939 (Fix: goldens updated)
    ),
  );
  testWidgets('Verify the default start and end', (tester) async {
    await tester.pumpWidget(linearGauge);
    var gauge = find.byType(LinearGauge);
    expect(gauge, findsOneWidget);
  });
}
