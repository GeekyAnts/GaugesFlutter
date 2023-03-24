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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.pink.shade100,
            child: LinearGauge(
              gaugeOrientation: GaugeOrientation.vertical,
              pointers: const [
                Pointer(
                  value: 10,
                  height: 200,
                  shape: PointerShape.circle,
                  pointerPosition: PointerPosition.center,
                ),
              ],
              start: 0,
              end: 100,
              linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                thickness: 4,
                // backgroundColor: Colors.green.shade100,
              ),
              rulers: const RulerStyle(
                rulerPosition: RulerPosition.center,
                primaryRulersHeight: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
