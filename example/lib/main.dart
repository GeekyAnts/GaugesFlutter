import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(const MaterialApp(home: MyGaugeExample()));
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
      backgroundColor: const Color(0xff1e1e1e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LinearGauge(
                  // rulers: ,
                  rangeLinearGauge: [
                    RangeLinearGauge(color: Colors.blue, start: 0, end: 10),
                    RangeLinearGauge(color: Colors.green, start: 10, end: 25),
                    RangeLinearGauge(color: Colors.orange, start: 25, end: 35),
                    RangeLinearGauge(color: Colors.yellow, start: 35, end: 50),
                    RangeLinearGauge(color: Colors.purple, start: 50, end: 75),
                    RangeLinearGauge(color: Colors.red, start: 75, end: 100)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
