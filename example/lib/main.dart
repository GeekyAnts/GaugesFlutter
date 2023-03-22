import 'package:example/border_radius_example.dart';
import 'package:example/fill_extend_example.dart';
import 'package:example/gauge_vertical.dart';
import 'package:example/pointer_alignment_example.dart';
import 'package:example/range_vertical.dart';
import 'package:example/shaders.dart';
import 'package:example/tickness_extend_example.dart';
import 'package:example/useCase/showcase_app/home.dart';
import 'package:example/valuebar_position.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        selectedItem: 0,
      ),
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
    return const Scaffold(
      body: MyShaders(),
    );
  }
}
