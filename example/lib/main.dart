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

class MyGaugeExample extends StatefulWidget {
  const MyGaugeExample({Key? key}) : super(key: key);

  @override
  State<MyGaugeExample> createState() => _MyGaugeExampleState();
}

class _MyGaugeExampleState extends State<MyGaugeExample> {
  double value = 50;
  bool inverseRulers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  inverseRulers = !inverseRulers;
                  setState(() {});
                },
                child: const Text("Inverse Rulers")),
            Container(
              color: Colors.pink.withOpacity(0.1),
              child: LinearGauge(
                gaugeOrientation: GaugeOrientation.horizontal,
                valueBar: [
                  ValueBar(
                    value: value,
                    offset: 20,
                    position: ValueBarPosition.top,
                  )
                ],
                enableGaugeAnimation: true,
                rulers: RulerStyle(
                  rulerPosition: RulerPosition.bottom,
                  inverseRulers: inverseRulers,
                  showLabel: inverseRulers,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
