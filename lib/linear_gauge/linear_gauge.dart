import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'linear_gauge_painter.dart';

class LinearGauge extends LeafRenderObjectWidget {
  ///
  /// [LinearGauge] is a visualization of measurement widget with a linear scale values. Linear
  /// Gauge as rich sets of config parameters which can be modified as per requirement
  ///
  /// `start` and `end` is responsible to paint the values as a label.
  ///
  ///
  ///
  /// ``` dart
  /// LinearGauge(
  ///   steps: 2,
  ///   start: 0,
  ///   end: 100,
  ///),
  /// ```
  ///
  const LinearGauge(
      {Key? key,
      this.start = 0,
      this.end = 100,
      this.steps = 0,
      this.showLinearGaugeContainer = true,
      this.gaugeOrientation = GaugeOrientation.horizontal,
      this.primaryRulersWidth = 1.0,
      this.primaryRulersHeight = 15.0,
      this.secondaryRulersHeight = 1.0,
      this.secondaryRulersWidth = 1.0,
      this.labelTopMargin = 0.0,
      this.primaryRulerColor = Colors.black54,
      this.secondaryRulerColor = Colors.grey,
      this.linearGaugeBoxDecoration = const LinearGaugeBoxDecoration(),
      this.labelStyle = const LabelStyle(),
      this.secondaryRulerPerInterval = 1.0,
      this.showSecondaryRulers = true,
      this.showPrimaryRulers = true,
      this.indicator = const LinearGaugeIndicator(
        shape: PointerShape.circle,
      ),
      this.value = 0})
      : super(key: key);

  ///
  /// `start` Sets the starting label of the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   start : 0.0
  /// ),
  /// ```
  final double? start;

  ///
  /// `end` Sets the ending label of the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   end : 0.0
  /// ),
  /// ```
  ///
  final double? end;

  ///
  /// `steps` Sets the interval between label of the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   steps : 5.5
  /// ),
  /// ```
  ///
  final double? steps;

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
  /// `labelStyle` sets the styles of label using [LabelStyle]  properties
  ///
  final LabelStyle? labelStyle;

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

  @override
  RenderLinearGauge createRenderObject(BuildContext context) {
    return RenderLinearGauge(
        start: start!,
        end: end!,
        steps: steps!,
        showLinearGaugeContainer: showLinearGaugeContainer!,
        gaugeOrientation: gaugeOrientation!,
        primaryRulersWidth: primaryRulersWidth!,
        primaryRulersHeight: primaryRulersHeight!,
        secondaryRulersHeight: secondaryRulersHeight!,
        secondaryRulersWidth: secondaryRulersWidth!,
        labelTopMargin: labelTopMargin!,
        primaryRulerColor: primaryRulerColor!,
        secondaryRulerColor: secondaryRulerColor!,
        linearGaugeBoxDecoration: linearGaugeBoxDecoration!,
        secondaryRulerPerInterval: secondaryRulerPerInterval!,
        linearGaugeContainerBgColor: linearGaugeBoxDecoration!.backgroundColor,
        linearGaugeContainerValueColor:
            linearGaugeBoxDecoration!.linearGaugeValueColor!,
        textStyle: labelStyle!.textStyle!,
        showLabel: labelStyle!.showLabel!,
        rulerPosition: labelStyle!.rulerPosition!,
        labelOffset: labelStyle!.labelOffset!,
        showSecondaryRulers: showSecondaryRulers,
        showPrimaryRulers: showPrimaryRulers,
        indicator: indicator!,
        value: value!);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLinearGauge renderObject) {
    renderObject
      ..setEnd = end!
      ..setGaugeOrientation = gaugeOrientation!
      ..setLabelTopMargin = labelTopMargin!
      ..setPrimaryRulerColor = primaryRulerColor!
      ..setPrimaryRulersHeight = primaryRulersHeight!
      ..setPrimaryRulersWidth = primaryRulersWidth!
      ..setSecondaryRulerColor = secondaryRulerColor!
      ..setSecondaryRulersHeight = secondaryRulersHeight!
      ..setSecondaryRulersWidth = secondaryRulersWidth!
      ..setShowLinearGaugeContainer = showLinearGaugeContainer!
      ..setStart = start!
      ..setSteps = steps!
      ..setTextStyle = labelStyle!.textStyle!
      ..setSecondaryRulerPerInterval = secondaryRulerPerInterval!
      ..setLinearGaugeContainerBgColor =
          linearGaugeBoxDecoration!.backgroundColor
      ..setLinearGaugeContainerValueColor =
          linearGaugeBoxDecoration!.linearGaugeValueColor!
      ..setShowLabel = labelStyle!.showLabel!
      ..setRulerPosition = labelStyle!.rulerPosition!
      ..setLabelOffset = labelStyle!.labelOffset!
      ..setShowSecondaryRulers = showSecondaryRulers
      ..setShowPrimaryRulers = showPrimaryRulers
      ..setValue = value!
      ..setLinearGaugeIndicator = indicator;
  }
}
