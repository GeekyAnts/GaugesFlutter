import 'package:example/gauge_vertical.dart';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RadialGaugeExample(),
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
  double value = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          gaugeOrientation: GaugeOrientation.vertical,
          rulers: RulerStyle(rulerPosition: RulerPosition.left),
        ),
      ),
    );
  }
}

///
/// The following code  is a Simple Example of [RadialGauge] Widget.
/// You can customize the [RadialGauge] Widget as per your need.
///

class RadialGaugeExample extends StatefulWidget {
  const RadialGaugeExample({super.key});

  @override
  State<RadialGaugeExample> createState() => _RadialGaugeExampleState();
}

// {
//     "needlePointer": const NeedlePointer(
//       value: 25,
//       color: Colors.blueAccent,
//     ),
//     "xCordinate": 0.5,
//     "yCordinate": 1.0,
//     "radius": 0.5,
//     "name": "radial-bottom-position-needle-pointer-value-25-radius-0.5",
//     "Do":
//         "Needle Pointer should be drawn on Radial Gauge at Bottom with Radius 0.5",
//   },
class _RadialGaugeExampleState extends State<RadialGaugeExample> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // height: 700,
        // width: 400,
        // alignment: Alignment.center,
        color: Colors.red.withOpacity(0.4),
        child: RadialGauge(
          xCenterCoordinate: 0.5,
          yCenterCoordinate: 0.5,
          radiusFactor: 0.8,
          track: RadialTrack(
            trackStyle: TrackStyle(
                labelStyle: TextStyle(color: Colors.black),
                primaryRulerColor: Colors.blueAccent,
                secondaryRulerColor: Colors.blueGrey),
            color: Colors.black,
            start: 0,
            end: 100,
            startAngle: 0,
            endAngle: 360,
          ),
          needlePointer: [
            NeedlePointer(
              // needleHeight: 2500,
              isInteractive: true,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
              color: Colors.blueAccent,
              value: value,
              needleStyle: NeedleStyle.gaugeNeedle,
            )
          ],
        ),
      ),
    );
  }
}
