import 'package:flutter/material.dart';

class LabelStyle {
  const LabelStyle(
      {this.fontSize = 12.0,
      this.color = Colors.black,
      this.showLabel = true,
      this.invertLabels = false,
      this.middleRuler = false});

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
  /// Sets the position of the label
  /// i.e upside or bottomside of the GaugeContainer
  /// default is to false
  final bool? invertLabels;

  /// Sets whether ruler starts from middle or not
  /// default is to false
  final bool? middleRuler;
}
