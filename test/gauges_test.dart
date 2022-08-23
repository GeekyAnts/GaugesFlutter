import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gauges/linear_gauge/linear_gauge_painter.dart';
import 'package:gauges/linear_gauge/styles/linear_gauge_container_style.dart';
import 'package:gauges/utils/gauge_orientation.dart';

void main() {
  late RenderLinearGauge renderLinearGauge;
  setUp(() {
    renderLinearGauge = RenderLinearGauge(
      start: 0,
      end: 1000,
      steps: 0,
      showLinearGaugeContainer: true,
      gaugeOrientation: GaugeOrientation.horizontal,
      textStyle: const TextStyle(
        fontSize: 12.0,
        color: Color.fromARGB(255, 86, 86, 86),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
      primaryRulersWidth: 1.0,
      primaryRulersHeight: 15.0,
      secondaryRulersHeight: 1.0,
      secondaryRulersWidth: 1.0,
      labelTopMargin: 0.0,
      primaryRulerColor: Colors.black54,
      secondaryRulerColor: Colors.grey,
      linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(),
      secondaryRulerPerInterval: 1.0,
      value: 0,
      linearGaugeContainerValueColor: Colors.green,
      linearGaugeContainerBgColor: Colors.grey,
    );
  });
  group('RenderLinearGauge', () {
    test('RenderLinearGauge test getter and setter', () {
      TextStyle textStyel = const TextStyle(
        fontSize: 12.0,
        color: Color.fromARGB(255, 86, 86, 86),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      );
      expect(renderLinearGauge.getStart, 0.0);
      expect(renderLinearGauge.getEnd, 1000.0);
      expect(renderLinearGauge.getSteps, 0);
      expect(renderLinearGauge.getShowLinearGaugeContainer, true);
      expect(
          renderLinearGauge.getGaugeOrientation, GaugeOrientation.horizontal);
      expect(renderLinearGauge.getTextStyle, textStyel);
      expect(renderLinearGauge.getPrimaryRulersWidth, 1.0);
    });
  });
}
