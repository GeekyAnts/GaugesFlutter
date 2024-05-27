import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

List needlePointerTestCases = [
  {
    "needlePointer": const NeedlePointer(
      value: 0,
      tailRadius: 10,
      needleStyle: NeedleStyle.gaugeNeedle,
    ),
    "name": "needle-pointer-gauge-needle-value-0",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge with gauge needle style at value 0",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 30,
      needleStyle: NeedleStyle.gaugeNeedle,
    ),
    "name": "needle-pointer-gauge-needle-value-30",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge with gauge needle style at value 30",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 50,
      needleStyle: NeedleStyle.gaugeNeedle,
    ),
    "name": "needle-pointer-gauge-needle-value-50",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge with gauge needle style at value 50",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 100,
      needleStyle: NeedleStyle.gaugeNeedle,
    ),
    "name": "needle-pointer-gauge-needle-value-100",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge with gauge needle style at value 100",
  },
  //Needle Style flat Needle
  {
    "needlePointer": const NeedlePointer(
      value: 0,
      needleStyle: NeedleStyle.flatNeedle,
    ),
    "name": "needle-pointer-flat-needle-value-0",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge with flat needle style at value 0",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 30,
      needleStyle: NeedleStyle.flatNeedle,
    ),
    "name": "needle-pointer-flat-needle-value-30",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge with flat needle style at value 30",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 50,
      needleStyle: NeedleStyle.flatNeedle,
    ),
    "name": "needle-pointer-flat-needle-value-50",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge with flat needle style at value 50",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 100,
      needleStyle: NeedleStyle.flatNeedle,
    ),
    "name": "needle-pointer-flat-needle-value-100",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge with flat needle style at value 100",
  },
];
