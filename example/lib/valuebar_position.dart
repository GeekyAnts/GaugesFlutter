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

          valueBar: const [
            // ValueBar(
            //   value: 75,
            //   position: ValueBarPosition.top,
            //   // valueBarThickness: 135,
            // ),
            // ValueBar(
            //   value: 75,
            //   position: ValueBarPosition.top,
            //   offset: 40,
            //   // valueBarThickness: 135,
            // )
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
            //   pointerPosition: PointerPosition.top,
            //   pointerAlignment: PointerAlignment.center,
            // ),
            // ShapePointer(
            //   value: 10,
            //   shape: PointerShape.circle,
            //   height: 100,
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
            inverseRulers: false,
            rulerPosition: RulerPosition.bottom,
            // primaryRulersHeight: 100,
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
