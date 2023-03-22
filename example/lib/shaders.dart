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
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: LinearGauge(
              start: 0,
              end: 100,
              linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                thickness: 30,
                // backgroundColor: Colors.green.shade100,
              ),
              rulers: const RulerStyle(
                rulerPosition: RulerPosition.top,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: LinearGauge(
              start: 0,
              end: 100,
              linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                thickness: 30,

                // backgroundColor: Colors.green.shade100,
              ),
              rulers: const RulerStyle(
                rulerPosition: RulerPosition.bottom,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
