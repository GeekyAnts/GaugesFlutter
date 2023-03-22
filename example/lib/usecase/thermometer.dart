// import 'package:flutter/material.dart';
// import 'package:geekyants_flutter_gauges/linear_gauge/linear_gauge.dart';

// class Thermometer extends StatelessWidget {
//   const Thermometer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         height: 600,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             LinearGauge(
//               value: -20,
//               start: -20,
//               steps: 10,
//               end: 50,
//               extendLinearGauge: 10,
//               valueBar: [ValueBar(value: 50, valueBarThickness: 16)],
//               gaugeOrientation: GaugeOrientation.vertical,
//               linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
//                 borderRadius: 20,
//                 thickness: 25,
//               ),
//               rulers: RulerStyle(
//                   rulerPosition: RulerPosition.left,
//                   showSecondaryRulers: false),
//               pointers: [
//                 Pointer(
//                   shape: PointerShape.circle,
//                   value: -20,
//                   color: Colors.grey,
//                   showLabel: false,
//                   width: 45,
//                   pointerPosition: PointerPosition.center,
//                   pointerAlignment: PointerAlignment.center,
//                 ),
//                 Pointer(
//                   shape: PointerShape.circle,
//                   value: -20,
//                   color: Colors.blue,
//                   showLabel: false,
//                   width: 30,
//                   pointerPosition: PointerPosition.center,
//                   pointerAlignment: PointerAlignment.end,
//                 ),
//                 Pointer(
//                   shape: PointerShape.rectangle,
//                   value: -20.5,
//                   color: Colors.blue,
//                   showLabel: false,
//                   width: 16,
//                   pointerPosition: PointerPosition.center,
//                   pointerAlignment: PointerAlignment.center,
//                 )
//               ],
//             ),
//             LinearGauge(
//               start: 0,
//               end: 120,
//               steps: 20,
//               extendLinearGauge: 27,
//               gaugeOrientation: GaugeOrientation.vertical,
//               showLinearGaugeContainer: false,
//               linearGaugeBoxDecoration: LinearGaugeBoxDecoration(thickness: 25),
//               rulers: RulerStyle(
//                   rulerPosition: RulerPosition.right,
//                   showSecondaryRulers: false),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
