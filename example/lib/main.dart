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
          gaugeOrientation: GaugeOrientation.horizontal,
          enableGaugeAnimation: true,
          rulers: RulerStyle(
            rulerPosition: RulerPosition.bottom,
          ),
          valueBar: [
            ValueBar(
              value: 20,
              offset: 300,
            )
          ],
          customLabels: [
            CustomRulerLabel(text: "Hello One", value: value),
            CustomRulerLabel(text: "Hello Two", value: 60),
          ],
          pointers: [],
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

class _RadialGaugeExampleState extends State<RadialGaugeExample> {
  double value = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RadialGauge(
        track: RadialTrack(
          trackStyle: TrackStyle(
              labelStyle: TextStyle(color: Colors.white),
              primaryRulerColor: Colors.blueAccent,
              secondaryRulerColor: Colors.blueGrey),
          color: Colors.white,
          start: 0,
          end: 100,
          // startAngle: 0,
          // endAngle: 360,
        ),
        shapePointer: [
          RadialShapePointer(
            // offset: -30,
            color: Colors.red,
            width: 40,
            height: 40,
            isInteractive: true,
            onChanged: (v) {
              setState(() {
                value = v;
              });
            },
            value: value,
            shape: PointerShape.triangle,
          )
        ],
      ),
    );
  }
}
