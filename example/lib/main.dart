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
          pointers: const [
            Pointer(
              value: 50,
              shape: PointerShape.circle,
            ),
          ],
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RadialGauge(
        track: const RadialTrack(
            color: Colors.grey,
            start: 0,
            end: 100,
            trackStyle: TrackStyle(
                showLastLabel: false,
                secondaryRulerColor: Colors.grey,
                secondaryRulerPerInterval: 3)),
        needlePointer: [
          NeedlePointer(
            value: 30,
            color: Colors.red,
            tailColor: Colors.black,
            tailRadius: 0,
            needleStyle: NeedleStyle.flatNeedle,
          ),
        ],
      ),
    );
  }
}
