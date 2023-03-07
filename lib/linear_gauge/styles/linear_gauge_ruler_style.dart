import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class RulerStyle {
  const RulerStyle({
    this.primaryRulerColor = Colors.black54,
    this.primaryRulersWidth = 1.0,
    this.primaryRulersHeight = 15.0,
    this.secondaryRulersHeight = 1.0,
    this.secondaryRulersWidth = 1.0,
    this.secondaryRulerColor = Colors.grey,
    this.secondaryRulerPerInterval = 1.0,
    this.showSecondaryRulers = true,
    this.showPrimaryRulers = true,
    this.textStyle = const TextStyle(
      fontSize: 12.0,
      color: Color.fromARGB(255, 86, 86, 86),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
    ),
    this.showLabel = true,
    this.rulerPosition = RulerPosition.bottom,
    this.labelOffset = 0,
    this.rulersOffset = 0,
    this.inversedRulers = false,
  });

  ///
  ///
  /// `primaryRulerColor` sets the color of the ruler which is attached to labels
  ///
  /// default is to `primaryRulerColor =Colors.grey
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   primaryRulerColor: Colors.green,
  /// )
  /// ),
  /// ```
  ///
  final Color? primaryRulerColor;

  ///
  ///
  /// `primaryRulersWidth` set the width of the Rulers which are attached to the labels
  ///
  /// default is to `primaryRulersWidth =`1.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   primaryRulersWidth: 2,
  /// )
  /// ),
  /// ```
  final double? primaryRulersWidth;

  ///
  ///
  /// `primaryRulersHeight` set the Height of the Rulers which are attached to the labels
  ///
  /// default is to `primaryRulersHeight =`10.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   primaryRulersHeight: 20,
  /// )
  /// ),
  /// ```
  ///
  final double? primaryRulersHeight;

  ///
  ///
  /// `secondaryRulersHeight` set the Height of the Rulers which are in the between of  label Rulers
  ///
  /// default is to `secondaryRulersHeight =`1.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   secondaryRulersHeight: 20,
  /// )
  /// ),
  /// ```
  ///
  final double? secondaryRulersHeight;

  ///
  ///
  /// `secondaryRulersWidth` set the width of the Rulers which are in the between of  label Rulers
  ///
  /// default is to `secondaryRulersHeight =`1.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   primaryRulersHeight: 20,
  /// )
  /// ),
  /// ```
  ///
  final double? secondaryRulersWidth;

  ///
  ///
  /// `secondaryRulerColor` sets the color of the ruler which are in the between of ruler attached to labels
  ///
  /// default is to `secondaryRulerColor =Colors.grey
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   secondaryRulerColor: Colors.green,
  /// )
  /// ),
  /// ```
  ///
  final Color? secondaryRulerColor;

  ///
  ///
  /// `secondaryRulerPerInterval` draw the ruler between primary rulers as per interval provided
  ///
  /// default is to `secondaryRulerPerInterval =1
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   secondaryRulerPerInterval:1,
  /// )
  /// ),
  /// ```
  ///
  final double? secondaryRulerPerInterval;

  ///
  ///
  /// `showSecondaryRules` sets the visibility of the secondary rulers.
  final bool showSecondaryRulers;

  ///
  ///
  /// `showSecondaryRules` sets the visibility of the primary rulers.
  final bool showPrimaryRulers;

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
  /// rulers : RulerStyle(
  ///   rulerPosition: RulerPosition.bottom,
  /// ),
  /// ```
  ///

  final RulerPosition? rulerPosition;

  ///
  /// `rulersOffset` Sets the gap between the rulers and the [LinearGauge]
  ///
  /// Note : `rulersOffset` works for `rulerPosition`- `[RulerPosition.top]` & `[RulerPosition.bottom]` only
  ///
  /// default is to `rulersOffset = 0.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   rulersOffset: 10.0,
  /// ),
  /// ```
  ///
  final double? rulersOffset;

  ///
  /// `labelOffset` Sets the gap of the label from the primary ruler
  ///
  /// default is to `labelOffset = 0.0
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   labelOffset: 10.0,
  /// ),
  /// ```
  ///
  final double? labelOffset;

  ///
  /// `inversedRulers` allows for the inversion of the gauge's rulers,
  ///  reversing the direction of the scale and indicators.
  ///
  /// default is to `inversedRulers = false`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   inversedRulers: true,
  /// ),
  /// ```
  ///
  final bool? inversedRulers;
}
