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
<<<<<<< HEAD
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // height: MediaQuery.of(context).size.height,
            color: Colors.pink.shade100,
            child: LinearGauge(
              gaugeOrientation: GaugeOrientation.horizontal,
              enableAnimation: true,
              valueBar: [
                ValueBar(
                  value: 20,
                  position: ValueBarPosition.top,
                  offset: 30.0,
                )
              ],
              pointers: const [
                Pointer(
                  value: 10,
                  shape: PointerShape.circle,
                  pointerPosition: PointerPosition.center,
                ),
                Pointer(
                  value: 10,
                  shape: PointerShape.triangle,
                  pointerPosition: PointerPosition.bottom,
                ),
              ],
              start: 0,
              end: 100,
              linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                thickness: 4,
                // backgroundColor: Colors.green.shade100,
              ),
              rulers: const RulerStyle(
                  rulerPosition: RulerPosition.bottom,
                  primaryRulersHeight: 20,
                  rulersOffset: 20,
                  labelOffset: 30),
            ),
          ),
        ],
=======
      body: Center(
        child: LinearGauge(
          start: 0,
          end: 100,
          value: 40,
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
              thickness: 30,
              borderRadius: 30,
              edgeStyle: LinearEdgeStyle.bothCurve,
              // backgroundColor: Colors.green.shade100,
              linearGradient: LinearGradient(
                colors: [Colors.orange, Colors.red, Colors.green],
              )),
          rulers: const RulerStyle(
            showLabel: false,
            showPrimaryRulers: false,
            rulerPosition: RulerPosition.bottom,
            showSecondaryRulers: false,
          ),
        ),
>>>>>>> 8df83e9 (Added shader support for lg bg)
      ),
    );
  }
}
