import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicSystem(),
    ),
  );
}

class MusicSystem extends StatelessWidget {
  const MusicSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearGauge(
            start: 0,
            end: 100,
            linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
                thickness: 30,
                borderRadius: 30,
                edgeStyle: LinearEdgeStyle.bothCurve,
                linearGradient: LinearGradient(colors: [
                  Color(0xff4b4e55),
                  Color(0xff666970),
                  Color(0xffA5a8Af),
                  Color(0xffc1c3ce),
                  // Colors.white
                ])),
            rulers: const RulerStyle(
              showLabel: false,
              showPrimaryRulers: false,
              rulerPosition: RulerPosition.bottom,
              showSecondaryRulers: false,
            ),
          ),
        ),
      ),
    );
  }
}
