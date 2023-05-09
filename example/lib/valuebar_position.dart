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
          // gaugeOrientation: GaugeOrientation.horizontal,
          // // enableGaugeAnimation: true,
          // // linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
          // //   borderRadius: 20,
          // //   thickness: 35,
          // //   backgroundColor: Colors.grey,
          // // ),
          // valueBar: const [
          //   ValueBar(
          //     value: 75,
          //     // valueBarThickness: 35,
          //   )
          // ],
          pointers: [
            ShapePointer(
              value: 30,
              shape: PointerShape.rectangle,
              width: 100,
              height: 200,
            ),
            WidgetPointer(
              value: 100,
              pointerPosition: PointerPosition.top,
              child: Image.asset(
                "assets/bmi_light.png",
                height: 300,
                // width: 100,
              ),
            )
          ],
          extendLinearGauge: 0,
          customLabels: const [
            CustomRulerLabel(text: "0", value: 0),
            CustomRulerLabel(text: "50", value: 50),
            CustomRulerLabel(text: "100", value: 100),
          ],
          rulers: const RulerStyle(
            inverseRulers: false,
            rulerPosition: RulerPosition.center,
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
