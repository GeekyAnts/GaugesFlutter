import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: MyGaugeExample()));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LinearGauge(
                  value: 25,
                  indicator: LinearGaugeIndicator(
                      value: 20, shape: PointerShape.circle),
                  // customLabels: CustomLinearGaugeLabel(labelSymbol: "%"),

                  // rulers: ,
                  rangeLinearGauge: [
                    // RangeLinearGauge(
                    //     color: Colors.blue[400]!, start: 0, end: 10),
                    // RangeLinearGauge(
                    //     color: Colors.green[400]!, start: 10, end: 25),
                    // RangeLinearGauge(
                    //     color: Colors.orange[400]!, start: 25, end: 35),
                    // RangeLinearGauge(
                    //     color: Colors.indigo[400]!, start: 35, end: 50),
                    // RangeLinearGauge(
                    //     color: Colors.purple[400]!, start: 50, end: 75),
                    // RangeLinearGauge(
                    //     color: Colors.red[400]!, start: 75, end: 100)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
