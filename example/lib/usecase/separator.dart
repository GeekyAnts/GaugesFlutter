import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Separator(),
    ),
  );
}

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LinearGauge(
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
              thickness: 30.0,
              borderRadius: 10,
              linearGaugeValueColor: Colors.green,
              edgeStyle: LinearEdgeStyle.bothCurve,
              backgroundColor: Color(0xff3D3B3F)),
          start: 0,
          // value: 70,
          end: 100,
          gaugeOrientation: GaugeOrientation.horizontal,
          valueBar: [
            ValueBar(
                value: 70,
                color: Colors.green,
                valueBarThickness: 30,
                borderRadius: 30)
          ],
          pointers: const [
            Pointer(
                shape: PointerShape.rectangle,
                value: 70,
                color: Colors.white,
                pointerAlignment: PointerAlignment.start,
                height: 35)
          ],
          rulers: const RulerStyle(
            secondaryRulersWidth: 4,
            secondaryRulerPerInterval: 1,
            secondaryRulersHeight: 25,
            secondaryRulerColor: Colors.black,
            showPrimaryRulers: false,
            rulersOffset: 10,
            labelOffset: 10,
            inverseRulers: false,
            rulerPosition: RulerPosition.center,
            showLabel: true,
          ),
        ),
      ),
    );
  }
}
