import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  late LinearGauge linearGauge;
  setUp(() {
    linearGauge = LinearGauge(
      start: 0,
      end: 1000,
      steps: 0,
      // ignore: deprecated_member_use_from_same_package
      value: 0,
      showLinearGaugeContainer: true,
      gaugeOrientation: GaugeOrientation.horizontal,
      labelTopMargin: 0.0,
      pointers: [
        Pointer(
          value: 0,
          shape: PointerShape.triangle,
          pointerPosition: PointerPosition.bottom,
        )
      ],
      linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(),
      rulers: const RulerStyle(
        primaryRulerColor: Colors.black54,
        primaryRulersWidth: 1.0,
        primaryRulersHeight: 15.0,
        secondaryRulersHeight: 1.0,
        secondaryRulersWidth: 1.0,
        secondaryRulerColor: Colors.grey,
        secondaryRulerPerInterval: 1.0,
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

      expect(linearGauge.value, 0);
      expect(linearGauge.steps, 0);
      expect(linearGauge.showLinearGaugeContainer, true);
      expect(linearGauge.gaugeOrientation, GaugeOrientation.horizontal);
      expect(linearGauge.rulers!.textStyle, textStyle);
      expect(linearGauge.rulers!.primaryRulersWidth, 1.0);
      expect(linearGauge.rulers!.primaryRulersHeight, 15.0);
      expect(linearGauge.rulers!.secondaryRulerColor, Colors.grey);
      expect(linearGauge.rulers!.primaryRulerColor, Colors.black54);
      expect(linearGauge.rulers!.secondaryRulersHeight, 1);
      expect(linearGauge.rulers!.secondaryRulersWidth, 1);
      expect(linearGauge.labelTopMargin, 0.0);
      expect(linearGauge.linearGaugeBoxDecoration,
          const LinearGaugeBoxDecoration());
      expect(linearGauge.rulers!.secondaryRulerPerInterval, 1.0);
      expect(linearGauge.rulers!.rulerPosition!, RulerPosition.bottom);
    });

    test("Verify Offset boundaries", () {});
  });
}
