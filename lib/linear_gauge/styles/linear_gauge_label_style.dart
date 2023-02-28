import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class LabelStyle {
  const LabelStyle({
    this.fontSize = 12.0,
    this.color = Colors.black,
    this.showLabel = true,
    this.rulerPosition = RulerPosition.bottom,
  });

  ///
  /// Sets the font size of the label
  /// default is to 11.0
  final double? fontSize;

  ///
  /// Sets the font color of the label
  /// default is to [Colors.black]
  final Color? color;

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
  /// child: const LabelStyle(
  ///   rulerPosition: RulerPosition.bottom,
  /// ),
  /// ```
  ///

  final RulerPosition? rulerPosition;
}
