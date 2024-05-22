import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

List positionTests = [
  {
    "needlePointer": const NeedlePointer(
      value: 0,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.5,
    "yCordinate": 0.5,
    "radius": 1.0,
    "name": "radial-center-position-needle-pointer-value-0",
    "Do": "Needle Pointer should be drawn on Radial Gauge at Center",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 0,
      color: Colors.blueAccent,
    ),
    "xCordinate": 1.0,
    "yCordinate": 0.5,
    "radius": 1.0,
    "name": "radial-right-position-needle-pointer-value-0",
    "Do": "Needle Pointer should be drawn on Radial Gauge at Right",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 50,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.0,
    "yCordinate": 0.5,
    "radius": 1.0,
    "name": "radial-left-position-needle-pointer-value-50",
    "Do": "Needle Pointer should be drawn on Radial Gauge at Left",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 25,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.5,
    "yCordinate": 1.0,
    "radius": 1.0,
    "name": "radial-bottom-position-needle-pointer-value-25",
    "Do": "Needle Pointer should be drawn on Radial Gauge at Bottom",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 75,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.5,
    "yCordinate": 0.0,
    "radius": 1.0,
    "name": "radial-top-position-needle-pointer-value-75",
    "Do": "Needle Pointer should be drawn on Radial Gauge at Top",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 10,
      color: Colors.blueAccent,
    ),
    "xCordinate": 1.0,
    "yCordinate": 1.0,
    "radius": 1.0,
    "name": "radial-right-bottom-position-needle-pointer-value-10",
    "Do": "Needle Pointer should be drawn on Radial Gauge at Right Bottom",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 60,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.0,
    "yCordinate": 0.0,
    "radius": 1.0,
    "name": "radial-left-top-position-needle-pointer-value-60",
    "Do": "Needle Pointer should be drawn on Radial Gauge at Left Top",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 40,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.0,
    "yCordinate": 1.0,
    "radius": 1.0,
    "name": "radial-left-bottom-position-needle-pointer-value-40",
    "Do": "Needle Pointer should be drawn on Radial Gauge at Left Bottom",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 90,
      color: Colors.blueAccent,
    ),
    "xCordinate": 1.0,
    "yCordinate": 0.0,
    "radius": 1.0,
    "name": "radial-right-top-position-needle-pointer-value-90",
    "Do": "Needle Pointer should be drawn on Radial Gauge at Right Top",
  },

  // With Radius 0.5
  {
    "needlePointer": const NeedlePointer(
      value: 0,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.5,
    "yCordinate": 0.5,
    "radius": 0.5,
    "name": "radial-center-position-needle-pointer-value-0-radius-0.5",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge at Center with Radius 0.5",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 0,
      color: Colors.blueAccent,
    ),
    "xCordinate": 1.0,
    "yCordinate": 0.5,
    "radius": 0.5,
    "name": "radial-right-position-needle-pointer-value-0-radius-0.5",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge at Right with Radius 0.5",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 50,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.0,
    "yCordinate": 0.5,
    "radius": 0.5,
    "name": "radial-left-position-needle-pointer-value-50-radius-0.5",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge at Left with Radius 0.5",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 25,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.5,
    "yCordinate": 1.0,
    "radius": 0.5,
    "name": "radial-bottom-position-needle-pointer-value-25-radius-0.5",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge at Bottom with Radius 0.5",
  },
  {
    "needlePointer": const NeedlePointer(
      value: 75,
      color: Colors.blueAccent,
    ),
    "xCordinate": 0.5,
    "yCordinate": 0.0,
    "radius": 0.5,
    "name": "radial-top-position-needle-pointer-value-75-radius-0.5",
    "Do":
        "Needle Pointer should be drawn on Radial Gauge at Top with Radius 0.5",
  },
];
