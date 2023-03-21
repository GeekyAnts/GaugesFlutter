import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(const MaterialApp(
    home: MyShaders(),
  ));
}

class MyShaders extends StatefulWidget {
  const MyShaders({super.key});

  @override
  State<MyShaders> createState() => _MyShadersState();
}

class _MyShadersState extends State<MyShaders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          start: 0,
          end: 100,
          value: 40,
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
              thickness: 30,
              borderRadius: 30,
              edgeStyle: LinearEdgeStyle.bothCurve,
              // backgroundColor: Colors.green.shade100,
              linearGradient: LinearGradient(
                colors: [Colors.orange, Colors.red, Colors.green],
              )),
          rulers: const RulerStyle(
            showLabel: false,
            showPrimaryRulers: false,
            rulerPosition: RulerPosition.bottom,
            showSecondaryRulers: false,
          ),
        ),
      ),
    );
  }
}
