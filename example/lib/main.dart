import 'package:example/gauge_vertical.dart';
import 'package:example/vert_pointer_example.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:geekyants_flutter_gauges/gauges.dart';

import 'multiple_pointer_example.dart';
>>>>>>> 69758edb4e5b5f6f73325c1b2c0020dd70eb4974

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
<<<<<<< HEAD
    return const MyVerticalGauge();
=======


    return VerticalValueBarExample();


>>>>>>> 69758edb4e5b5f6f73325c1b2c0020dd70eb4974
  }
}
