import 'dart:ui';

abstract class BaseRulerStyle {
  const BaseRulerStyle({
    this.primaryRulersHeight,
    this.primaryRulersWidth,
    this.primaryRulerColor,
    this.secondaryRulersHeight,
    this.secondaryRulersWidth,
    this.secondaryRulerColor,
    this.inverseRulers,
    this.showPrimaryRulers = true,
    this.showSecondaryRulers = true,
    this.showLabel = true,
    this.labelOffset,
    this.rulersOffset,
    this.secondaryRulerPerInterval,
  });

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
  /// Sets the visibility of the label
  /// default is to true
  final bool? showLabel;

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
  final bool? inverseRulers;
}
