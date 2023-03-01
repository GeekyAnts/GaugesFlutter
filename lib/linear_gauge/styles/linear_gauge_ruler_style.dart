import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class RulerStyle {
  const RulerStyle({
    this.primaryRulerColor = Colors.black54,
    this.showLinearGaugeContainer = true,
    this.gaugeOrientation = GaugeOrientation.horizontal,
    this.primaryRulersWidth = 1.0,
    this.primaryRulersHeight = 15.0,
    this.secondaryRulersHeight = 1.0,
    this.secondaryRulersWidth = 1.0,
    this.labelTopMargin = 0.0,
    this.secondaryRulerColor = Colors.grey,
    this.secondaryRulerPerInterval = 1.0,
    this.linearGaugeBoxDecoration = const LinearGaugeBoxDecoration(),
    this.value = 0,
    this.showSecondaryRulers = true,
    this.showPrimaryRulers = true,
    this.indicator = const LinearGaugeIndicator(
      shape: PointerShape.circle,
    ),
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
  ///
  /// `primaryRulerColor` sets the color of the ruler which is attached to labels
  ///
  /// default is to `primaryRulerColor =Colors.grey
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   primaryRulerColor: Colors.green,
  /// ),
  /// ```
  ///
  final Color? primaryRulerColor;

  ///
  /// `showLinearGaugeContainer`  controls the  [LinearGauge] Container render
  ///
  /// Below example renders the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   showLinearGaugeContainer : true
  /// ),
  /// ```
  ///
  /// Below example will not render the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   showLinearGaugeContainer : false
  /// ),
  /// ```
  ///
  final bool? showLinearGaugeContainer;

  ///
  ///  `gaugeOrientation` sets the [LinearGauge] orientation to horizontal or vertical
  ///
  ///  default is to `GaugeOrientation.horizontal`
  ///
  /// ```dart
  /// const LinearGauge(
  ///   gaugeOrientation : GaugeOrientation.horizontal
  /// ),
  /// ```
  ///
  final GaugeOrientation? gaugeOrientation;

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
  ///   primaryRulersWidth: 2,
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
  ///   primaryRulersHeight: 20,
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
  ///   secondaryRulersHeight: 20,
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
  ///   primaryRulersHeight: 20,
  /// ),
  /// ```
  ///
  final double? secondaryRulersWidth;

  ///
  /// `Warning`:`deprecated`
  ///
  /// use `labelOffset` property in `labelStyle` to set gap b/w label & primary ruler
  ///
  /// `labelTopMargin` sets the margin from the  top of the label
  ///
  /// default is to `labelTopMargin =`0.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   labelTopMargin: 5.0,
  /// ),
  /// ```
  ///

  final double? labelTopMargin;

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
  ///   secondaryRulerColor: Colors.green,
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
  ///   secondaryRulerPerInterval:1,
  /// ),
  /// ```
  ///
  final double? secondaryRulerPerInterval;

  ///
  ///
  /// `linearGaugeBoxDecoration` sets the styles of Container using [LinearGaugeBoxDecoration] decoration properties
  ///
  ///
  /// Example
  ///
  ///  ```dart
  /// const LinearGauge(
  ///             linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///               color: Colors.green,
  ///               height: 30.0,
  ///            ),
  ///        ),
  /// ```
  ///
  final LinearGaugeBoxDecoration? linearGaugeBoxDecoration;

  ///
  ///
  /// `linearGaugeBoxDecoration` sets the styles of Container using [LinearGaugeBoxDecoration] decoration properties
  ///
  ///
  /// Example
  ///
  ///  ```dart
  /// const LinearGauge(
  ///             linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
  ///               color: Colors.green,
  ///               height: 30.0,
  ///            ),
  ///        ),
  /// ```
  ///
  final double? value;

  ///
  ///
  /// `showSecondaryRules` sets the visibility of the secondary rulers.
  final bool showSecondaryRulers;

  ///
  ///
  /// `showSecondaryRules` sets the visibility of the primary rulers.
  final bool showPrimaryRulers;

  ///
  /// `indicator` sets the styles of indicator using [LinearGaugeIndicator]  properties
  ///
  /// Example
  /// ```dart
  /// const LinearGauge(
  ///            indicator: LinearGaugeIndicator(
  ///             color: Colors.green,
  ///            width: 10.0,
  ///           shape: LinearGaugeIndicatorShape.circle,
  ///           height: 10.0,
  ///           ),
  /// ```
  ///
  final LinearGaugeIndicator? indicator;

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
  ///   labelStyle: RulerStyle(
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
  /// labelStyle : RulerStyle(
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
  /// labelStyle : RulerStyle(
  ///   labelOffset: 10.0,
  /// ),
  /// ```
  ///
  final double? labelOffset;
}
