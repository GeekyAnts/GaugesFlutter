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
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          gaugeOrientation: GaugeOrientation.horizontal,

          // linearGaugeBoxDecoration: LinearGaugeBoxDecoration(thickness: 80),
          pointers: [
            Pointer(
                value: value,
                width: 30,
                height: 50,
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
                shape: PointerShape.circle)
          ],

          rulers: const RulerStyle(
            inverseRulers: false,
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
