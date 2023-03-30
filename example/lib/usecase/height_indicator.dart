import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeightIndicator(),
    ),
  );
}

class HeightIndicator extends StatelessWidget {
  const HeightIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 80;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double screenHeight = constraints.maxHeight - 20;
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30, bottom: 8),
                // padding: const EdgeInsets.only(bottom: 8.0, right: 50, top: 11),
                child: Image.asset(
                  'assets/bmi_light.png',
                  height: height * (screenHeight / 100),
                  fit: BoxFit.fitHeight,
                ),
              ),
              LinearGauge(
                gaugeOrientation: GaugeOrientation.vertical,
                start: 0,
                end: 100,
                pointers: [
                  Pointer(
                      value: height,
                      // showLabel: true,
                      // labelStyle: TextStyle(color: Colors.red),
                      shape: PointerShape.triangle,
                      pointerPosition: PointerPosition.right),
                  Pointer(
                    value: height,
                    height: 2,
                    width: height * 3,
                    shape: PointerShape.rectangle,
                    pointerPosition: PointerPosition.left,
                  )
                ],
                linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(),
                rulers: const RulerStyle(
                  rulerPosition: RulerPosition.left,
                  // showSecondaryRulers: false,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
