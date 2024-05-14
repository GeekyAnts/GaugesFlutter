import 'package:example/gauge_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LinearGaugeExample(),
    ),
  );
}

///
/// The following code  is a Simple Example of [LinearGauge] Widget.
/// You can customize the [LinearGauge] Widget as per your need.
///
class LinearGaugeExample extends StatefulWidget {
  const LinearGaugeExample({Key? key}) : super(key: key);

  @override
  State<LinearGaugeExample> createState() => _LinearGaugeExampleState();
}

class _LinearGaugeExampleState extends State<LinearGaugeExample> {
  NumberFormat formatter =
      NumberFormat.currency(locale: 'en_US', name: 'Rupees');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            LinearGauge(
              numberFormat:
                  NumberFormat.currency(decimalDigits: 1, symbol: 'F'),
              start: -70.33,
              end: 62.4444,
              gaugeOrientation: GaugeOrientation.horizontal,
              enableGaugeAnimation: true,
              rulers: RulerStyle(
                rulerPosition: RulerPosition.bottom,
              ),
              pointers: const [
                Pointer(
                  value: 50,
                  shape: PointerShape.circle,
                ),
              ],
            ),
            // SfLinearGauge(
            //   showAxisTrack: true,
            //   minimum: -70.333333,
            //   numberFormat: NumberFormat.currency(decimalDigits: 1, symbol: ''),
            //   maximum: 62.4,
            // )
          ],
        ),
      ),
    );
  }
}

///
/// The following code  is a Simple Example of [RadialGauge] Widget.
/// You can customize the [RadialGauge] Widget as per your need.
///

// class RadialGaugeExample extends StatefulWidget {
//   const RadialGaugeExample({super.key});

//   @override
//   State<RadialGaugeExample> createState() => _RadialGaugeExampleState();
// }

// class _RadialGaugeExampleState extends State<RadialGaugeExample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: RadialGauge(
//         track: RadialTrack(
//           start: 0,
//           end: 100,
//         ),
//         needlePointer: [
//           NeedlePointer(
//             value: 30,
//           ),
//         ],
//       ),
//     );
//   }
// }
