import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class MyValueBarPosition extends StatefulWidget {
  const MyValueBarPosition({super.key});

  @override
  State<MyValueBarPosition> createState() => _MyValueBarPositionState();
}

class _MyValueBarPositionState extends State<MyValueBarPosition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          gaugeOrientation: GaugeOrientation.horizontal,

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
              value: 90,
              shape: PointerShape.circle,
              height: 100,
              width: 100,
              color: Colors.black.withOpacity(0.3),
              labelStyle: TextStyle(color: Colors.black),
              pointerPosition: PointerPosition.top,
            ),
            // ShapePointer(
            //   value: 0,
            //   shape: PointerShape.circle,
            //   height: 200,
            //   // height: 20,
            //   pointerPosition: PointerPosition.top,
            //   pointerAlignment: PointerAlignment.center,
            // )
            // ,
            WidgetPointer(
                value: 50,
                pointerPosition: PointerPosition.center,
                child: Container(
                  height: 100,
                  width: 60,
                  color: Colors.amber,
                ))
          ],
          // extendLinearGauge: 10,
          // customLabels: const [
          //   CustomRulerLabel(text: "0", value: 0),
          //   CustomRulerLabel(text: "50", value: 50),
          //   CustomRulerLabel(text: "100", value: 100),
          // ],
          rulers: RulerStyle(
            inverseRulers: true,
            rulerPosition: RulerPosition.center,
            labelOffset: 10,
            rulersOffset: 10,
            primaryRulersHeight: 30,
            textStyle: const TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
