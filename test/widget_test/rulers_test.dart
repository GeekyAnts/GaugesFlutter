import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  var linearGauge = MaterialApp(
    home: Scaffold(
      body: LinearGauge(
        start: 0,
        end: 100,
        rulers: const RulerStyle(
          rulerPosition: RulerPosition.bottom,
        ),
      ),
    ),
  );
  testWidgets('Verify the default start and end', (tester) async {
    await tester.pumpWidget(linearGauge);
    var gauge = find.byType(LinearGauge);
    expect(gauge, findsOneWidget);
  });
}
