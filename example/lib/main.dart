import 'dart:developer';

import 'package:example/gauge_vertical.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LinearGaugeExample(),
    ),
  );
}

///
/// The following code  is a Simple Example of [LinearGauge] Widget.
/// You can customize the [LinearGauge] Widget as per your need.
///

class LinearGaugeExample extends StatefulWidget {
  const LinearGaugeExample({Key? key}) : super(key: key);

  @override
  State<LinearGaugeExample> createState() => _LinearGaugeExampleState();
}

class _LinearGaugeExampleState extends State<LinearGaugeExample> {
  double startVal = 0.0;
  ValueNotifier<double> value = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            LinearGauge(
              start: startVal,
              end: 100,
              gaugeOrientation: GaugeOrientation.horizontal,
              enableGaugeAnimation: true,
              rulers: RulerStyle(
                rulerPosition: RulerPosition.bottom,
              ),
              pointers: const [
                Pointer(
                  value: 50,
                  shape: PointerShape.circle,
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  if (startVal == 0.0) {
                    setState(() {
                      startVal = 50.0;
                    });
                  } else {
                    setState(() {
                      startVal = 0.0;
                    });
                  }
                  log(startVal.toString());
                },
                child: const Text('Toggle Start'))
          ],
        ),
      ),
    );
  }
}
