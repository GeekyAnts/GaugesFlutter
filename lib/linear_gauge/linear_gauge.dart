import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:geekyants_flutter_gauges/linear_gauge/value_bar/value_bar.dart';
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
  LinearGauge({
    Key? key,
    this.start = 0,
    this.end = 100,
    this.steps = 0,
    @Deprecated('Use ValueBar instead') this.value = 0,
    this.gaugeOrientation = GaugeOrientation.horizontal,
    this.showLinearGaugeContainer = true,
    this.linearGaugeBoxDecoration = const LinearGaugeBoxDecoration(),
    this.labelTopMargin = 0.0,
    this.pointer = const Pointer(),
    required this.rulers,
    this.rangeLinearGauge = const [],
    this.customLabels = const [],
    this.valueBarPosition = ValueBarPosition.center,
    this.valueBar = const [],
    this.pointers = const [],
  })  : assert(() {
          if (rulers != null) {
            if (gaugeOrientation == GaugeOrientation.horizontal) {
              if (rulers.rulerPosition == RulerPosition.bottom ||
                  rulers.rulerPosition == RulerPosition.center ||
                  rulers.rulerPosition == RulerPosition.top) {
                return true;
              } else {
                assert(false,
                    "Invalid ruler position. Rulers must be horizontal, positioned at top, bottom, or center.");
              }
            } else {
              if (rulers.rulerPosition == RulerPosition.right ||
                  rulers.rulerPosition == RulerPosition.center ||
                  rulers.rulerPosition == RulerPosition.left) {
                return true;
              } else {
                assert(false,
                    "Invalid ruler position. Rulers must be vertical, positioned at left, right, or center.");
              }
            }
          }
          return true;
        }()),
        super(key: key);

  ///
  /// `start` Sets the starting label of the [LinearGauge] Container
  /// This will be overridden when users add [CustomRulerLabel],
  /// the first value from the list will be used as start
  ///
  /// ```dart
  /// const LinearGauge(
  ///   start : 0.0
  /// ),
  /// ```
  final double? start;

  ///
  /// `end` Sets the ending label of the [LinearGauge] Container
  /// This will be overridden when users add [CustomRulerLabel]
  /// the last value from the list will be used as end
  ///
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
  /// `pointer` sets the styles of pointer using [Pointer]  properties
  ///
  /// Example
  /// ```dart
  /// const LinearGauge(
  ///            pointer: Pointer(
  ///             color: Colors.green,
  ///            width: 10.0,
  ///           shape: PointerShape.circle,
  ///           height: 10.0,
  ///           ),
  /// ```
  ///
  final Pointer? pointer;

  ///
  /// `customLabels` allows for the creation of custom tick labels on the gauge's scale,
  ///  enabling the display of non-standard values or units, and allowing for more specific
  ///  labelling of the gauge's range
  ///
  /// Note : `start and end of the [LinearGauge] will be overridden by first & last value of customLabels`
  ///
  /// Example
  /// ```dart
  /// child: const LinearGauge(
  ///   customLabels:[
  ///     CustomRulerLabel(text: "1%", value: 10),
  ///     CustomRulerLabel(text: "2%", value:20),
  ///     CustomRulerLabel(text: "2.5%", value: 25),
  ///     CustomRulerLabel(text: "3%", value: 30),
  /// ]
  /// ),
  /// ```
  ///
  ///
  final List<CustomRulerLabel>? customLabels;

  ///
  /// `rangeLinearGauge` takes the list of [RangeLinearGauge] to render the ranges in [LinearGauge]
  ///
  /// ```
  /// const LinearGauge(
  /// rangeLinearGauge: [
  ///   RangeLinearGauge(
  ///     start: 0.0,
  ///     end: 50.0,
  ///     color: Colors.green,
  ///     ),
  ///   RangeLinearGauge(
  ///     start: 50.0,
  ///     end: 100.0,
  ///     color: Colors.red,
  ///     ),
  ///   ],
  /// ),
  /// ```

  final List<RangeLinearGauge>? rangeLinearGauge;

  ///
  /// `valueBarPosition` sets the position of the value bar from the [LinearGauge]
  ///  default is to `valueBarPosition =`ValueBarPosition.center`
  ///
  /// ```
  /// const LinearGauge(
  ///   valueBarPosition: ValueBarPosition.center,
  /// ),
  /// ```
  final ValueBarPosition? valueBarPosition;

  ///
  /// `valueBar` takes the list of [ValueBar] to render the value bar/s
  ///
  /// ```
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///    value: 25,
  ///   color: Colors.green,
  ///  ),
  /// ],
  /// ```
  ///
  final List<ValueBar>? valueBar;

  ///
  /// `pointers` takes the list of [pointer] to render the value pointer/s
  ///
  /// ```
  /// const LinearGauge(
  ///  pointer: [
  ///   pointer(
  ///    shape: PointerShape.circle,
  ///   color: Colors.green,
  ///  ),
  /// ],
  /// ```
  ///
  final List<Pointer>? pointers;

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
      pointer: pointer!,
      value: value!,
      rangeLinearGauge: rangeLinearGauge!,
      customLabels: customLabels!,
      rulersOffset: rulers!.rulersOffset!,
      valueBarPosition: valueBarPosition!,
      valueBar: valueBar!,
      inversedRulers: rulers!.inverseRulers!,
      pointers: pointers!,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLinearGauge renderObject) {
    renderObject
      ..setCustomLabels = customLabels!
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
      ..setEnd = end!
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
      ..setPointer = pointer
      ..setRangeLinearGauge = rangeLinearGauge
      ..setRulersOffset = rulers!.rulersOffset!
      ..setValueBarPosition = valueBarPosition!
      ..setValueBar = valueBar!
      ..setInversedRulers = rulers!.inverseRulers!
      ..setPointers = pointers!;
  }
}
