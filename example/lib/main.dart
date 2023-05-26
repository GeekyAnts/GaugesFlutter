import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyGaugeExample(),
    ),
  );
}

class MyGaugeExample extends StatefulWidget {
  const MyGaugeExample({Key? key}) : super(key: key);

  @override
  State<MyGaugeExample> createState() => _MyGaugeExampleState();
}

class _MyGaugeExampleState extends State<MyGaugeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink.withOpacity(0.1),
        child: LinearGauge(
          gaugeOrientation: GaugeOrientation.vertical,
          valueBar: [
            ValueBar(
              value: 20,
              position: ValueBarPosition.left,
              offset: 300,
            )
          ],
          enableGaugeAnimation: true,
          rulers: const RulerStyle(
            rulerPosition: RulerPosition.right,
          ),
        ),
      ),
    );
  }
}
