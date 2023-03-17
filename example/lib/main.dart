import 'package:example/gauge_vertical.dart';
import 'package:example/pointer_alignment_example.dart';
import 'package:example/tickness_extend_example.dart';
import 'package:example/valuebar_position.dart';
import 'package:flutter/material.dart';

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
      body: const MyValueBarPosition(),
    );
  }
}
