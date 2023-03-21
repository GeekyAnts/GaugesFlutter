import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GradientProgressBar(),
    ),
  );
}

class MyProgressBar extends StatelessWidget {
  const MyProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearGauge(
            start: 0,
            end: 100,
            valueBar: [
              ValueBar(
                  color: Colors.green,
                  value: 50,
                  valueBarThickness: 30,
                  borderRadius: 30,
                  edgeStyle: LinearEdgeStyle.bothCurve)
            ],
            linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
              thickness: 30,
              borderRadius: 30,
              edgeStyle: LinearEdgeStyle.bothCurve,
              backgroundColor: Colors.green.shade100,
            ),
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

class GradientProgressBar extends StatelessWidget {
  const GradientProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearGauge(
            start: 0,
            end: 100,
            value: 100,
            // valueBar: [
            //   ValueBar(
            //       color: Colors.green,
            //       value: 50,
            //       valueBarThickness: 30,
            //       borderRadius: 30,
            //       edgeStyle: LinearEdgeStyle.bothCurve)
            // ],
            linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
                thickness: 30,
                borderRadius: 30,
                edgeStyle: LinearEdgeStyle.bothCurve,
                // backgroundColor: Colors.green.shade100,
                linearGradient:
                    LinearGradient(colors: [Colors.orange, Colors.red])),
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
