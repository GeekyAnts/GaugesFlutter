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
      rulers: RulerStyle(
        primaryRulerColor: Colors.black54,
        showLinearGaugeContainer: true,
        gaugeOrientation: GaugeOrientation.horizontal,
        primaryRulersWidth: 1.0,
        primaryRulersHeight: 15.0,
        secondaryRulersHeight: 1.0,
        secondaryRulersWidth: 1.0,
        labelTopMargin: 0.0,
        secondaryRulerColor: Colors.grey,
        secondaryRulerPerInterval: 1.0,
        linearGaugeBoxDecoration: LinearGaugeBoxDecoration(),
        value: 0,
        textStyle: TextStyle(
          fontSize: 12.0,
          color: Color.fromARGB(255, 86, 86, 86),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        rulerPosition: RulerPosition.bottom,
      ),
    );
  });
  group(' Testing', () {
    test('RenderLinearGauge test getter and setter', () {
      TextStyle textStyle = const TextStyle(
        fontSize: 12.0,
        color: Color.fromARGB(255, 86, 86, 86),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      );
      expect(linearGauge.start, 0.0);
      expect(linearGauge.end, 1000.0);
      expect(linearGauge.rulers!.value, 0);
      expect(linearGauge.steps, 0);
      expect(linearGauge.rulers!.showLinearGaugeContainer, true);
      expect(linearGauge.rulers!.gaugeOrientation, GaugeOrientation.horizontal);
      expect(linearGauge.rulers!.textStyle, textStyle);
      expect(linearGauge.rulers!.primaryRulersWidth, 1.0);
      expect(linearGauge.rulers!.primaryRulersHeight, 15.0);
      expect(linearGauge.rulers!.secondaryRulerColor, Colors.grey);
      expect(linearGauge.rulers!.primaryRulerColor, Colors.black54);
      expect(linearGauge.rulers!.secondaryRulersHeight, 1);
      expect(linearGauge.rulers!.secondaryRulersWidth, 1);
      expect(linearGauge.rulers!.labelTopMargin, 0.0);
      expect(linearGauge.rulers!.linearGaugeBoxDecoration,
          const LinearGaugeBoxDecoration());
      expect(linearGauge.rulers!.secondaryRulerPerInterval, 1.0);
      expect(linearGauge.rulers!.rulerPosition!, RulerPosition.bottom);
    });

    test("Verify Offset boundaries", () {});
  });
}
