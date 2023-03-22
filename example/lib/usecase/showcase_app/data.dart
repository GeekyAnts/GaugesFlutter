import 'package:example/useCase/showcase_app/playgrounds/linearGauge_playground.dart';
import 'package:example/useCase/showcase_app/playgrounds/pointer_playground.dart';
import 'package:example/useCase/speedometer.dart';
import 'package:example/usecase/server_utilization.dart';
import 'package:example/usecase/temperature_meter.dart';
import 'package:flutter/material.dart';

import '../../useCase/height_indicator.dart';
import '../../useCase/progress_bar.dart';
import '../../usecase/vaccination_graph.dart';
import '../separator.dart';
import 'playgrounds/valueBar_playground.dart';

Color backgroundColor = const Color(0xffeef2f7);

List linearGaugeUseCases = [
  // ShowCases for LinearGauge
  {
    "title": "Speedometer",
    "widget": const Speedometer(),
    "index": 0,
    "type": "UseCase",
  },
  {
    "title": "Height Indicator",
    "widget": const HeightIndicator(),
    "index": 1,
    "type": "UseCase",
  },
  {
    "title": "Progress Bar",
    "widget": const MyProgressBar(),
    "index": 2,
    "type": "UseCase",
  },
  {
    "title": "Separator",
    "widget": const Separator(),
    "index": 3,
    "type": "UseCase",
  },
  {
    "title": "Vaccination Graph",
    "widget": const MyVaccinationGraph(),
    "index": 4,
    "type": "UseCase",
  },
  {
    "title": "Server Utilization",
    "widget": const MyServerUtilizationExample(),
    "index": 5,
    "type": "UseCase",
  },
  {
    "title": "Temperature Gauge",
    "widget": const TemperatureMeter(),
    "index": 6,
    "type": "UseCase",
  },

  // API
  {
    "title": "API",
    "widget": const LinearGaugePlayGround(),
    "index": 7,
  },
  {
    "title": "Pointer API",
    "widget": const PointerPlayGround(),
    "index": 8,
  },
  {
    "title": "ValueBar API",
    "widget": const ValueBarPlayGround(),
    "index": 9,
  }
];
