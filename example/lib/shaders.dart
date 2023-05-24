import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

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
  double valueBarThickNess = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                valueBarThickNess++;
                setState(() {});
              },
              child: Text("$valueBarThickNess"),
            ),
            Container(
              // height: MediaQuery.of(context).size.height,
              color: Colors.pink.shade100,
              child: LinearGauge(
                gaugeOrientation: GaugeOrientation.horizontal,
                // enableAnimation: true,
                valueBar: [
                  ValueBar(
                    value: 20,
                    valueBarThickness: valueBarThickNess,
                    position: ValueBarPosition.top,
                  ),
                ],
                pointers: const [
                  // Pointer(
                  //   value: 10,
                  //   shape: PointerShape.triangle,
                  //   pointerPosition: PointerPosition.right,
                  //   height: 160,
                  // ),
                ],
                start: 0,
                end: 100,
                linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                    // thickness: 200,
                    // backgroundColor: Colors.green.shade100,
                    ),
                rulers: RulerStyle(
                  rulerPosition: RulerPosition.center,
                  inverseRulers: true,
                  // secondaryRulersHeight: 300,
                  textStyle: TextStyle(
                    fontSize: 12,
                  ),
                  // rulersOffset: 20,
                  labelOffset: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
