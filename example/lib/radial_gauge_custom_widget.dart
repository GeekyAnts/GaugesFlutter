import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

///
/// The following code  is a Simple Example of [RadialGauge] Widget with custom widgets.
///
class RadialGaugeCustomWidget extends StatefulWidget {
  const RadialGaugeCustomWidget({super.key});

  @override
  State<RadialGaugeCustomWidget> createState() =>
      _RadialGaugeCustomWidgetState();
}

class _RadialGaugeCustomWidgetState extends State<RadialGaugeCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: RadialGauge(
        track: RadialTrack(
          color: Colors.grey,
          start: 0,
          end: 100,
          thickness: 40,
        ),
        widgetPointer: [
          RadialWidgetPointer(
            value: 35.5,
            child: Text("35.5"),
          ),
          RadialWidgetPointer(
            value: 78.2,
            child: Text("78.2"),
          ),
        ],
      ),
    );
  }
}
