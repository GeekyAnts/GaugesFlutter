import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

///
/// The following code  is a Simple Example of [RadialGauge] Widget with custom track labels.
///
class RadialGaugeCustomLabel extends StatefulWidget {
  const RadialGaugeCustomLabel({super.key});

  @override
  State<RadialGaugeCustomLabel> createState() => _RadialGaugeCustomLabelState();
}

class _RadialGaugeCustomLabelState extends State<RadialGaugeCustomLabel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RadialGauge(
        track: RadialTrack(
            color: Colors.grey,
            start: 0,
            end: 100,
            trackLabelFormater: (double value) => "${value.round()}€",
            trackStyle: const TrackStyle(
              showFirstLabel: false,
              showLastLabel: false,
            )),
      ),
    );
  }
}
