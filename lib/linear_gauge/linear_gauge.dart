import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:geekyants_flutter_gauges/linear_gauge/custom_label/custom_linear_gauge_label.dart';
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
  const LinearGauge({
    Key? key,
    this.start = 0,
    this.end = 100,
    this.steps = 0,
    this.value = 0,
    this.gaugeOrientation = GaugeOrientation.horizontal,
    this.showLinearGaugeContainer = true,
    this.linearGaugeBoxDecoration = const LinearGaugeBoxDecoration(),
    this.labelTopMargin = 0.0,
    this.indicator = const LinearGaugeIndicator(),
    this.rulers = const RulerStyle(),
    this.rangeLinearGauge = const [],
    this.customLabels = const CustomLinearGaugeLabel(),
  }) : super(key: key);

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
  /// `rulerStyle` sets the styles of label using [RulerStyle]  properties
  ///
  final RulerStyle? rulers;

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
  /// `customLabels` customizes the label [CustomLinearGaugeLabel]  properties
  ///
  final CustomLinearGaugeLabel? customLabels;

  ///
  ///
  final List<RangeLinearGauge>? rangeLinearGauge;
  @override
  RenderLinearGauge createRenderObject(BuildContext context) {
    return RenderLinearGauge(
      start: start!,
      end: end!,
      steps: steps!,
      showLinearGaugeContainer: showLinearGaugeContainer!,
      gaugeOrientation: gaugeOrientation!,
      primaryRulersWidth: rulers!.primaryRulersWidth!,
      primaryRulersHeight: rulers!.primaryRulersHeight!,
      secondaryRulersHeight: rulers!.secondaryRulersHeight!,
      secondaryRulersWidth: rulers!.secondaryRulersWidth!,
      labelTopMargin: labelTopMargin!,
      primaryRulerColor: rulers!.primaryRulerColor!,
      secondaryRulerColor: rulers!.secondaryRulerColor!,
      linearGaugeBoxDecoration: linearGaugeBoxDecoration!,
      secondaryRulerPerInterval: rulers!.secondaryRulerPerInterval!,
      linearGaugeContainerBgColor: linearGaugeBoxDecoration!.backgroundColor,
      linearGaugeContainerValueColor:
          linearGaugeBoxDecoration!.linearGaugeValueColor!,
      textStyle: rulers!.textStyle!,
      showLabel: rulers!.showLabel!,
      rulerPosition: rulers!.rulerPosition!,
      labelOffset: rulers!.labelOffset!,
      showSecondaryRulers: rulers!.showSecondaryRulers,
      showPrimaryRulers: rulers!.showPrimaryRulers,
      indicator: indicator!,
      value: value!,
      rangeLinearGauge: rangeLinearGauge!,
      // labelSymbol: customLabels!.labelSymbol!
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLinearGauge renderObject) {
    renderObject
      ..setEnd = end!
      ..setGaugeOrientation = gaugeOrientation!
      ..setLabelTopMargin = labelTopMargin!
      ..setPrimaryRulerColor = rulers!.primaryRulerColor!
      ..setPrimaryRulersHeight = rulers!.primaryRulersHeight!
      ..setPrimaryRulersWidth = rulers!.primaryRulersWidth!
      ..setSecondaryRulerColor = rulers!.secondaryRulerColor!
      ..setSecondaryRulersHeight = rulers!.secondaryRulersHeight!
      ..setSecondaryRulersWidth = rulers!.secondaryRulersWidth!
      ..setShowLinearGaugeContainer = showLinearGaugeContainer!
      ..setStart = start!
      ..setSteps = steps!
      ..setTextStyle = rulers!.textStyle!
      ..setSecondaryRulerPerInterval = rulers!.secondaryRulerPerInterval!
      ..setLinearGaugeContainerBgColor =
          linearGaugeBoxDecoration!.backgroundColor
      ..setLinearGaugeContainerValueColor =
          linearGaugeBoxDecoration!.linearGaugeValueColor!
      ..setShowLabel = rulers!.showLabel!
      ..setRulerPosition = rulers!.rulerPosition!
      ..setLabelOffset = rulers!.labelOffset!
      ..setShowSecondaryRulers = rulers!.showSecondaryRulers
      ..setShowPrimaryRulers = rulers!.showPrimaryRulers
      ..setValue = value!
      ..setLinearGaugeIndicator = indicator
      ..setRangeLinearGauge = rangeLinearGauge;
    // ..setLabelSymbol = customLabels!.labelSymbol;
  }
}
