import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/base/base_ruler_style.dart';

///
/// RulerStyle allows to customize the style of [LinearGauge] Rulers.
///

class RulerStyle extends BaseRulerStyle {
  RulerStyle({
    super.primaryRulerColor = Colors.black54,
    super.primaryRulersWidth = 1.0,
    super.primaryRulersHeight = 10.0,
    super.secondaryRulersHeight = 5.0,
    super.secondaryRulersWidth = 1.0,
    super.secondaryRulerColor = Colors.grey,
    super.secondaryRulerPerInterval = 1.0,
    super.showSecondaryRulers = true,
    super.showPrimaryRulers = true,
    this.textStyle = const TextStyle(
      fontSize: 12.0,
      color: Color.fromARGB(255, 86, 86, 86),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
    ),
    super.showLabel = true,
    required this.rulerPosition,
    super.labelOffset = 0,
    super.rulersOffset = 0,
    super.inverseRulers = false,
  });

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
  /// rulers : RulerStyle(
  ///   rulerPosition: RulerPosition.bottom,
  /// ),
  /// ```
  ///

  final RulerPosition? rulerPosition;

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
  ///   rulers: RulerStyle(
  ///   textStyle: TextStyle(color: Colors.red, fontSize: 16.0),
  /// )
  /// ),
  /// ```
  ///
  final TextStyle? textStyle;
}
