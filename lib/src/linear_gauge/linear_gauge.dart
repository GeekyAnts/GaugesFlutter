import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'linear_gauge_painter.dart';

/// Creates a LinearGauge Widget to display the values in a linear scale. The
/// widget can be customized using the properties available in [LinearGauge].
///
/// ``` dart
/// LinearGauge(
///   steps: 2,
///   start: 0,
///   end: 100,
///   rulers: RulerStyle(
///           rulerPosition : RulerPosition.bottom,
///       ),
///  ),
/// ```
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
    this.enableGaugeAnimation = false,
    this.extendLinearGauge = 0,
    this.fillExtend = false,
    this.animationGap = 0,
    this.animationDuration = 1000,
    this.animationType = Curves.ease,
    this.curves = const [],
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
  /// `curves` takes the list of [CustomCurve] to render the curves in [LinearGauge]
  ///
  /// ```
  /// LinearGauge(
  ///   curves: [
  ///     CustomCurve(
  ///       midPoint: 50,
  ///       midHeight: 100,
  ///     )
  ///   ],
  ///   rulers: const RulerStyle(
  ///     rulerPosition: RulerPosition.bottom,
  ///   ),
  /// ),
  /// ```
  final List<CustomCurve>? curves;

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
  /// @deprecated Value replaced by [valueBar] property
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
  /// `pointers` takes the list of [Pointer] to render the value pointer/s
  ///
  /// ```
  /// const LinearGauge(
  ///  pointers: [
  ///   Pointer(
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
  ///   enableGaugeAnimation:true;
  /// )
  /// ```
  ///
  final bool enableGaugeAnimation;

  /// Specifies the load time animation duration with [enableAnimation].
  /// Duration is defined in milliseconds.
  ///
  /// Defaults to 1000.
  ///
  /// ```dart
  ///
  /// LinearGauge (
  /// enableGaugeAnimation: true,
  /// animationDuration: 4000
  ///  )
  /// ```
  ///
  final int animationDuration;

  /// Specifies the animation type of pointers.
  ///
  /// Defaults to [Curves.ease].
  ///
  /// ```dart
  ///
  /// LinearGauge (
  /// enableGaugeAnimation: true,
  /// animationType: Curves.linear
  ///  )
  /// ```
  ///
  final Curve animationType;

  ///
  /// `animationGap` sets the duration gap b/w the gauge animations and other pointer
  /// or value bar animations .
  ///
  /// It value can be b/w 0 to 1.
  ///
  ///  It's default to 0.
  ///
  /// ```
  /// const LinearGauge(
  ///   animationGap:0.5;
  /// )
  /// ```
  ///
  final double animationGap;

  ///
  /// `fillExtend` Sets the fill of extendedLinearGauge
  ///  according to nearest range or value bar color.
  ///  It's default to false.
  ///
  /// ```
  /// const LinearGauge(
  ///   extendLinearGauge:10,
  ///   fillExtend:true;
  /// )
  /// ```
  ///
  final bool fillExtend;

  @override
  State<LinearGauge> createState() => _LinearGauge();
}

class _LinearGauge extends State<LinearGauge> with TickerProviderStateMixin {
  AnimationController? _gaugeAnimationController;
  Animation<double>? _gaugeAnimation;
  List<ValueBar>? _oldValueBarList;
  List<Pointer>? _oldPointerList;
  late List<Animation<double>> _pointerAnimations;
  late List<AnimationController> _pointerAnimationControllers;
  late List<Animation<double>> _valueBarAnimations;
  late List<AnimationController> _valueBarAnimationControllers;

  bool isPointerAndValuebarAnimationStarted = false;

  @override
  void initState() {
    super.initState();
    _updateOldValueList();
    _initializeAnimations();
  }

  @override
  void didUpdateWidget(covariant LinearGauge oldWidget) {
    if (oldWidget.enableGaugeAnimation != widget.enableGaugeAnimation ||
        !_isEqualLists(widget.valueBar, _oldValueBarList) ||
        !_isEqualLists(widget.pointers, _oldPointerList)) {
      isPointerAndValuebarAnimationStarted = false;

      _updateOldValueList();
      _initializeAnimations();
    }

    super.didUpdateWidget(oldWidget);
  }

  void _updateOldValueList() {
    _oldValueBarList = (widget.valueBar != null)
        ? List<ValueBar>.from(widget.valueBar!)
        : null;
    _oldPointerList =
        (widget.pointers != null) ? List<Pointer>.from(widget.pointers!) : null;
  }

  bool _isEqualLists(List<dynamic>? oldList, List<dynamic>? newList) {
    if (oldList == null) {
      return newList == null;
    }

    if (newList == null || oldList.length != newList.length) {
      return false;
    }

    for (int i = 0; i < oldList.length; i++) {
      if (oldList[i].enableAnimation != newList[i].enableAnimation ||
          oldList[i].animationDuration != newList[i].animationDuration ||
          oldList[i].animationType != newList[i].animationType) {
        return false;
      }
    }

    return true;
  }

  void _addPointerAnimation(int duration, Curve animationType) {
    final AnimationController pointerController = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));

    final Animation<double> animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: pointerController,
            curve: Interval(0, 1, curve: animationType)));

    _pointerAnimations.add(animation);
    _pointerAnimationControllers.add(pointerController);
  }

  void _addValueBarAnimation(int duration, Curve animationType) {
    final AnimationController valueBarController = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));

    final Animation<double> animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: valueBarController,
            curve: Interval(0, 1, curve: animationType)));

    _valueBarAnimations.add(animation);
    _valueBarAnimationControllers.add(valueBarController);
  }

  void _initializeAnimations() {
    if (widget.enableGaugeAnimation) {
      _initializeGaugeAnimations();
    } else {
      if (_gaugeAnimationController != null) {
        _gaugeAnimationController!.removeListener(_gaugeAnimationListener);
        _gaugeAnimationController = null;
      }

      _gaugeAnimation = null;
    }
    _initializePointerAnimations();
    _initializeValueBarAnimations();
    _animateElements();
  }

  void _gaugeAnimationListener() {
    if (!isPointerAndValuebarAnimationStarted &&
        _gaugeAnimationController!.value >= widget.animationGap) {
      isPointerAndValuebarAnimationStarted = true;
      _animatePointers();
    }
  }

  /// Animates the gauge elements.
  void _animateElements() {
    if (widget.enableGaugeAnimation) {
      _gaugeAnimationController!.forward(from: 0);
    } else {
      _animatePointers();
    }
  }

  void _animatePointers() {
    if (_pointerAnimationControllers.isNotEmpty) {
      for (int i = 0; i < _pointerAnimationControllers.length; i++) {
        _pointerAnimationControllers[i].forward(from: 0);
      }
    }
    if (_valueBarAnimationControllers.isNotEmpty) {
      for (int i = 0; i < _valueBarAnimationControllers.length; i++) {
        _valueBarAnimationControllers[i].forward(from: 0);
      }
    }
  }

  void _initializeGaugeAnimations() {
    _gaugeAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.animationDuration));
    _gaugeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _gaugeAnimationController!,
        curve: Interval(0.05, 1.0, curve: widget.animationType)));

    _gaugeAnimationController!.addListener(_gaugeAnimationListener);
  }

  void _initializePointerAnimations() {
    _pointerAnimationControllers = <AnimationController>[];
    _pointerAnimations = <Animation<double>>[];
    _pointerAnimationControllers.clear();

    if (widget.pointers != null && widget.pointers!.isNotEmpty) {
      for (final Pointer pointer in widget.pointers!) {
        if (!pointer.enableAnimation) {
          _addPointerAnimation(0, Curves.ease);
        } else if (pointer.animationDuration > 0) {
          _addPointerAnimation(
              pointer.animationDuration, pointer.animationType);
        }
      }
    }
  }

  void _initializeValueBarAnimations() {
    _valueBarAnimationControllers = <AnimationController>[];
    _valueBarAnimations = <Animation<double>>[];
    _valueBarAnimationControllers.clear();

    if (widget.valueBar != null && widget.valueBar!.isNotEmpty) {
      for (final ValueBar valueBar in widget.valueBar!) {
        if (!valueBar.enableAnimation) {
          _addValueBarAnimation(0, Curves.ease);
        } else if (valueBar.animationDuration > 0) {
          _addValueBarAnimation(
              valueBar.animationDuration, valueBar.animationType);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _RLinearGauge(
      lGauge: widget,
      gaugeAnimation: _gaugeAnimation,
      pointerAnimation: _pointerAnimations,
      valueBarAnimation: _valueBarAnimations,
    );
  }

  void _disposeAnimationControllers() {
    if (_gaugeAnimationController != null) {
      _gaugeAnimationController!.removeListener(_gaugeAnimationListener);
      _gaugeAnimationController!.dispose();
    }

    if (_pointerAnimationControllers.isNotEmpty) {
      for (final AnimationController controller
          in _pointerAnimationControllers) {
        controller.dispose();
      }
    }
    if (_valueBarAnimationControllers.isNotEmpty) {
      for (final AnimationController controller
          in _valueBarAnimationControllers) {
        controller.dispose();
      }
    }
  }

  @override
  void dispose() {
    _disposeAnimationControllers();
    super.dispose();
  }
}

class _RLinearGauge extends LeafRenderObjectWidget {
  final LinearGauge lGauge;
  final Animation<double>? gaugeAnimation;
  final List<Animation<double>>? pointerAnimation;
  final List<Animation<double>>? valueBarAnimation;

  const _RLinearGauge(
      {required this.lGauge,
      this.gaugeAnimation,
      this.pointerAnimation,
      this.valueBarAnimation});

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
      gaugeAnimation: gaugeAnimation,
      thickness: lGauge.linearGaugeBoxDecoration!.thickness!,
      extendLinearGauge: lGauge.extendLinearGauge!,
      fillExtend: lGauge.fillExtend,
      pointerAnimation: pointerAnimation!,
      valueBarAnimation: valueBarAnimation!,
      customCurve: lGauge.curves,
    );
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
      // ..setValueBarPosition = lGauge.valueBarPosition!
      ..setValueBar = lGauge.valueBar!
      ..setInversedRulers = lGauge.rulers!.inverseRulers!
      ..setPointers = lGauge.pointers!
      ..setGaugeAnimation = gaugeAnimation
      ..setThickness = lGauge.linearGaugeBoxDecoration!.thickness!
      ..setExtendLinearGauge = lGauge.extendLinearGauge!
      ..setLinearGaugeBoxDecoration = lGauge.linearGaugeBoxDecoration
      ..setFillExtend = lGauge.fillExtend
      ..setPointerAnimation = pointerAnimation!
      ..setValueBarAnimation = valueBarAnimation!
      ..setCurves = lGauge.curves;
  }
}
