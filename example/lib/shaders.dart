import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(const MaterialApp(
    home: MyShaders(),
  ));
}

class MyShaders extends StatefulWidget {
  const MyShaders({super.key});

  @override
  State<MyShaders> createState() => _MyShadersState();
}

class _MyShadersState extends State<MyShaders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // height: MediaQuery.of(context).size.height,
              color: Colors.pink.shade100,
              child: LinearGauge(
                gaugeOrientation: GaugeOrientation.horizontal,
                // enableAnimation: true,
                valueBar: [
                  ValueBar(
                      value: 20,
                      valueBarThickness: 250,
                      position: ValueBarPosition.top),
                ],
                pointers: const [
                  // Pointer(
                  //   value: 10,
                  //   shape: PointerShape.circle,
                  //   pointerPosition: PointerPosition.top,
                  //   height: 10,
                  // ),
                  Pointer(
                    value: 10,
                    height: 350,
                    shape: PointerShape.triangle,
                    pointerPosition: PointerPosition.bottom,
                  ),
                ],
                start: 0,
                end: 100,
                linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                  thickness: 100,
                  // backgroundColor: Colors.green.shade100,
                ),
                rulers: const RulerStyle(
                  rulerPosition: RulerPosition.center,
                  // primaryRulersHeight: 360,
                  secondaryRulersHeight: 310,
                  textStyle: TextStyle(
                    fontSize: 12,
                  ),
                  // rulersOffset: 20,
                  // labelOffset: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
