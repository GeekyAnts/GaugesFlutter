import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class LabelStyle {
  const LabelStyle({
    this.textStyle = const TextStyle(
      fontSize: 12.0,
      color: Color.fromARGB(255, 86, 86, 86),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
    ),
    this.showLabel = true,
    this.rulerPosition = RulerPosition.bottom,
    this.labelOffset = 0,
  });

  ///
  /// `textStyle` sets the ruler text style of [LinearGauge]
  ///
  ///  default is to
  /// ```dart
  /// const TextStyle(
  ///   fontSize: 12.0,
  ///   color: Color.fromARGB(255, 86, 86, 86),
  ///  fontStyle: FontStyle.normal,
  ///   fontWeight: FontWeight.normal,
  /// ),
  ///   ```
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   labelStyle: LabelStyle(
  ///   textStyle: TextStyle(color: Colors.red, fontSize: 16.0),
  /// )
  /// ),
  /// ```
  ///
  final TextStyle? textStyle;

  ///
  /// Sets the visibility of the label
  /// default is to true
  final bool? showLabel;

  ///
  ///
  /// `rulerPosition` Sets the position of the rulers (top,center,bottom)
  ///
  /// default is to `rulerPosition =RulerPosition.bottom
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// labelStyle : LabelStyle(
  ///   rulerPosition: RulerPosition.bottom,
  /// ),
  /// ```
  ///

  final RulerPosition? rulerPosition;

  ///
  /// `labelOffset` Sets the gap of the label from the primary ruler
  ///
  /// default is to `labelOffset = 0.0
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// labelStyle : LabelStyle(
  ///   labelOffset: 10.0,
  /// ),
  /// ```
  ///
  final double? labelOffset;
}
