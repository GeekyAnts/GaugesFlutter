import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TemperatureMeter(),
    ),
  );
}

const double temperature = 60;

class TemperatureMeter extends StatelessWidget {
  const TemperatureMeter({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Colors.white;
    const Color primaryColor = Colors.black;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearGauge(
                pointers: const [
                  Pointer(
                      height: 30,
                      width: 40,
                      value: temperature,
                      shape: PointerShape.triangle,
                      pointerPosition: PointerPosition.top)
                ],
                customLabels: const [
                  CustomRulerLabel(text: "0°c", value: 0),
                  CustomRulerLabel(text: "20°c", value: 20),
                  CustomRulerLabel(text: "40°c", value: 40),
                  CustomRulerLabel(text: "60°c", value: 60),
                  CustomRulerLabel(text: "80°c", value: 80),
                ],
                linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                  thickness: 30,
                  linearGradient: LinearGradient(colors: [
                    Colors.green,
                    Colors.greenAccent,
                    Colors.amber,
                    Colors.orange,
                    Colors.redAccent,
                    Colors.red,
                  ]),
                ),
                rulers: const RulerStyle(
                  showLabel: true,
                  showPrimaryRulers: true,
                  textStyle: TextStyle(color: primaryColor),
                  rulerPosition: RulerPosition.bottom,
                  primaryRulerColor: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
