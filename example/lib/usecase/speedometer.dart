import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Speedometer(),
    ),
  );
}

class Speedometer extends StatefulWidget {
  const Speedometer({Key? key}) : super(key: key);

  @override
  _SpeedometerState createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  double speed = 0;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      speed.toStringAsFixed(0),
                      style: speed > 150
                          ? const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 120)
                          : const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 120),
                    ),
                    InkWell(
                      onTap: () {
                        if (_timer != null && _timer!.isActive) {
                          _timer!.cancel();
                          _timer = null;
                        } else {
                          _timer = Timer.periodic(
                              const Duration(milliseconds: 50), (timer) {
                            setState(() {
                              speed =
                                  (100 + 100 * sin(timer.tick / 10)).toDouble();
                            });
                          });
                        }
                      },
                      child: const Text(
                        "kmph",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: LinearGauge(
                  start: 0,
                  end: 200,
                  enableAnimation: true,
                  valueBar: [
                    ValueBar(
                        color: const Color(0xff17c2e9),
                        value: speed,
                        valueBarThickness: 30,
                        borderRadius: 30,
                        edgeStyle: LinearEdgeStyle.bothCurve)
                  ],
                  linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                      thickness: 30,
                      borderRadius: 30,
                      edgeStyle: LinearEdgeStyle.bothCurve,
                      linearGradient: LinearGradient(colors: [
                        Color(0xff0a3d60),
                        Color(0xff072E5f),
                        Color(0xff0212161),
                        Color(0xff0490A60),
                        Color(0xff630362),
                      ])),
                  rulers: const RulerStyle(
                    showLabel: false,
                    showPrimaryRulers: false,
                    rulerPosition: RulerPosition.bottom,
                    showSecondaryRulers: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
