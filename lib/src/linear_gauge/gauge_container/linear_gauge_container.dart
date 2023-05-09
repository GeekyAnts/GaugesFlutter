import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'dart:math' as math;
import '../linear_gauge_label.dart';

class LinearGaugeContainer extends LeafRenderObjectWidget {
  const LinearGaugeContainer({
    Key? key,
    required this.linearGauge,
    this.gaugeAnimation,
  }) : super(key: key);

  final LinearGauge linearGauge;
  final Animation<double>? gaugeAnimation;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderLinearGaugeContainer(
        start: linearGauge.start!,
        end: linearGauge.end!,
        value: linearGauge.value!,
        steps: linearGauge.steps!,
        gaugeOrientation: linearGauge.gaugeOrientation!,
        gaugeAnimation: gaugeAnimation,
        showLinearGaugeContainer: linearGauge.showLinearGaugeContainer!,
        primaryRulersWidth: linearGauge.rulers!.primaryRulersWidth!,
        primaryRulersHeight: linearGauge.rulers!.primaryRulersHeight!,
        secondaryRulersWidth: linearGauge.rulers!.secondaryRulersWidth!,
        secondaryRulersHeight: linearGauge.rulers!.secondaryRulersHeight!,
        primaryRulerColor: linearGauge.rulers!.primaryRulerColor!,
        secondaryRulerColor: linearGauge.rulers!.secondaryRulerColor!,
        linearGaugeContainerBgColor:
            linearGauge.linearGaugeBoxDecoration!.backgroundColor,
        thickness: linearGauge.linearGaugeBoxDecoration!.thickness!,
        borderRadius: linearGauge.linearGaugeBoxDecoration!.borderRadius ?? 0.0,
        edgeStyle: linearGauge.linearGaugeBoxDecoration!.edgeStyle!,
        labelOffset: linearGauge.rulers!.labelOffset!,
        rulersOffset: linearGauge.rulers!.rulersOffset!,
        rulerPosition: linearGauge.rulers!.rulerPosition!,
        showLabel: linearGauge.rulers!.showLabel!,
        showPrimaryRulers: linearGauge.rulers!.showPrimaryRulers,
        showSecondaryRulers: linearGauge.rulers!.showSecondaryRulers,
        extendLinearGauge: linearGauge.extendLinearGauge!,
        inversedRulers: linearGauge.rulers!.inverseRulers!,
        pointers: linearGauge.pointers!,
        rangeLinearGauge: linearGauge.rangeLinearGauge!,
        customLabel: linearGauge.customLabels!,
        secondaryRulerPerInterval:
            linearGauge.rulers!.secondaryRulerPerInterval!,
        fillExtend: linearGauge.fillExtend,
        textStyle: linearGauge.rulers!.textStyle!);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLinearGaugeContainer renderObject) {
    renderObject
      ..setStart = linearGauge.start!
      ..setEnd = linearGauge.end!
      ..setValue = linearGauge.value!
      ..setSteps = linearGauge.steps!
      ..setGaugeOrientation = linearGauge.gaugeOrientation!
      ..setGaugeAnimation = gaugeAnimation
      ..setShowLinearGaugeContainer = linearGauge.showLinearGaugeContainer!
      ..setPrimaryRulersWidth = linearGauge.rulers!.primaryRulersWidth!
      ..setPrimaryRulersHeight = linearGauge.rulers!.primaryRulersHeight!
      ..setSecondaryRulersWidth = linearGauge.rulers!.secondaryRulersWidth!
      ..setSecondaryRulersHeight = linearGauge.rulers!.secondaryRulersHeight!
      ..setPrimaryRulerColor = linearGauge.rulers!.primaryRulerColor!
      ..setSecondaryRulerColor = linearGauge.rulers!.secondaryRulerColor!
      ..setLinearGaugeContainerBgColor =
          linearGauge.linearGaugeBoxDecoration!.backgroundColor
      ..setThickness = linearGauge.linearGaugeBoxDecoration!.thickness!
      ..setBorderRadius =
          linearGauge.linearGaugeBoxDecoration!.borderRadius ?? 0
      ..setEdgeStyle = linearGauge.linearGaugeBoxDecoration!.edgeStyle!
      ..setLabelOffset = linearGauge.rulers!.labelOffset!
      ..setRulersOffset = linearGauge.rulers!.rulersOffset!
      ..setRulerPosition = linearGauge.rulers!.rulerPosition!
      ..setShowLabel = linearGauge.rulers!.showLabel!
      ..setShowPrimaryRulers = linearGauge.rulers!.showPrimaryRulers
      ..setShowSecondaryRulers = linearGauge.rulers!.showSecondaryRulers
      ..setExtendLinearGauge = linearGauge.extendLinearGauge!
      ..setInversedRulers = linearGauge.rulers!.inverseRulers!
      ..setPointers = linearGauge.pointers!
      ..setRangeLinearGauge = linearGauge.rangeLinearGauge!
      ..setCustomLabels = linearGauge.customLabels!
      ..setSecondaryRulerPerInterval =
          linearGauge.rulers!.secondaryRulerPerInterval!
      ..setTextStyle = linearGauge.rulers!.textStyle!;
  }
}

class RenderLinearGaugeContainer extends RenderBox {
  RenderLinearGaugeContainer({
    required double start,
    required double end,
    required double steps,
    required double value,
    required GaugeOrientation gaugeOrientation,
    required Animation<double>? gaugeAnimation,
    required bool showLinearGaugeContainer,
    required double primaryRulersWidth,
    required double primaryRulersHeight,
    required double secondaryRulersHeight,
    required double secondaryRulersWidth,
    required Color primaryRulerColor,
    required Color secondaryRulerColor,
    required double secondaryRulerPerInterval,
    required Color linearGaugeContainerBgColor,
    required bool showLabel,
    required RulerPosition rulerPosition,
    required double labelOffset,
    required bool showSecondaryRulers,
    required bool showPrimaryRulers,
    required double rulersOffset,
    required bool inversedRulers,
    required List<Pointer> pointers,
    required List<RangeLinearGauge> rangeLinearGauge,
    required bool fillExtend,
    required double thickness,
    required double borderRadius,
    required LinearEdgeStyle edgeStyle,
    required double extendLinearGauge,
    required List<CustomRulerLabel> customLabel,
    required TextStyle textStyle,
  })  : _start = start,
        _end = end,
        _value = value,
        _steps = steps,
        _gaugeOrientation = gaugeOrientation,
        _gaugeAnimation = gaugeAnimation,
        _showLinearGaugeContainer = showLinearGaugeContainer,
        _primaryRulersWidth = primaryRulersWidth,
        _primaryRulersHeight = primaryRulersHeight,
        _secondaryRulersWidth = secondaryRulersWidth,
        _secondaryRulersHeight = secondaryRulersHeight,
        _primaryRulerColor = primaryRulerColor,
        _secondaryRulerColor = secondaryRulerColor,
        _secondaryRulerPerInterval = secondaryRulerPerInterval,
        _linearGaugeContainerBgColor = linearGaugeContainerBgColor,
        _showLabel = showLabel,
        _rulerPosition = rulerPosition,
        _labelOffset = labelOffset,
        _showPrimaryRulers = showPrimaryRulers,
        _showSecondaryRulers = showSecondaryRulers,
        _rulersOffset = rulersOffset,
        _inversedRulers = inversedRulers,
        _thickness = thickness,
        _extendLinearGauge = extendLinearGauge,
        _rangeLinearGauge = rangeLinearGauge,
        _isHorizontalOrientation =
            gaugeOrientation == GaugeOrientation.horizontal,
        _customLabels = customLabel,
        _pointers = pointers,
        _borderRadius = borderRadius,
        _fillExtend = fillExtend,
        _edgeStyle = edgeStyle,
        _textStyle = textStyle;

  late bool _isHorizontalOrientation;
  late Size _axisActualSize;
  final Paint _linearGaugeContainerPaint = Paint();
  final Paint _linearGaugeRangePaint = Paint();
  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();
  late Size _startLabelSize, _endLabelSize;
  List<ShapePointer> filteredShapePointers = [];

  static late double gaugeStart, gaugeEnd;
  late double yAxisForGaugeContainer = 0,
      xAxisForGaugeContainer = 0,
      _effectiveRulerHeight;

  ///
  /// Getter and Setter for the [_start] parameter.
  ///
  double get getStart => _start;
  double _start;
  set setStart(double start) {
    if (_start == start) return;
    _start = start;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_end] parameter.
  ///
  get getEnd => _end;
  double _end;
  set setEnd(end) {
    if (_end == end) return;
    _end = end;
    markNeedsPaint();
  }

  double get getValue => _value;
  double _value;
  set setValue(double val) {
    if (_value == val) {
      return;
    }
    _value = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_steps] parameter.
  ///
  get getSteps => _steps;
  double _steps;
  set setSteps(steps) {
    if (_steps == steps) return;

    _steps = steps;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_gaugeAnimation] parameter.
  ///
  Animation<double>? get getGaugeAnimation => _gaugeAnimation;
  Animation<double>? _gaugeAnimation;
  set setGaugeAnimation(Animation<double>? gaugeAnimation) {
    if (_gaugeAnimation == gaugeAnimation) return;
    _gaugeAnimation = gaugeAnimation;
    _removeAnimationListeners();
    _addAnimationListener();
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_borderRadius] parameter.
  ///
  get getBorderRadius => _borderRadius;
  double _borderRadius;
  set setBorderRadius(double radius) {
    if (_borderRadius == radius) return;

    _borderRadius = radius;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_edgeStyle] parameter.
  ///
  get getEdgeStyle => _edgeStyle;
  LinearEdgeStyle _edgeStyle;
  set setEdgeStyle(radius) {
    if (_edgeStyle == radius) return;

    _edgeStyle = radius;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_showLinearGaugeContainer] parameter.
  ///
  get showLinearGaugeContainer => _showLinearGaugeContainer;
  bool _showLinearGaugeContainer;
  set setShowLinearGaugeContainer(showLinearGaugeContainer) {
    if (_showLinearGaugeContainer == showLinearGaugeContainer) return;

    _showLinearGaugeContainer = showLinearGaugeContainer;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_gaugeOrientation] parameter.
  ///
  get getGaugeOrientation => _gaugeOrientation;
  GaugeOrientation _gaugeOrientation;

  set setGaugeOrientation(gaugeOrientation) {
    _isHorizontalOrientation = gaugeOrientation == GaugeOrientation.horizontal;

    if (_gaugeOrientation == gaugeOrientation) return;

    _gaugeOrientation = gaugeOrientation;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_textStyle] parameter.
  ///
  get getTextStyle => _textStyle;
  TextStyle _textStyle;
  set setTextStyle(textStyle) {
    if (_textStyle == textStyle) return;

    _textStyle = textStyle;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_primaryRulersWidth] parameter.
  ///
  get getPrimaryRulersWidth => _primaryRulersWidth;
  double _primaryRulersWidth;
  set setPrimaryRulersWidth(primaryRulersWidth) {
    if (_primaryRulersWidth == primaryRulersWidth) return;

    _primaryRulersWidth = primaryRulersWidth;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_primaryRulersHeight] parameter.
  ///
  get getPrimaryRulersHeight => _primaryRulersHeight;

  double _primaryRulersHeight;

  set setPrimaryRulersHeight(primaryRulersHeight) {
    if (_primaryRulersHeight == primaryRulersHeight) return;

    _primaryRulersHeight = primaryRulersHeight;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_secondaryRulersHeight] parameter.
  ///

  get getSecondaryRulersHeight => _secondaryRulersHeight;

  double _secondaryRulersHeight;

  set setSecondaryRulersHeight(secondaryRulersHeight) {
    if (_secondaryRulersHeight == secondaryRulersHeight) return;

    _secondaryRulersHeight = secondaryRulersHeight;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_secondaryRulersWidth] parameter.
  ///
  get getSecondaryRulersWidth => _secondaryRulersWidth;
  double _secondaryRulersWidth;
  set setSecondaryRulersWidth(secondaryRulersWidth) {
    if (_secondaryRulersWidth == secondaryRulersWidth) return;

    _secondaryRulersWidth = secondaryRulersWidth;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_primaryRulerColor] parameter.
  ///
  Color get getPrimaryRulerColor => _primaryRulerColor;
  Color _primaryRulerColor;

  set setPrimaryRulerColor(primaryRulerColor) {
    if (_primaryRulerColor == primaryRulerColor) return;
    _primaryRulerColor = primaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_secondaryRulerColor] parameter.
  ///
  Color get getSecondaryRulerColor => _secondaryRulerColor;
  Color _secondaryRulerColor;

  set setSecondaryRulerColor(secondaryRulerColor) {
    if (_secondaryRulerColor == secondaryRulerColor) return;
    _secondaryRulerColor = secondaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_secondaryRulerPerInterval] parameter.
  ///
  double get getSecondaryRulerPerInterval => _secondaryRulerPerInterval;
  double _secondaryRulerPerInterval;

  set setSecondaryRulerPerInterval(secondaryRulerPerInterval) {
    if (_secondaryRulerPerInterval == secondaryRulerPerInterval) {
      return;
    }
    _secondaryRulerPerInterval = secondaryRulerPerInterval;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_linearGaugeContainerBgColor] parameter.
  ///
  Color get getLinearGaugeContainerBgColor => _linearGaugeContainerBgColor;
  Color _linearGaugeContainerBgColor;
  set setLinearGaugeContainerBgColor(Color linearGaugeContainerBgColor) {
    if (_linearGaugeContainerBgColor == linearGaugeContainerBgColor) {
      return;
    }
    _linearGaugeContainerBgColor = linearGaugeContainerBgColor;
    markNeedsPaint();
  }

  bool get showLabel => _showLabel;
  bool _showLabel;
  set setShowLabel(bool val) {
    if (_showLabel == val) return;
    _showLabel = val;
    markNeedsPaint();
  }

  bool get fillExtend => _fillExtend;
  bool _fillExtend;
  set setFillExtend(bool val) {
    if (_fillExtend == val) return;
    _fillExtend = val;
    markNeedsPaint();
  }

  RulerPosition get rulerPosition => _rulerPosition;
  RulerPosition _rulerPosition;
  set setRulerPosition(RulerPosition val) {
    if (_rulerPosition == val) return;
    _rulerPosition = val;
    markNeedsLayout();
  }

  double get getLabelOffset => _labelOffset;
  double _labelOffset;
  set setLabelOffset(double val) {
    if (_labelOffset == val) return;
    _labelOffset = val;
    markNeedsLayout();
  }

  bool get showSecondaryRulers => _showSecondaryRulers;
  bool _showSecondaryRulers;
  set setShowSecondaryRulers(bool val) {
    if (_showSecondaryRulers == val) return;
    _showSecondaryRulers = val;
    markNeedsPaint();
  }

  bool get showPrimaryRulers => _showPrimaryRulers;
  bool _showPrimaryRulers;
  set setShowPrimaryRulers(bool val) {
    if (_showPrimaryRulers == val) return;
    _showPrimaryRulers = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_rulersOffset] parameter.
  ///

  double get getRulersOffset => _rulersOffset;
  double _rulersOffset;
  set setRulersOffset(double val) {
    if (_rulersOffset == val) return;
    _rulersOffset = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_inversedRulers] parameter.
  ///

  bool get getInversedRulers => _inversedRulers;
  bool _inversedRulers;
  set setInversedRulers(bool val) {
    if (_inversedRulers == val) return;
    _inversedRulers = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_thickness] parameter.
  ///
  double get getThickness => _thickness;
  double _thickness;
  set setThickness(double val) {
    if (_thickness == val) return;
    _thickness = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_extendLinearGauge] parameter.
  ///
  double get getExtendLinearGauge => _extendLinearGauge;
  double _extendLinearGauge;
  set setExtendLinearGauge(double val) {
    if (_extendLinearGauge == val) return;
    _extendLinearGauge = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [Pointer] parameter.
  ///
  List<Pointer> get getPointers => _pointers;
  List<Pointer> _pointers = <Pointer>[];
  set setPointers(List<Pointer> val) {
    if (_pointers == val) return;
    _pointers = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [rangeLinearGauge] parameter.
  ///
  List<RangeLinearGauge>? get rangeLinearGauge => _rangeLinearGauge;
  List<RangeLinearGauge>? _rangeLinearGauge = <RangeLinearGauge>[];
  set setRangeLinearGauge(List<RangeLinearGauge>? val) {
    if (_rangeLinearGauge == val) return;
    _rangeLinearGauge = val;
    markNeedsPaint();
  }

  List<CustomRulerLabel>? get getCustomLabels => _customLabels;
  List<CustomRulerLabel>? _customLabels = <CustomRulerLabel>[];
  set setCustomLabels(List<CustomRulerLabel>? val) {
    if (_customLabels == val) return;
    _customLabels = val;
    markNeedsPaint();
  }

  void _addAnimationListener() {
    if (_gaugeAnimation != null) {
      _gaugeAnimation!.addListener(markNeedsPaint);
    }
  }

  void _removeAnimationListeners() {
    if (_gaugeAnimation != null) {
      _gaugeAnimation!.removeListener(markNeedsPaint);
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _addAnimationListener();
  }

  @override
  void detach() {
    _removeAnimationListeners();
    super.detach();
  }

  Color setAnimatedColor(Color paintColor) {
    double animationValue = 1;
    if (_gaugeAnimation != null) {
      animationValue = _gaugeAnimation!.value;
    }

    return paintColor.withOpacity(animationValue * paintColor.opacity);
  }

  ShapePointer? getLargestPointer(List<ShapePointer>? pointers) {
    ShapePointer? largestPointer = pointers?.reduce(
        (current, next) => getGaugeOrientation == GaugeOrientation.vertical
            ? current.height > next.height
                ? current
                : next
            : current.width > next.width
                ? current
                : next);
    return largestPointer;
  }

  double getLargestPointerSize() {
    if (filteredShapePointers.isNotEmpty) {
      ShapePointer? largestPointer = getLargestPointer(filteredShapePointers);

      if ((largestPointer?.shape == PointerShape.rectangle ||
              largestPointer?.shape == PointerShape.diamond) &&
          getGaugeOrientation == GaugeOrientation.vertical) {
        return largestPointer?.height ?? 0;
      } else {
        if (largestPointer?.shape == PointerShape.circle) {
          return largestPointer?.height ?? 0;
        } else {
          return largestPointer?.width ?? 0;
        }
      }
    } else {
      return 10;
    }
  }

  void _setLinearGaugeContainerPaint() {
    _linearGaugeContainerPaint.color =
        setAnimatedColor(getLinearGaugeContainerBgColor);
  }

  void _calculateRulerPoints() {
    if (getCustomLabels!.isEmpty) {
      double screenSize = getGaugeOrientation == GaugeOrientation.horizontal
          ? 3 * size.width
          : 3 * size.height;

      final double count = math.max(screenSize / 100, 1.0);
      double interval = (getEnd - getStart) / (screenSize / 100);
      final List<double> intervalDivisions = <double>[10, 5, 2, 1];
      late double currentInterval;
      num v = math.pow(10, (math.log(interval) / math.log(10)).floor());

      for (final double intervalDivision in intervalDivisions) {
        currentInterval = v * intervalDivision;

        if (count < ((getEnd - getStart) / currentInterval)) {
          break;
        }
        interval = currentInterval;
      }

      _linearGaugeLabel.addLabels(
        distanceValueInRangeOfHundred: getSteps == 0.0 ? interval : getSteps,
        start: getStart,
        end: getEnd,
      );
    } else {
      _start = getCustomLabels!.first.value!;
      _end = getCustomLabels!.last.value!;
      _linearGaugeLabel.addCustomLabels(labelList: getCustomLabels!);
    }

    _linearGaugeLabel.generateOffSetsForLabel(
        _startLabelSize,
        _endLabelSize,
        size,
        getEnd,
        getPrimaryRulersHeight,
        getThickness,
        0,
        getCustomLabels!.isNotEmpty,
        getInversedRulers,
        getGaugeOrientation,
        getExtendLinearGauge,
        this);
  }

  void _paintGaugeContainer(Canvas canvas, Size size, Offset offsets) {
    if (rangeLinearGauge!.isNotEmpty) {
      assert(rangeLinearGauge!.every((element) => element.start >= getStart),
          'The start value of the range should be less than the start value of the gauge.');
      assert(rangeLinearGauge!.every((element) => element.end <= getEnd),
          'The end value of the range should be less than the end value of the gauge.');
      assert(rangeLinearGauge!.every((element) => element.start <= element.end),
          'The start value of the range should be less than the end value of the range.');
    }

    Offset offset = Offset(
      0,
      getGaugeOrientation == GaugeOrientation.horizontal
          ? yAxisForGaugeContainer
          : xAxisForGaugeContainer,
    );
    late double end;
    late double start;

    double largestPointerWidth = getLargestPointerSize();

    if (showLabel) {
      end = GaugeOrientation.horizontal == getGaugeOrientation
          ? size.width -
              ((_endLabelSize.width / 2) +
                  (_startLabelSize.width / 2) +
                  (largestPointerWidth))
          : (size.height -
              ((_endLabelSize.height / 2) +
                  (_startLabelSize.height / 2) +
                  (largestPointerWidth)));

      start = GaugeOrientation.horizontal == getGaugeOrientation
          ? (offset.dx +
              (_startLabelSize.width / 2) +
              (largestPointerWidth / 2))
          : (offset.dx +
              (_startLabelSize.height / 2) +
              (largestPointerWidth / 2));
    } else {
      end = GaugeOrientation.horizontal == getGaugeOrientation
          ? size.width - (largestPointerWidth)
          : size.height - (largestPointerWidth);
      start = offset.dx + (largestPointerWidth / 2);
    }
    gaugeStart = start;
    gaugeEnd = end;
    late Rect gaugeContainer;
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      gaugeContainer = Rect.fromLTWH(
        start,
        offset.dy,
        end,
        getThickness,
      );
    } else {
      gaugeContainer = Rect.fromLTWH(
        offset.dy,
        start,
        getThickness,
        end,
      );
    }

    double totalWidth = end;

    if (getBorderRadius != null) {
      var rectangularBox = _getRoundedContainer(
        gaugeContainer: gaugeContainer,
        borderRadius: getBorderRadius,
        edgeStyle: getEdgeStyle,
      );

      if (_showLinearGaugeContainer) {
        canvas.drawRRect(rectangularBox, _linearGaugeContainerPaint);
      }
    } else {
      if (_showLinearGaugeContainer) {
        canvas.drawRect(gaugeContainer, _linearGaugeContainerPaint);
      }
    }

    _drawRangeBars(
      start: start,
      end: end,
      canvas: canvas,
      totalWidth: totalWidth,
      gaugeContainer: gaugeContainer,
      offset: offset,
    );
  }

  void _drawRangeBars({
    required Canvas canvas,
    required double start,
    required double end,
    required double totalWidth,
    required Offset offset,
    required Rect gaugeContainer,
  }) {
    RRect roundedGaugeContainer;

    /// For loop for calculating colors in [rangeLinearGauge]
    /// 2 is hardcoded beacuse extend is happeing from both the end of the gauge
    for (int i = 0; i < rangeLinearGauge!.length; i++) {
      // Method to cal exact width
      double calculateValuePixelWidth(double value) {
        return ((value - getStart) / (getEnd - getStart)) *
            (totalWidth - 2 * getExtendLinearGauge);
      }

      // width of the colorRange
      double colorRangeWidth =
          calculateValuePixelWidth(rangeLinearGauge![i].end) -
              calculateValuePixelWidth(rangeLinearGauge![i].start);

      // Start of the ColorRange

      double colorRangeStart;
      if (getGaugeOrientation == GaugeOrientation.horizontal) {
        colorRangeStart = !getInversedRulers
            ? (calculateValuePixelWidth(rangeLinearGauge![i].start) +
                start +
                getExtendLinearGauge)
            : ((start + end) -
                calculateValuePixelWidth(rangeLinearGauge![i].start) -
                getExtendLinearGauge);

        if (fillExtend) {
          if (rangeLinearGauge![i].start == getStart) {
            if (!getInversedRulers) {
              colorRangeStart = colorRangeStart - getExtendLinearGauge;
              colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
            } else {
              colorRangeStart = colorRangeStart + getExtendLinearGauge;
              colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
            }
          }
          if (rangeLinearGauge![i].end == getEnd) {
            colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
          }
        }

        gaugeContainer = Rect.fromLTWH(
          colorRangeStart,
          offset.dy,
          !getInversedRulers ? colorRangeWidth : -colorRangeWidth,
          getThickness,
        );
      } else {
        colorRangeStart = !getInversedRulers
            ? ((start + end) -
                calculateValuePixelWidth(rangeLinearGauge![i].start) -
                getExtendLinearGauge)
            : (calculateValuePixelWidth(rangeLinearGauge![i].start) +
                start +
                getExtendLinearGauge);

        if (fillExtend) {
          if (rangeLinearGauge![i].start == getStart) {
            if (!getInversedRulers) {
              colorRangeStart = colorRangeStart + getExtendLinearGauge;
              colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
            } else {
              colorRangeStart = colorRangeStart - getExtendLinearGauge;
              colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
            }
          }
          if (rangeLinearGauge![i].end == getEnd) {
            colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
          }
        }
        gaugeContainer = Rect.fromLTWH(
          offset.dy,
          colorRangeStart,
          getThickness,
          !getInversedRulers ? -colorRangeWidth : colorRangeWidth,
        );
      }

      _linearGaugeRangePaint.color = rangeLinearGauge![i].color;
      if (rangeLinearGauge![i].borderRadius != null) {
        roundedGaugeContainer = _getRoundedContainer(
          gaugeContainer: gaugeContainer,
          borderRadius: rangeLinearGauge![i].borderRadius,
          edgeStyle: rangeLinearGauge![i].edgeStyle,
        );
        canvas.drawRRect(
          roundedGaugeContainer,
          _linearGaugeRangePaint,
        );
      } else {
        canvas.drawRect(
          gaugeContainer,
          _linearGaugeRangePaint,
        );
      }
    }
  }

  RRect _getRoundedContainer({
    required Rect gaugeContainer,
    required borderRadius,
    required edgeStyle,
  }) {
    RRect rectangularBox;
    switch (edgeStyle) {
      case LinearEdgeStyle.startCurve:
        rectangularBox = RRect.fromRectAndCorners(
          gaugeContainer,
          topLeft: Radius.circular(borderRadius!),
          bottomLeft: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.circular(borderRadius!)
              : Radius.zero,
          topRight: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.zero
              : Radius.circular(borderRadius!),
        );
        break;
      case LinearEdgeStyle.endCurve:
        rectangularBox = RRect.fromRectAndCorners(
          gaugeContainer,
          topRight: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.circular(borderRadius!)
              : Radius.zero,
          bottomLeft: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.zero
              : Radius.circular(borderRadius!),
          bottomRight: Radius.circular(borderRadius!),
        );
        break;

      default:
        rectangularBox = RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(borderRadius!),
        );
        break;
    }

    return rectangularBox;
  }

  @override
  void performLayout() {
    _startLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle,
        value: !getInversedRulers
            ? getCustomLabels!.isEmpty
                ? getStart.toInt().toString()
                : getCustomLabels!.first.text
            : getCustomLabels!.isEmpty
                ? getEnd.toInt().toString()
                : getCustomLabels!.last.text);

    _endLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle,
        value: !getInversedRulers
            ? getCustomLabels!.isEmpty
                ? getEnd.toInt().toString()
                : getCustomLabels!.last.text
            : getCustomLabels!.isEmpty
                ? getStart.toInt().toString()
                : getCustomLabels!.first.text);

    filterShapePointers(getPointers);

    // double parentWidgetSize;

    // final double actualParentWidth = constraints.maxWidth;
    // final double actualParentHeight = constraints.maxHeight;

    // if (_isHorizontalOrientation) {
    //   parentWidgetSize = actualParentWidth;
    // } else {
    //   parentWidgetSize = actualParentHeight;
    // }

    // final double gaugeContainerWidgetThickness = _measureGaugeContainerSize();

    // if (_isHorizontalOrientation) {
    //   _axisActualSize = Size(parentWidgetSize, gaugeContainerWidgetThickness);
    // } else {
    //   _axisActualSize = Size(gaugeContainerWidgetThickness, parentWidgetSize);
    // }

    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  // _measureGaugeContainerSize() {

  //   double effectiveLabelThickness = _isHorizontalOrientation
  //       ? _startLabelSize.height
  //       : _startLabelSize.width;
  //   _effectiveRulerHeight = math.max(
  //       getPrimaryRulersHeight + getLabelOffset + effectiveLabelThickness,
  //       getSecondaryRulersHeight);
  //   if (rulerPosition == RulerPosition.center) {
  //     return (getThickness >= _effectiveRulerHeight)
  //         ? getThickness - _effectiveRulerHeight
  //         : _effectiveRulerHeight - getThickness;
  //   }

  //   return _effectiveRulerHeight + getThickness + getRulersOffset;
  // }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    xAxisForGaugeContainer = offset.dx;
    yAxisForGaugeContainer = offset.dy;
    _setLinearGaugeContainerPaint();
    _calculateRulerPoints();
    _paintGaugeContainer(canvas, size, offset);
  }

  void filterShapePointers(List<Pointer> pointers) {
    for (dynamic pointer in pointers) {
      if (pointer.runtimeType == ShapePointer) {
        filteredShapePointers.add(pointer as ShapePointer);
      }
    }
  }
}
