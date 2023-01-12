import 'package:flutter/material.dart';

class LabelStyle {
  const LabelStyle(
      {this.fontSize = 12.0, this.color = Colors.black, this.showLabel = true});

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
}
