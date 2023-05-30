import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class MyValueBarPosition extends StatefulWidget {
  const MyValueBarPosition({super.key});

  @override
  State<MyValueBarPosition> createState() => _MyValueBarPositionState();
}

class _MyValueBarPositionState extends State<MyValueBarPosition> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: LinearGauge(
            gaugeOrientation: GaugeOrientation.horizontal,
            linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
                thickness: 10,
                linearGradient: LinearGradient(colors: [
                  Color.fromARGB(255, 114, 191, 255),
                  Color.fromARGB(255, 107, 255, 115),
                  Color.fromARGB(255, 255, 114, 107),
                ])),

            // curves: [
            //   CustomCurve(
            //     curvePosition: CurvePosition.top,
            //     midPoint: 50,
            //     start: 10,
            //     end: 50,
            //     startHeight: 100,
            //     endHeight: 100,
            //     midHeight: 100,
            //   )
            // ],
            // linearGaugeBoxDecoration: LinearGaugeBoxDecoration(thickness: 80),
            pointers: [
              Pointer(
                value: value,
                shape: PointerShape.circle,
                height: 100,
                isInteractive: true,
                onChanged: (v) {
                  setState(() {
                    value = v;
                  });
                },
                width: 100,
                color: Colors.black.withOpacity(0.3),
                labelStyle: const TextStyle(color: Colors.black),
                pointerPosition: PointerPosition.top,
              ),
              // WidgetPointer(
              //     value: 50,
              //     pointerPosition: PointerPosition.center,
              //     child: Container(
              //       height: 100,
              //       width: 60,
              //       color: Colors.amber,
              //     ))
            ],
            // extendLinearGauge: 10,
            // customLabels: const [
            //   CustomRulerLabel(text: "0", value: 0),
            //   CustomRulerLabel(text: "50", value: 50),
            //   CustomRulerLabel(text: "100", value: 100),
            // ],
            rulers: RulerStyle(
              inverseRulers: true,
              rulerPosition: RulerPosition.bottom,
              labelOffset: 10,
              rulersOffset: 8,
              primaryRulersHeight: 20,
              secondaryRulersHeight: 10,
              textStyle: const TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
