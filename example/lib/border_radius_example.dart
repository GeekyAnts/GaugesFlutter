import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class BorderRadiusExample extends StatefulWidget {
  const BorderRadiusExample({super.key});

  @override
  State<BorderRadiusExample> createState() => _BorderRadiusExampleState();
}

class _BorderRadiusExampleState extends State<BorderRadiusExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          steps: 10,
          enableGaugeAnimation: true,
          fillExtend: false,
          extendLinearGauge: 9,
          // valueBar: [
          //   ValueBar(
          //       value: 20,
          //       valueBarThickness: 20,
          //       borderRadius: 10,
          //       edgeStyle: LinearEdgeStyle.startCurve)
          // ],
          rangeLinearGauge: [
            RangeLinearGauge(
                color: Colors.red,
                start: 10,
                end: 40,
                borderRadius: 10,
                edgeStyle: LinearEdgeStyle.startCurve),
            RangeLinearGauge(
              color: Colors.black,
              start: 60,
              end: 90,
              borderRadius: 10,
              edgeStyle: LinearEdgeStyle.endCurve,
            ),
          ],
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
            thickness: 20,
            borderRadius: 5,
            edgeStyle: LinearEdgeStyle.bothCurve,
          ),
          gaugeOrientation: GaugeOrientation.horizontal,
          rulers: RulerStyle(
            inverseRulers: false,
            rulerPosition: RulerPosition.top,
          ),
        ),
      ),
    );
  }
}
