import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  LinearGauge linearGauge = LinearGauge(
    start: 0,
    end: 100,
    rulers: const RulerStyle(
      rulerPosition: RulerPosition.bottom,
    ),
  );
  testWidgets('Verify the default start and end', (tester) async {
    await tester.pumpWidget(linearGauge);
    var gauge = find.byType(LinearGauge);
    expect(gauge, findsOneWidget);
  });
}
