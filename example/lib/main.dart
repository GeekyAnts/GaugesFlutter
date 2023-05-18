import 'package:example/valuebar_position.dart';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyValueBarPosition(),
    ),
  );
}

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

          curves: [
            CustomCurve(
              curvePosition: CurvePosition.top,
              midPoint: 50,
              start: 10,
              end: 50,
              startHeight: 100,
              endHeight: 100,
              midHeight: 100,
            )
          ],
          // linearGaugeBoxDecoration: LinearGaugeBoxDecoration(thickness: 80),
          pointers: [
            // WidgetPointer(
            //   value: 50,
            //   pointerPosition: PointerPosition.top,
            //   child: Image.asset(
            //     "assets/bmi_light.png",
            //     height: 300,
            //     width: 200,
            //   ),
            // )
            // ShapePointer(
            //   value: 10,
            //   shape: PointerShape.triangle,
            //   height: 20,
            //   width: 100,
            //   pointerPosition: PointerPosition.left,
            //   pointerAlignment: PointerAlignment.center,
            // ),
            // Pointer(
            //   value: 90,
            //   shape: PointerShape.rectangle,
            //   height: 400,
            //   width: 100,
            //   color: Colors.black.withOpacity(0.3),
            //   labelStyle: TextStyle(color: Colors.black),
            //   pointerPosition: PointerPosition.bottom,
            // ),
            // ShapePointer(
            //   value: 0,
            //   shape: PointerShape.circle,
            //   height: 200,
            //   // height: 20,
            //   pointerPosition: PointerPosition.top,
            //   pointerAlignment: PointerAlignment.center,
            // )
          ],
          // extendLinearGauge: 10,
          // customLabels: const [
          //   CustomRulerLabel(text: "0", value: 0),
          //   CustomRulerLabel(text: "50", value: 50),
          //   CustomRulerLabel(text: "100", value: 100),
          // ],
          rulers: const RulerStyle(
            inverseRulers: true,
            rulerPosition: RulerPosition.bottom,
            labelOffset: 10,
            rulersOffset: 10,
            primaryRulersHeight: 30,
            textStyle: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class MyGaugeExample extends StatefulWidget {
  const MyGaugeExample({Key? key}) : super(key: key);

  @override
  State<MyGaugeExample> createState() => _MyGaugeExampleState();
}

class _MyGaugeExampleState extends State<MyGaugeExample> {
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          pointers: [
            Pointer(
              value: value,
              height: 40,
              shape: PointerShape.circle,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
            )
          ],
          rulers: RulerStyle(rulerPosition: RulerPosition.bottom),
        ),
      ),
    );
  }
}
