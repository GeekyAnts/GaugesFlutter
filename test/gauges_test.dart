import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  LinearGauge linearGauge = const LinearGauge();
  setUp(() {
    linearGauge = const LinearGauge(
      start: 0,
      end: 1000,
      steps: 0,
      showLinearGaugeContainer: true,
      gaugeOrientation: GaugeOrientation.horizontal,
      labelStyle: LabelStyle(
        textStyle: TextStyle(
          fontSize: 12.0,
          color: Color.fromARGB(255, 86, 86, 86),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        rulerPosition: RulerPosition.bottom,
      ),
      primaryRulersWidth: 1.0,
      primaryRulersHeight: 15.0,
      secondaryRulersHeight: 1.0,
      secondaryRulersWidth: 1.0,
      labelTopMargin: 0.0,
      primaryRulerColor: Colors.black54,
      secondaryRulerColor: Colors.grey,
      linearGaugeBoxDecoration: LinearGaugeBoxDecoration(),
      secondaryRulerPerInterval: 1.0,
      value: 0,
    );
  });
  group(' Testing', () {
    test('RenderLinearGauge test getter and setter', () {
      TextStyle textStyel = const TextStyle(
        fontSize: 12.0,
        color: Color.fromARGB(255, 86, 86, 86),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      );
      expect(linearGauge.start, 0.0);
      expect(linearGauge.end, 1000.0);
      expect(linearGauge.value, 0);
      expect(linearGauge.steps, 0);
      expect(linearGauge.showLinearGaugeContainer, true);
      expect(linearGauge.gaugeOrientation, GaugeOrientation.horizontal);
      expect(linearGauge.labelStyle!.textStyle, textStyel);
      expect(linearGauge.primaryRulersWidth, 1.0);
      expect(linearGauge.primaryRulersHeight, 15.0);
      expect(linearGauge.secondaryRulerColor, Colors.grey);
      expect(linearGauge.primaryRulerColor, Colors.black54);
      expect(linearGauge.secondaryRulersHeight, 1);
      expect(linearGauge.secondaryRulersWidth, 1);
      expect(linearGauge.labelTopMargin, 0.0);
      expect(linearGauge.linearGaugeBoxDecoration,
          const LinearGaugeBoxDecoration());
      expect(linearGauge.secondaryRulerPerInterval, 1.0);
      expect(linearGauge.labelStyle!.rulerPosition!, RulerPosition.bottom);
    });

    test("Verify Offset boundaries", () {});
  });
}
