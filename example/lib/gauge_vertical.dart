import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class MyVerticalGauge extends StatefulWidget {
  const MyVerticalGauge({super.key});

  @override
  State<MyVerticalGauge> createState() => _MyVerticalGaugeState();
}

class _MyVerticalGaugeState extends State<MyVerticalGauge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: LinearGauge(
            linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
              thickness: 30,
              borderRadius: 10,
            ),
            // enableAnimation: true,
            gaugeOrientation: GaugeOrientation.horizontal,
            rulers: RulerStyle(
              primaryRulersWidth: 10,
              primaryRulersHeight: 30,
              primaryRulerColor: Color(0xff310072),
              inverseRulers: false,
              showLabel: false,
              showSecondaryRulers: false,
              showPrimaryRulers: true,
              rulerPosition: RulerPosition.center,
            ),
          ),
        ),
      ),
    );
  }
}
