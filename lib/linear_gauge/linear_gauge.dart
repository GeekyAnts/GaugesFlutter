import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'linear_gauge_painter.dart';
import './range_linear_gauge/range_linear_gauge.dart';

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
    this.rulers = const RulerStyle(),
    this.rangeLinearGauge,
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
  /// `rulerStyle` sets the styles of label using [RulerStyle]  properties
  ///
  final RulerStyle? rulers;

  ///
  ///
  final List<RangeLinearGauge>? rangeLinearGauge;
  @override
  RenderLinearGauge createRenderObject(BuildContext context) {
    return RenderLinearGauge(
      start: start!,
      end: end!,
      steps: steps!,
      showLinearGaugeContainer: rulers!.showLinearGaugeContainer!,
      gaugeOrientation: rulers!.gaugeOrientation!,
      primaryRulersWidth: rulers!.primaryRulersWidth!,
      primaryRulersHeight: rulers!.primaryRulersHeight!,
      secondaryRulersHeight: rulers!.secondaryRulersHeight!,
      secondaryRulersWidth: rulers!.secondaryRulersWidth!,
      labelTopMargin: rulers!.labelTopMargin!,
      primaryRulerColor: rulers!.primaryRulerColor!,
      secondaryRulerColor: rulers!.secondaryRulerColor!,
      linearGaugeBoxDecoration: rulers!.linearGaugeBoxDecoration!,
      secondaryRulerPerInterval: rulers!.secondaryRulerPerInterval!,
      linearGaugeContainerBgColor:
          rulers!.linearGaugeBoxDecoration!.backgroundColor,
      linearGaugeContainerValueColor:
          rulers!.linearGaugeBoxDecoration!.linearGaugeValueColor!,
      textStyle: rulers!.textStyle!,
      showLabel: rulers!.showLabel!,
      rulerPosition: rulers!.rulerPosition!,
      labelOffset: rulers!.labelOffset!,
      showSecondaryRulers: rulers!.showSecondaryRulers,
      showPrimaryRulers: rulers!.showPrimaryRulers,
      indicator: rulers!.indicator!,
      value: rulers!.value!,
      rangeLinearGauge: rangeLinearGauge!,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLinearGauge renderObject) {
    renderObject
      ..setEnd = end!
      ..setGaugeOrientation = rulers!.gaugeOrientation!
      ..setLabelTopMargin = rulers!.labelTopMargin!
      ..setPrimaryRulerColor = rulers!.primaryRulerColor!
      ..setPrimaryRulersHeight = rulers!.primaryRulersHeight!
      ..setPrimaryRulersWidth = rulers!.primaryRulersWidth!
      ..setSecondaryRulerColor = rulers!.secondaryRulerColor!
      ..setSecondaryRulersHeight = rulers!.secondaryRulersHeight!
      ..setSecondaryRulersWidth = rulers!.secondaryRulersWidth!
      ..setShowLinearGaugeContainer = rulers!.showLinearGaugeContainer!
      ..setStart = start!
      ..setSteps = steps!
      ..setTextStyle = rulers!.textStyle!
      ..setSecondaryRulerPerInterval = rulers!.secondaryRulerPerInterval!
      ..setLinearGaugeContainerBgColor =
          rulers!.linearGaugeBoxDecoration!.backgroundColor
      ..setLinearGaugeContainerValueColor =
          rulers!.linearGaugeBoxDecoration!.linearGaugeValueColor!
      ..setShowLabel = rulers!.showLabel!
      ..setRulerPosition = rulers!.rulerPosition!
      ..setLabelOffset = rulers!.labelOffset!
      ..setShowSecondaryRulers = rulers!.showSecondaryRulers
      ..setShowPrimaryRulers = rulers!.showPrimaryRulers
      ..setValue = rulers!.value!
      ..setLinearGaugeIndicator = rulers!.indicator
      ..setRangeLinearGauge = rangeLinearGauge;
  }
}
