import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'linear_gauge_painter.dart';

class LinearGauge extends StatefulWidget {
  ///
  /// [LinearGauge] is a visualization of measurement widget with a linear scale
  /// values.
  /// LinearGauge as rich sets of config parameters which can be modified as per requirement
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
    required this.rulers,
    this.rangeLinearGauge = const [],
    this.customLabels = const [],
    this.valueBarPosition = ValueBarPosition.center,
    this.valueBar = const [],
    this.pointers = const [],
    this.enableAnimation = false,
    this.extendLinearGauge = 0,
  })  : assert(() {
          if (customLabels!.isNotEmpty) {
            assert(customLabels.length >= 2,
                "At least two CustomRulerLabel should be added");

            assert((customLabels.first.value! < customLabels.last.value!),
                "Start should be less then end");
          }
          if (rulers != null) {
            if (gaugeOrientation == GaugeOrientation.horizontal) {
              if (rulers.rulerPosition == RulerPosition.bottom ||
                  rulers.rulerPosition == RulerPosition.center ||
                  rulers.rulerPosition == RulerPosition.top) {
                return true;
              } else {
                assert(
                    false,
                    'Invalid ruler position. Rulers must be horizontal,'
                    'positioned at top, bottom, or center.');
              }
            } else {
              if (rulers.rulerPosition == RulerPosition.right ||
                  rulers.rulerPosition == RulerPosition.center ||
                  rulers.rulerPosition == RulerPosition.left) {
                return true;
              } else {
                assert(
                    false,
                    'Invalid ruler position. Rulers must be vertical,'
                    'positioned at left, right, or center.');
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
  /// `extendLinearGauge` Sets the rulers & labels away from the ending points of [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   extendLinearGauge : 10
  /// ),
  /// ```
  ///
  final double? extendLinearGauge;

  ///
  ///
  /// `linearGaugeBoxDecoration` sets the styles of Container using
  /// [LinearGaugeBoxDecoration] decoration properties
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
  /// `linearGaugeBoxDecoration` sets the styles of Container using
  /// [LinearGaugeBoxDecoration] decoration properties
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

  ///
  /// `enableAnimation` will enable animations for pointers and value bars.
  ///  It's default to false.
  ///
  /// ```
  /// const LinearGauge(
  ///   enableAnimations:true;
  /// )
  /// ```
  ///
  final bool enableAnimation;

  @override
  State<LinearGauge> createState() => _LinearGauge();
}

class _LinearGauge extends State<LinearGauge> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease)
      ..addStatusListener((status) {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return widget.enableAnimation
        ? AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return _RLinearGauge(
                lGauge: widget,
                animationValue: _animation.value,
              );
            },
          )
        : _RLinearGauge(
            lGauge: widget,
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _RLinearGauge extends LeafRenderObjectWidget {
  final LinearGauge lGauge;
  final double? animationValue;

  const _RLinearGauge({required this.lGauge, super.key, this.animationValue});

  @override
  RenderLinearGauge createRenderObject(BuildContext context) {
    return RenderLinearGauge(
        start: lGauge.start!,
        end: lGauge.end!,
        steps: lGauge.steps!,
        showLinearGaugeContainer: lGauge.showLinearGaugeContainer!,
        gaugeOrientation: lGauge.gaugeOrientation!,
        primaryRulersWidth: lGauge.rulers!.primaryRulersWidth!,
        primaryRulersHeight: lGauge.rulers!.primaryRulersHeight!,
        secondaryRulersHeight: lGauge.rulers!.secondaryRulersHeight!,
        secondaryRulersWidth: lGauge.rulers!.secondaryRulersWidth!,
        labelTopMargin: lGauge.labelTopMargin!,
        primaryRulerColor: lGauge.rulers!.primaryRulerColor!,
        secondaryRulerColor: lGauge.rulers!.secondaryRulerColor!,
        linearGaugeBoxDecoration: lGauge.linearGaugeBoxDecoration!,
        secondaryRulerPerInterval: lGauge.rulers!.secondaryRulerPerInterval!,
        linearGaugeContainerBgColor:
            lGauge.linearGaugeBoxDecoration!.backgroundColor,
        linearGaugeContainerValueColor:
            lGauge.linearGaugeBoxDecoration!.linearGaugeValueColor!,
        textStyle: lGauge.rulers!.textStyle!,
        showLabel: lGauge.rulers!.showLabel!,
        rulerPosition: lGauge.rulers!.rulerPosition!,
        labelOffset: lGauge.rulers!.labelOffset!,
        showSecondaryRulers: lGauge.rulers!.showSecondaryRulers,
        showPrimaryRulers: lGauge.rulers!.showPrimaryRulers,
        value: lGauge.value!,
        rangeLinearGauge: lGauge.rangeLinearGauge!,
        customLabels: lGauge.customLabels!,
        rulersOffset: lGauge.rulers!.rulersOffset!,
        valueBarPosition: lGauge.valueBarPosition!,
        valueBar: lGauge.valueBar!,
        inversedRulers: lGauge.rulers!.inverseRulers!,
        pointers: lGauge.pointers!,
        animationValue: animationValue,
        thickness: lGauge.linearGaugeBoxDecoration!.thickness!,
        extendLinearGauge: lGauge.extendLinearGauge!);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLinearGauge renderObject) {
    renderObject
      ..setCustomLabels = lGauge.customLabels!
      ..setGaugeOrientation = lGauge.gaugeOrientation!
      ..setLabelTopMargin = lGauge.labelTopMargin!
      ..setPrimaryRulerColor = lGauge.rulers!.primaryRulerColor!
      ..setPrimaryRulersHeight = lGauge.rulers!.primaryRulersHeight!
      ..setPrimaryRulersWidth = lGauge.rulers!.primaryRulersWidth!
      ..setSecondaryRulerColor = lGauge.rulers!.secondaryRulerColor!
      ..setSecondaryRulersHeight = lGauge.rulers!.secondaryRulersHeight!
      ..setSecondaryRulersWidth = lGauge.rulers!.secondaryRulersWidth!
      ..setShowLinearGaugeContainer = lGauge.showLinearGaugeContainer!
      ..setStart = lGauge.start!
      ..setEnd = lGauge.end!
      ..setSteps = lGauge.steps!
      ..setTextStyle = lGauge.rulers!.textStyle!
      ..setSecondaryRulerPerInterval = lGauge.rulers!.secondaryRulerPerInterval!
      ..setLinearGaugeContainerBgColor =
          lGauge.linearGaugeBoxDecoration!.backgroundColor
      ..setLinearGaugeContainerValueColor =
          lGauge.linearGaugeBoxDecoration!.linearGaugeValueColor!
      ..setShowLabel = lGauge.rulers!.showLabel!
      ..setRulerPosition = lGauge.rulers!.rulerPosition!
      ..setLabelOffset = lGauge.rulers!.labelOffset!
      ..setShowSecondaryRulers = lGauge.rulers!.showSecondaryRulers
      ..setShowPrimaryRulers = lGauge.rulers!.showPrimaryRulers
      ..setValue = lGauge.value!
      ..setRangeLinearGauge = lGauge.rangeLinearGauge
      ..setRulersOffset = lGauge.rulers!.rulersOffset!
      ..setValueBarPosition = lGauge.valueBarPosition!
      ..setValueBar = lGauge.valueBar!
      ..setInversedRulers = lGauge.rulers!.inverseRulers!
      ..setPointers = lGauge.pointers!
      ..setAnimationValue = animationValue
      ..setThickness = lGauge.linearGaugeBoxDecoration!.thickness!
      ..setExtendLinearGauge = lGauge.extendLinearGauge!
      ..setLinearGaugeBoxDecoration = lGauge.linearGaugeBoxDecoration;
  }
}
