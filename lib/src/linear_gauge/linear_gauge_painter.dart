import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/curve/custom_curve_painter.dart';
import 'dart:math' as math;
import 'package:geekyants_flutter_gauges/src/linear_gauge/linear_gauge_label.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/rulers/label_painter.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/rulers/rulers_painter.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/value_bar/valuebar_painter.dart';

import 'gauge_container/linear_gauge_container.dart';

class RenderLinearGauge extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, LinearGaugeParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, LinearGaugeParentData>,
        DebugOverflowIndicatorMixin {
  RenderLinearGauge({
    required double start,
    required double end,
    required double steps,
    required GaugeOrientation gaugeOrientation,
    required TextStyle textStyle,
    required double primaryRulersWidth,
    required double primaryRulersHeight,
    required double secondaryRulersHeight,
    required double secondaryRulersWidth,
    required RulerPosition rulerPosition,
    required double labelOffset,
    required double value,
    required List<RangeLinearGauge> rangeLinearGauge,
    required List<CustomRulerLabel> customLabels,
    required double rulersOffset,
    required List<ValueBar> valueBar,
    required bool inversedRulers,
    required List<BasePointer> pointers,
    required double thickness,
    required double extendLinearGauge,
    required bool fillExtend,
    required bool showLabel,
    required List<CustomCurve>? customCurve,
  })  : assert(start < end, "Start should be grater then end"),
        _start = start,
        _end = end,
        _steps = steps,
        _gaugeOrientation = gaugeOrientation,
        _textStyle = textStyle,
        _primaryRulersWidth = primaryRulersWidth,
        _primaryRulersHeight = primaryRulersHeight,
        _secondaryRulersHeight = secondaryRulersHeight,
        _secondaryRulersWidth = secondaryRulersWidth,
        _rulerPosition = rulerPosition,
        _labelOffset = labelOffset,
        _value = value,
        _rangeLinearGauge = rangeLinearGauge,
        _customLabels = customLabels,
        _rulersOffset = rulersOffset,
        _inversedRulers = inversedRulers,
        _valueBar = valueBar,
        _pointers = pointers,
        _thickness = thickness,
        _extendLinearGauge = extendLinearGauge,
        _fillExtend = fillExtend,
        _curves = customCurve,
        _showLabel = showLabel,
        _valueBarRenderObject = <RenderValueBar>[],
        _renderCurves = <RenderCurve>[],
        _widgetPointers = <RenderLinearGaugeWidgetPointer>[],
        _shapePointers = <RenderLinearGaugeShapePointer>[] {
    _horizontalDrag = HorizontalDragGestureRecognizer()
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd
      ..onStart = _handleDragStart
      ..dragStartBehavior = DragStartBehavior.start;
    _verticalDrag = VerticalDragGestureRecognizer()
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd
      ..onStart = _handleDragStart
      ..dragStartBehavior = DragStartBehavior.start;
  }

  // For getting Gauge Values
  double gaugeStart = 0;
  double gaugeEnd = 0;
  double? topCurveMaxHeight,
      bottomCurveMaxHeight,
      rightCurveMaxHeight,
      leftCurveMaxHeight = 0;
  double? topPointerHeight,
      bottomPointerHeight,
      centerPointerHeight,
      pointerMaxOfBottomAndCenter,
      pointerMaxOfTopAndCenter = 0;

  double? topWidgetPointerHeight,
      bottomWidgetPointerHeight,
      centerWidgetPointerHeight,
      widgetPointerMaxOfBottomAndCenter,
      widgetPointerMaxOfTopAndCenter = 0;

  double? topValueBarOffset,
      bottomValueBarOffset,
      centerValueBarOffset,
      leftValueBarOffset,
      rightValueBarOffset,
      valueBarMaxOfBottomAndCenter,
      valueBarMaxOfLeftAndCenter,
      valueBarMaxOfRightAndCenter,
      valueBarMaxOfTopAndCenter = 0;
  double? rightPointerHeight,
      leftPointerHeight,
      pointerMaxOfRightAndCenter,
      pointerMaxOfLeftAndCenter = 0;

  double? rightWidgetPointerHeight,
      leftWidgetPointerHeight,
      widgetPointerMaxOfRightAndCenter,
      widgetPointerMaxOfLeftAndCenter = 0;
  double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;
  double spacingForGauge = 0;
  List<Pointer> filteredShapePointers = [];

  // For Interactivity
  PointerDeviceKind pointerType = PointerDeviceKind.mouse;
  bool restrictPointerChange = false;
  bool restrictWidgetPointerChange = false;

  // RenderObjects For Movable Pointers
  late RenderLinearGaugeShapePointer _movablePointer;
  late RenderLinearGaugeWidgetPointer _movableWidget;

  late HitTestTarget _pointerType;

  /// Horizontal  Gesture Recognizer for the Linear Gauge.
  late HorizontalDragGestureRecognizer _horizontalDrag;

  /// Vertical Gesture Recognizer for the Linear Gauge.
  late VerticalDragGestureRecognizer _verticalDrag;

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
  /// Getter and Setter for the [gaugeOrientation] parameter.
  ///
  get getGaugeOrientation => _gaugeOrientation;
  GaugeOrientation _gaugeOrientation;

  set setGaugeOrientation(gaugeOrientation) {
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

  double get getValue => _value;
  double _value;
  set setValue(double val) {
    if (_value == val) {
      return;
    }
    _value = val;
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

  ///
  /// Getter and Setter for the [rulersOffset] parameter.
  ///

  double get getRulersOffset => _rulersOffset;
  double _rulersOffset;
  set setRulersOffset(double val) {
    if (_rulersOffset == val) return;
    _rulersOffset = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [inversedRulers] parameter.
  ///

  bool get getInversedRulers => _inversedRulers;
  bool _inversedRulers;
  set setInversedRulers(bool val) {
    if (_inversedRulers == val) return;
    _inversedRulers = val;
    markNeedsPaint();
  }

  bool get showLabel => _showLabel;
  bool _showLabel;
  set setShowLabel(bool val) {
    if (_showLabel == val) return;
    _showLabel = val;
    markNeedsPaint();
  }

  LinearGaugeLabel get getLinearGaugeLabel {
    return _linearGaugeLabel;
  }

  ///
  /// Getter and Setter for the [valueBar] parameter.
  ///
  List<ValueBar> get getValueBar => _valueBar;
  List<ValueBar> _valueBar = <ValueBar>[];
  set setValueBar(List<ValueBar> val) {
    if (_valueBar == val) return;
    _valueBar = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [Pointer] parameter.
  ///
  List<BasePointer> get getPointers => _pointers;
  List<BasePointer> _pointers = <BasePointer>[];
  set setPointers(List<BasePointer> val) {
    if (_pointers == val) return;
    _pointers = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [thickness] parameter.
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
  /// Getter and Setter for the [fillExtend] parameter.
  ///
  bool get getFillExtend => _fillExtend;
  bool _fillExtend;
  set setFillExtend(bool val) {
    if (_fillExtend == val) return;
    _fillExtend = val;
    markNeedsPaint();
  }

  List<CustomCurve>? get getCustomCurves => _curves;
  List<CustomCurve>? _curves = <CustomCurve>[];
  set setCurves(List<CustomCurve>? val) {
    if (_curves == val) return;
    _curves = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_pointerSpace] parameter.
  ///
  double get getPointerSpace => _pointerSpace;
  final double _pointerSpace = 0;
  LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();

  late Size _axisActualSize;
  late final List<RenderLinearGaugeWidgetPointer> _widgetPointers;

  // static List<RenderLinearGaugeWidgetPointer>? get getWidgetPointers =>
  //     _widgetPointers;

  late final List<RenderLinearGaugeShapePointer> _shapePointers;
  late final List<RenderValueBar> _valueBarRenderObject;
  late final List<RenderCurve> _renderCurves;

  late final RenderRulers _renderRulerElement;
  RenderRulerLabel? _renderRulerLabel;

  /// Adds the widget render object to widget pointer collection.
  void addWidgetPointer(RenderLinearGaugeWidgetPointer widgetPointer) {
    _widgetPointers.add(widgetPointer);
    markNeedsLayout();
  }

  /// Adds the widget render object to widget pointer collection.
  void removeWidgetPointer(RenderLinearGaugeWidgetPointer widgetPointer) {
    _widgetPointers.remove(widgetPointer);
    markNeedsLayout();
  }

  /// Adds the widget render object to widget pointer collection.
  void removeShapePointer(RenderLinearGaugeShapePointer shapePointer) {
    _shapePointers.remove(shapePointer);
    markNeedsLayout();
  }

  /// Adds the shape render object to widget pointer collection.
  void addShapePointer(RenderLinearGaugeShapePointer shapePointer) {
    _shapePointers.add(shapePointer);
    markNeedsLayout();
  }

  /// Adds the ruler render object to widget .
  void addRuler(RenderRulers ruler) {
    _renderRulerElement = ruler;
    markNeedsLayout();
  }

  /// Adds the ruler render object to widget .
  void addRulerLabel(RenderRulerLabel label) {
    _renderRulerLabel = label;
    markNeedsLayout();
  }

  /// Adds the valuebar render object to widget .
  void addValueBar(RenderValueBar ruler) {
    _valueBarRenderObject.add(ruler);
    markNeedsLayout();
  }

  /// Remove the valuebar render object from widget .
  void removeValueBar(RenderValueBar ruler) {
    _valueBarRenderObject.remove(ruler);
    markNeedsLayout();
  }

  /// Adds the curve render object to widget .
  void addCurve(RenderCurve curve) {
    _renderCurves.add(curve);
    markNeedsLayout();
  }

  /// Remove the curve render object to widget .
  void removeCurve(RenderCurve curve) {
    _renderCurves.remove(curve);
    markNeedsLayout();
  }

  ValueBar? getLargestValueBarOffset(List<ValueBar>? valueBars) {
    ValueBar? largestValueBarWithOffset = valueBars?.reduce(
        (current, next) => current.offset > next.offset ? current : next);
    return largestValueBarWithOffset;
  }

  Pointer? getLargestPointerForLayout(List<Pointer>? pointers) {
    Pointer? largestPointer = pointers?.reduce(
        (current, next) => getGaugeOrientation == GaugeOrientation.horizontal
            ? current.height > next.height
                ? current
                : next
            : current.width > next.width
                ? current
                : next);

    return largestPointer;
  }

  RenderLinearGaugeWidgetPointer? getLargestWidgetPointerForLayout(
      List<RenderLinearGaugeWidgetPointer>? pointers) {
    RenderLinearGaugeWidgetPointer? largestPointer = pointers?.reduce(
        (current, next) => getGaugeOrientation == GaugeOrientation.horizontal
            ? current.size.height > next.size.height
                ? current
                : next
            : current.size.width > next.size.width
                ? current
                : next);
    return largestPointer;
  }

  ValueBar? getLargestValueBarForLayout(List<ValueBar>? valueBars) {
    ValueBar? largestValueBar = valueBars?.reduce((current, next) =>
        (current.valueBarThickness + current.offset) >
                (next.valueBarThickness + next.offset)
            ? current
            : next);
    return largestValueBar;
  }

  Offset _layoutCircleOffsets(
      Offset offset, RenderLinearGaugeShapePointer pointer) {
    double gaugeThickness = getThickness;
    GaugeOrientation orientation = getGaugeOrientation!;

    switch (pointer.pointerPosition) {
      case PointerPosition.top:
        offset = Offset(
            offset.dx - pointer.height / 2,
            (offset.dy - pointer.height - gaugeThickness) +
                yAxisForGaugeContainer);
        break;
      case PointerPosition.bottom:
        offset = Offset(
            offset.dx - pointer.height / 2, offset.dy + yAxisForGaugeContainer);
        break;
      case PointerPosition.center:
        offset = orientation == GaugeOrientation.horizontal
            ? Offset(
                offset.dx - pointer.height / 2,
                (offset.dy - pointer.height / 2 - gaugeThickness / 2) +
                    yAxisForGaugeContainer)
            : Offset(
                offset.dx -
                    pointer.height / 2 -
                    gaugeThickness / 2 +
                    xAxisForGaugeContainer,
                offset.dy - pointer.height / 2);
        break;
      case PointerPosition.right:
        offset = Offset(
            offset.dx + xAxisForGaugeContainer, offset.dy - pointer.height / 2);
        break;
      case PointerPosition.left:
        offset = Offset(
            offset.dx -
                pointer.height -
                gaugeThickness +
                xAxisForGaugeContainer,
            offset.dy - pointer.height / 2);
        break;
      default:
        break;
    }

    switch (pointer.pointerAlignment) {
      case PointerAlignment.start:
        offset = (getGaugeOrientation! == GaugeOrientation.horizontal)
            ? Offset(offset.dx - pointer.height / 2, offset.dy)
            : Offset(offset.dx, offset.dy - pointer.height / 2);
        break;
      case PointerAlignment.end:
        offset = (getGaugeOrientation! == GaugeOrientation.horizontal)
            ? Offset(offset.dx + pointer.height / 2, offset.dy)
            : Offset(offset.dx, offset.dy + pointer.height / 2);

        break;
      default:
        break;
    }

    return offset;
  }

  Offset _layoutRectangleOffsets(
      Offset offset, RenderLinearGaugeShapePointer pointer) {
    double gaugeThickness = getThickness;
    GaugeOrientation rulerOrientation = getGaugeOrientation!;
    switch (pointer.pointerPosition) {
      case PointerPosition.top:
        offset = Offset(
            offset.dx - pointer.width / 2,
            (offset.dy - pointer.height - gaugeThickness) +
                yAxisForGaugeContainer);
        break;
      case PointerPosition.bottom:
        offset = Offset(
            offset.dx - pointer.width / 2, offset.dy + yAxisForGaugeContainer);
        break;
      case PointerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(
                offset.dx - pointer.width / 2,
                (offset.dy - pointer.height / 2 - gaugeThickness / 2) +
                    yAxisForGaugeContainer)
            : Offset(
                offset.dx -
                    pointer.width / 2 -
                    gaugeThickness / 2 +
                    xAxisForGaugeContainer,
                offset.dy - pointer.height / 2);
        break;
      case PointerPosition.right:
        offset = Offset(
            offset.dx + xAxisForGaugeContainer, offset.dy - pointer.height / 2);
        break;
      case PointerPosition.left:
        offset = Offset(
            offset.dx - pointer.width - gaugeThickness + xAxisForGaugeContainer,
            offset.dy - pointer.height / 2);
        break;
      default:
        break;
    }

    switch (pointer.pointerAlignment) {
      case PointerAlignment.start:
        offset = (getGaugeOrientation! == GaugeOrientation.horizontal)
            ? Offset(offset.dx - pointer.width / 2, offset.dy)
            : Offset(offset.dx, offset.dy - pointer.height / 2);
        break;
      case PointerAlignment.end:
        offset = (getGaugeOrientation! == GaugeOrientation.horizontal)
            ? Offset(offset.dx + pointer.width / 2, offset.dy)
            : Offset(offset.dx, offset.dy + pointer.height / 2);

        break;
      default:
        break;
    }

    return offset;
  }

  Offset getPointerOffset(dynamic pointer) {
    double start = gaugeStart;
    double end = gaugeEnd;

    gaugeEnd = end;
    gaugeStart = start;
    var verticalFirstOffset =
        _linearGaugeLabel.primaryRulers[getStart.toString()]!;
    Offset offset = verticalFirstOffset.first;
    double valueInPX = !getInversedRulers
        ? (pointer.value! - getStart) /
            (getEnd - getStart) *
            (end - 2 * getExtendLinearGauge)
        : (pointer.value! - getEnd) /
            (getStart - getEnd) *
            (end - 2 * getExtendLinearGauge);

    Offset hOffset =
        Offset(valueInPX + start + getExtendLinearGauge, offset.dy);

    Offset vOffset = getInversedRulers
        ? Offset(
            offset.dx, offset.dy + (end - valueInPX - 2 * getExtendLinearGauge))
        : Offset(offset.dx, (offset.dy - valueInPX));

    offset =
        getGaugeOrientation == GaugeOrientation.horizontal ? hOffset : vOffset;

    if (pointer.runtimeType == RenderLinearGaugeShapePointer) {
      switch (pointer.shape) {
        case PointerShape.circle:
          offset = _layoutCircleOffsets(offset, pointer);
          break;
        case PointerShape.rectangle:
          offset = _layoutRectangleOffsets(offset, pointer);
          break;
        case PointerShape.triangle:
          offset = _layoutTriangleOffsets(offset, pointer);
          break;
        case PointerShape.diamond:
          offset = _layoutDiamondOffsets(offset, pointer);
          break;
        default:
          break;
      }
    } else {
      offset = _layoutChildWidget(offset, pointer);
    }
    return offset;
  }

  Offset _layoutChildWidget(
      Offset offset, RenderLinearGaugeWidgetPointer pointer) {
    double gaugeThickness = getThickness;
    GaugeOrientation rulerOrientation = getGaugeOrientation!;
    switch (pointer.pointerPosition) {
      case PointerPosition.top:
        offset = Offset(
            offset.dx - pointer.size.width / 2,
            (offset.dy - pointer.size.height - gaugeThickness) +
                yAxisForGaugeContainer);
        break;
      case PointerPosition.bottom:
        offset = Offset(offset.dx - pointer.size.width / 2,
            offset.dy + yAxisForGaugeContainer);
        break;
      case PointerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(
                offset.dx - pointer.size.width / 2,
                (offset.dy - gaugeThickness / 2 - pointer.size.height / 2) +
                    yAxisForGaugeContainer)
            : Offset(
                offset.dx -
                    pointer.size.width / 2 -
                    gaugeThickness / 2 +
                    xAxisForGaugeContainer,
                offset.dy - pointer.size.height / 2);
        break;
      case PointerPosition.right:
        offset = Offset(offset.dx + xAxisForGaugeContainer,
            offset.dy - pointer.size.height / 2);
        break;
      case PointerPosition.left:
        offset = Offset(
            offset.dx -
                pointer.size.width -
                gaugeThickness +
                xAxisForGaugeContainer,
            offset.dy - pointer.size.height / 2);
        break;
      default:
        break;
    }

    switch (pointer.pointerAlignment) {
      case PointerAlignment.start:
        offset = (rulerOrientation == GaugeOrientation.horizontal)
            ? Offset(offset.dx - pointer.size.width / 2, offset.dy)
            : Offset(offset.dx, offset.dy - pointer.size.height / 2);
        break;
      case PointerAlignment.end:
        offset = (rulerOrientation == GaugeOrientation.horizontal)
            ? Offset(offset.dx + pointer.size.width / 2, offset.dy)
            : Offset(offset.dx, offset.dy + pointer.size.height / 2);

        break;
      default:
        break;
    }

    return offset;
  }

  Offset _layoutTriangleOffsets(
      Offset offset, RenderLinearGaugeShapePointer pointer) {
    double gaugeThickness = getThickness;
    GaugeOrientation rulerOrientation = getGaugeOrientation!;

    switch (pointer.pointerPosition) {
      case PointerPosition.top:
        offset = Offset(
            offset.dx - pointer.width / 2,
            (offset.dy - pointer.height - gaugeThickness) +
                yAxisForGaugeContainer);
        break;
      case PointerPosition.bottom:
        offset = Offset(
            offset.dx - pointer.width / 2, offset.dy + yAxisForGaugeContainer);
        break;
      case PointerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(
                offset.dx - pointer.width / 2,
                (offset.dy - pointer.height / 2 - gaugeThickness / 2) +
                    yAxisForGaugeContainer)
            : Offset(
                offset.dx -
                    pointer.height / 2 -
                    gaugeThickness / 2 +
                    xAxisForGaugeContainer,
                offset.dy - pointer.width / 2);
        break;
      case PointerPosition.right:
        offset = Offset(
            offset.dx + xAxisForGaugeContainer, offset.dy - pointer.width / 2);
        break;
      case PointerPosition.left:
        offset = Offset(
            offset.dx -
                pointer.height -
                gaugeThickness +
                xAxisForGaugeContainer,
            offset.dy - pointer.width / 2);
        break;
      default:
        break;
    }
    final base = pointer.width / 2;

    switch (pointer.pointerAlignment) {
      case PointerAlignment.start:
        if (getGaugeOrientation! == GaugeOrientation.horizontal) {
          offset = Offset(offset.dx - base, offset.dy);
        } else {
          offset = Offset(offset.dx, offset.dy - base);
        }
        break;
      case PointerAlignment.end:
        (getGaugeOrientation! == GaugeOrientation.horizontal)
            ? offset = Offset(offset.dx + base, offset.dy)
            : offset = Offset(offset.dx, offset.dy + base);

        break;
      default:
        break;
    }
    return offset;
  }

  Offset _layoutDiamondOffsets(
    Offset offset,
    RenderLinearGaugeShapePointer pointer,
  ) {
    double gaugeThickness = getThickness;
    GaugeOrientation rulerOrientation = getGaugeOrientation!;
    switch (pointer.pointerPosition) {
      case PointerPosition.top:
        offset = Offset(
            offset.dx - pointer.width / 2,
            (offset.dy - gaugeThickness - pointer.height) +
                yAxisForGaugeContainer);
        break;
      case PointerPosition.bottom:
        offset = Offset(
            offset.dx - pointer.width / 2, offset.dy + yAxisForGaugeContainer);
        break;
      case PointerPosition.center:
        offset = rulerOrientation == GaugeOrientation.horizontal
            ? Offset(
                offset.dx - pointer.width / 2,
                offset.dy -
                    gaugeThickness / 2 +
                    yAxisForGaugeContainer -
                    pointer.height / 2)
            : Offset(
                offset.dx -
                    gaugeThickness / 2 +
                    xAxisForGaugeContainer -
                    pointer.width / 2,
                offset.dy - pointer.height / 2);

        break;
      case PointerPosition.right:
        offset = Offset(
            offset.dx + xAxisForGaugeContainer, offset.dy - pointer.height / 2);
        break;
      case PointerPosition.left:
        offset = Offset(
            offset.dx - gaugeThickness - pointer.width + xAxisForGaugeContainer,
            offset.dy - pointer.height / 2);
        break;
      default:
        break;
    }
    switch (pointer.pointerAlignment) {
      case PointerAlignment.start:
        (getGaugeOrientation! == GaugeOrientation.horizontal)
            ? offset = Offset(offset.dx - pointer.width / 2, offset.dy)
            : offset = Offset(offset.dx, offset.dy - pointer.height / 2);
        break;
      case PointerAlignment.end:
        (getGaugeOrientation! == GaugeOrientation.horizontal)
            ? offset = Offset(offset.dx + pointer.width / 2, offset.dy)
            : offset = (Offset(offset.dx, offset.dy + pointer.height / 2));

        break;
      default:
        break;
    }
    return offset;
  }

  _positionPointer(RenderObject linearGaugeChild) {
    final MultiChildLayoutParentData? childParentData =
        linearGaugeChild.parentData as MultiChildLayoutParentData?;
    childParentData!.offset = getPointerOffset(linearGaugeChild);
  }

  positionPointer() {
    if (_shapePointers.isNotEmpty) {
      for (var element in _shapePointers) {
        _positionPointer(element);
      }
    }

    if (_widgetPointers.isNotEmpty) {
      for (var element in _widgetPointers) {
        _positionPointer(element);
      }
    }
  }

  Offset _layoutRulerOffset(RenderRulers ruler) {
    List<Offset> value = _linearGaugeLabel.primaryRulers.values.first;
    List<Offset> lastValue = _linearGaugeLabel.primaryRulers.values.last;

    if (getInversedRulers) {
      List<Offset> temp = value;
      value = lastValue;
      lastValue = temp;
    }

    double? y;
    double? x;
    switch (rulerPosition) {
      case RulerPosition.top:
        y = -(value[1].dy + getRulersOffset - yAxisForGaugeContainer);
        x = value[1].dx;
        break;
      case RulerPosition.center:
        if (getGaugeOrientation == GaugeOrientation.horizontal) {
          y = ((getThickness) / 2) + yAxisForGaugeContainer - value[1].dy / 2;
          x = value[1].dx;
        } else {
          y = lastValue[1].dy;
          x = getThickness / 2 + xAxisForGaugeContainer - lastValue[1].dx / 2;
        }
        break;
      case RulerPosition.bottom:
        y = getThickness + getRulersOffset + yAxisForGaugeContainer;
        x = value[1].dx;

        break;
      case RulerPosition.right:
        y = lastValue[1].dy;
        x = getThickness + getRulersOffset + xAxisForGaugeContainer;

        break;
      case RulerPosition.left:
        y = lastValue[1].dy;
        x = -(lastValue[1].dx + getRulersOffset - xAxisForGaugeContainer);

        break;
    }

    Offset a;
    if (rulerPosition == RulerPosition.top ||
        rulerPosition == RulerPosition.left) {
      a = Offset(x, y);
    } else {
      a = Offset(x, y);
    }

    return a;
  }

  positionRulers() {
    final MultiChildLayoutParentData? childParentData =
        _renderRulerElement.parentData as MultiChildLayoutParentData?;
    childParentData!.offset = _layoutRulerOffset(_renderRulerElement);
  }

  Offset _layoutRulerLabelOffset(RenderRulerLabel label) {
    List<Offset> value = _linearGaugeLabel.primaryRulers.values.first;
    List<Offset> lastValue = _linearGaugeLabel.primaryRulers.values.last;
    double effectiveLabelWidth, effectiveLabelHeight;
    if (getInversedRulers) {
      List<Offset> temp = value;
      value = lastValue;
      lastValue = temp;
      effectiveLabelWidth = _linearGaugeLabel.startLabelSize.width / 1.5;
    } else {
      effectiveLabelWidth = _linearGaugeLabel.startLabelSize.width;
    }
    effectiveLabelHeight = _linearGaugeLabel.startLabelSize.height;

    double? y;
    double? x;
    switch (rulerPosition) {
      case RulerPosition.top:
        y = -(value[1].dy +
            getLabelOffset +
            effectiveLabelHeight +
            getRulersOffset -
            yAxisForGaugeContainer);

        x = value[1].dx - effectiveLabelWidth;
        break;
      case RulerPosition.center:
        if (getGaugeOrientation == GaugeOrientation.horizontal) {
          y = ((getThickness) / 2) +
              yAxisForGaugeContainer +
              value[1].dy / 2 +
              getLabelOffset;
          x = value[1].dx - effectiveLabelWidth;
        } else {
          y = lastValue[1].dy - effectiveLabelHeight / 2;
          x = getThickness / 2 +
              xAxisForGaugeContainer +
              lastValue[1].dx / 2 +
              getLabelOffset;
        }
        break;
      case RulerPosition.bottom:
        y = getThickness +
            getRulersOffset +
            yAxisForGaugeContainer +
            getLabelOffset +
            value[1].dy;
        x = value[1].dx - effectiveLabelWidth;

        break;
      case RulerPosition.right:
        y = lastValue[1].dy - effectiveLabelHeight / 2;
        x = getThickness +
            getRulersOffset +
            xAxisForGaugeContainer +
            value[1].dx +
            getLabelOffset;

        break;
      case RulerPosition.left:
        y = lastValue[1].dy - effectiveLabelHeight / 2;
        x = 0;

        break;
    }

    Offset a;

    a = Offset(x, y);

    return a;
  }

  positionRulerLabel() {
    final MultiChildLayoutParentData? childParentData =
        _renderRulerLabel?.parentData as MultiChildLayoutParentData?;
    childParentData!.offset = _layoutRulerLabelOffset(_renderRulerLabel!);
  }

  Offset _calculateOffsetForValueBar(RenderValueBar valueBar) {
    double start = gaugeStart;
    double end = gaugeEnd;
    // Start and End values of the Linear Gauge
    double startOffset, topOffset;

    //  width of the value bar in pixels based on the value
    // double valueBarWidth =
    //     ((valueBar.value - startValue) / (endValue - startValue)) *
    //         (end - 2 * getExtendLinearGauge);

    double totalValOffset = _getOffsetHeight(
        valueBar.position, getThickness, valueBar.offset, valueBar);

    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      double startValue = (!getInversedRulers) ? start : (start + end);

      if (!getFillExtend) {
        startValue = !getInversedRulers
            ? (startValue + getExtendLinearGauge)
            : (startValue - getExtendLinearGauge);
      }
      topOffset = totalValOffset;

      if (valueBar.position == ValueBarPosition.center) {
        topOffset = totalValOffset +
            (getThickness - valueBar.valueBarThickness) / 2 +
            yAxisForGaugeContainer;
      }
      startOffset = startValue;
    } else {
      double barTop = (!getInversedRulers) ? start + end : start;
      double barLeft = _getOffsetHeight(valueBar.position, getThickness,
          valueBar.offset, valueBar); // adjust left position as needed

      if (!getFillExtend) {
        barTop = !getInversedRulers
            ? (barTop - getExtendLinearGauge)
            : (barTop + getExtendLinearGauge);
      }
      startOffset = barLeft;

      if (valueBar.position == ValueBarPosition.center) {
        startOffset = barLeft +
            (getThickness - valueBar.valueBarThickness) / 2 +
            xAxisForGaugeContainer;
      }
      topOffset = barTop;
    }

    return Offset(startOffset, topOffset);
  }

  // Calculating Offset Height for Value Bar
  double _getOffsetHeight(ValueBarPosition position, double height,
      double valueBarOffset, RenderValueBar valueBar) {
    switch (position) {
      case ValueBarPosition.center:
        return 0.0;
      case ValueBarPosition.top:
        return (yAxisForGaugeContainer -
            valueBar.valueBarThickness -
            valueBar.offset);
      case ValueBarPosition.bottom:
        return height + valueBarOffset + yAxisForGaugeContainer;
      case ValueBarPosition.left:
        return xAxisForGaugeContainer - valueBarOffset;
      case ValueBarPosition.right:
        return height + valueBarOffset + xAxisForGaugeContainer;
      default:
        return 0;
    }
  }

  _setOffsetOfValueBar(RenderValueBar valueBar) {
    final MultiChildLayoutParentData? childParentData =
        valueBar.parentData as MultiChildLayoutParentData?;
    childParentData!.offset = _calculateOffsetForValueBar(valueBar);
  }

  positionValueBars() {
    if (_valueBarRenderObject.isNotEmpty) {
      for (var element in _valueBarRenderObject) {
        _setOffsetOfValueBar(element);
      }
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final bool isHit = super.defaultHitTestChildren(result, position: position);

    if (isHit && !restrictPointerChange) {
      final HitTestTarget child = result.path.last.target;
      if (child is RenderLinearGaugeShapePointer) {
        _movablePointer = child;
        _pointerType = child;
        if (!_movablePointer.isInteractive) {
          return false;
        }
        return true;
      } else if (child is RenderLinearGaugeWidgetPointer) {
        _movableWidget = child;
        _pointerType = child;
        if (!_movableWidget.isInteractive) {
          return false;
        }
        return true;
      }
    }

    return false;
  }

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));

    if (event is PointerDownEvent) {
      pointerType = event.kind;
      if (getGaugeOrientation == GaugeOrientation.horizontal) {
        _horizontalDrag.addPointer(event);
      } else {
        _verticalDrag.addPointer(event);
      }
      restrictPointerChange = true;
      restrictWidgetPointerChange = true;
    } else if (event is PointerUpEvent) {
      restrictPointerChange = true;
      restrictWidgetPointerChange = true;
    }

    super.handleEvent(event, entry);
  }

  Offset _calculateOffsetForCurve(RenderCurve curve) {
    List<Offset> value = _linearGaugeLabel.primaryRulers.values.first;
    List<Offset> lastValue = _linearGaugeLabel.primaryRulers.values.last;

    double startInPixel = valueToPixel(curve.start!);
    double endInPixel = valueToPixel(curve.end!);

    // if (getInversedRulers) {
    //   double temp = startInPixel;
    //   startInPixel = endInPixel;
    //   endInPixel = temp;
    // }

    double? y;
    double? x;
    switch (curve.curvePosition) {
      case CurvePosition.top:
        y = yAxisForGaugeContainer - topCurveMaxHeight!;
        x = value[1].dx + startInPixel;
        break;
      case CurvePosition.bottom:
        y = yAxisForGaugeContainer + getThickness;
        x = value[1].dx + startInPixel;

        break;
      case CurvePosition.right:
        y = lastValue[1].dy + endInPixel;

        x = getThickness + xAxisForGaugeContainer;

        break;
      case CurvePosition.left:
        y = lastValue[1].dy + endInPixel;
        x = xAxisForGaugeContainer - leftCurveMaxHeight!;

        break;
    }

    Offset a;
    if (rulerPosition == RulerPosition.top ||
        rulerPosition == RulerPosition.left) {
      a = Offset(x, y);
    } else {
      a = Offset(x, y);
    }

    return a;
  }

  _setOffsetForCurve(RenderCurve valueBar) {
    final MultiChildLayoutParentData? childParentData =
        valueBar.parentData as MultiChildLayoutParentData?;
    childParentData!.offset = _calculateOffsetForCurve(valueBar);
  }

  positionCurves() {
    if (_renderCurves.isNotEmpty) {
      for (var element in _renderCurves) {
        _setOffsetForCurve(element);
      }
    }
  }

  setCustomLabelStartEnd() {
    if (getCustomLabels!.isNotEmpty) {
      _start = getCustomLabels!.first.value!;
      _end = getCustomLabels!.last.value!;
    }
  }

  @override
  void performLayout() {
    setCustomLabelStartEnd();
    filterShapePointers(getPointers);

    //first layout the container & widget pointer bcz their calculations used in other children

    RenderBox? child = firstChild;
    layoutContainerAndWidgetPointer(child);
    size = computeDryLayout(constraints);

    RenderBox? childRef = firstChild;
    layoutOtherChildren(childRef, child);

    // setting offsets of the children

    positionRulers();
    if (showLabel) {
      positionRulerLabel();
    }
    positionValueBars();
    positionPointer();
    positionCurves();
  }

  void layoutOtherChildren(RenderBox? childRef, RenderBox? child) {
    while (childRef != null) {
      final childParentData = childRef.parentData as LinearGaugeParentData;
      RenderLinearGaugeContainer? containerRef;

      if (childRef.runtimeType == RenderLinearGaugeContainer) {
        containerRef = childRef as RenderLinearGaugeContainer;
        gaugeStart = containerRef.gaugeStart;
        gaugeEnd = containerRef.gaugeEnd;

        _linearGaugeLabel = containerRef.linearGaugeLabel;
        childParentData.offset =
            Offset(xAxisForGaugeContainer, yAxisForGaugeContainer);
      }
      childParentData.yAxisForGaugeContainer = yAxisForGaugeContainer;
      childParentData.xAxisForGaugeContainer = xAxisForGaugeContainer;
      childParentData.gaugeStart = gaugeStart;
      childParentData.gaugeEnd = gaugeEnd;
      childParentData.linearGaugeLabel = _linearGaugeLabel;
      if (child is! RenderLinearGaugeContainer ||
          child is! RenderLinearGaugeWidgetPointer) {
        childRef.layout(
            BoxConstraints.loose(
                Size(constraints.maxWidth, constraints.maxHeight)),
            parentUsesSize: true);
      }

      childRef = childParentData.nextSibling;
    }
  }

  layoutContainerAndWidgetPointer(RenderBox? child) {
    while (child != null) {
      final childParentData = child.parentData as LinearGaugeParentData;

      if (child is RenderLinearGaugeContainer ||
          child is RenderLinearGaugeWidgetPointer) {
        child.layout(
            BoxConstraints.loose(
                Size(constraints.maxWidth, constraints.maxHeight)),
            parentUsesSize: true);
      }

      child = childParentData.nextSibling;
    }
  }

  List<CustomCurve> getCustomCurveByPosition(
      List<CustomCurve> customCurveList, CurvePosition position) {
    List<CustomCurve> result = [];
    for (CustomCurve customCurve in customCurveList) {
      if (customCurve.curvePosition == position) {
        result.add(customCurve);
      }
    }
    return result;
  }

  List<Pointer> getPointersByPosition(
      List<Pointer> pointerList, PointerPosition position) {
    List<Pointer> result = [];
    for (Pointer pointer in pointerList) {
      if (pointer.pointerPosition == position) {
        result.add(pointer);
      }
    }
    return result;
  }

  List<RenderLinearGaugeWidgetPointer> getWidgetPointersByPosition(
      List<RenderLinearGaugeWidgetPointer> pointerList,
      PointerPosition position) {
    List<RenderLinearGaugeWidgetPointer> result = [];
    for (RenderLinearGaugeWidgetPointer pointer in pointerList) {
      if (pointer.pointerPosition == position) {
        result.add(pointer);
      }
    }
    return result;
  }

  List<ValueBar> getValueBarByPosition(
      List<ValueBar> valueBarList, ValueBarPosition position) {
    List<ValueBar> result = [];
    for (ValueBar valueBar in valueBarList) {
      if (valueBar.position == position) {
        result.add(valueBar);
      }
    }
    return result;
  }

  getLinearGaugeThickness() {
    List<Pointer> centerPointers = [],
        bottomPointers = [],
        topPointers = [],
        leftPointers = [],
        rightPointers = [];

    List<RenderLinearGaugeWidgetPointer> centerWidgetPointers = [],
        bottomWidgetPointers = [],
        topWidgetPointers = [],
        leftWidgetPointers = [],
        rightWidgetPointers = [];

    List<ValueBar> topValueBars = [],
        bottomValueBars = [],
        centerValueBar = [],
        leftValueBars = [],
        rightValueBars = [];

    double linearGaugeContainerThickness = getThickness;

    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      return layoutHorizontalGauge(
        topPointers,
        bottomPointers,
        centerPointers,
        linearGaugeContainerThickness,
        topValueBars,
        bottomValueBars,
        centerValueBar,
        topWidgetPointers,
        bottomWidgetPointers,
        centerWidgetPointers,
        // topCurves,
        // bottomCurves,
      );
    } else {
      return layoutVerticalGauge(
        rightPointers,
        leftPointers,
        centerPointers,
        linearGaugeContainerThickness,
        leftValueBars,
        rightValueBars,
        centerValueBar,
        leftWidgetPointers,
        rightWidgetPointers,
        centerWidgetPointers,
      );
    }
  }

  double layoutVerticalGauge(
    List<Pointer> rightPointers,
    List<Pointer> leftPointers,
    List<Pointer> centerPointers,
    double linearGaugeContainerThickness,
    List<ValueBar> leftValueBars,
    List<ValueBar> rightValueBars,
    List<ValueBar> centerValueBars,
    List<RenderLinearGaugeWidgetPointer> leftWidgetPointers,
    List<RenderLinearGaugeWidgetPointer> rightWidgetPointers,
    List<RenderLinearGaugeWidgetPointer> centerWidgetPointers,
  ) {
    double getEffectiveRulersWidth = getMaxRulerHeight();
    double labelThickness = getLabelWidth();
    double rulersOffset = getRulersOffset;
    double labelsOffset = getLabelOffset;
    _layoutRightPointers(rightPointers);
    _layoutLeftPointers(leftPointers);
    _layoutCenterPointers(centerPointers);
    _layoutLeftCurves(getCustomCurves!);
    _layoutRightCurves(getCustomCurves!);
    _initMaxWidthPointerFromRightAndCenter(linearGaugeContainerThickness);
    _initMaxWidthPointerFromLeftAndCenter(linearGaugeContainerThickness);
    _layoutLeftValueBar(leftValueBars);
    _layoutRightValueBar(rightValueBars);
    _layoutCenterValueBar(centerValueBars);
    _initMaxValueBarFromLeftAndCenter(linearGaugeContainerThickness);
    _initMaxValueBarFromRightAndCenter(linearGaugeContainerThickness);
    spacingForGauge = getEffectiveRulersWidth + rulersOffset;
    if (rulerPosition == RulerPosition.right) {
      xAxisForGaugeContainer = pointerMaxOfLeftAndCenter!;

      if (leftCurveMaxHeight! <= pointerMaxOfLeftAndCenter!) {
        leftCurveMaxHeight = 0;
      } else {
        xAxisForGaugeContainer = leftCurveMaxHeight!;
        pointerMaxOfLeftAndCenter = xAxisForGaugeContainer;
      }

      if (valueBarMaxOfLeftAndCenter! <= pointerMaxOfLeftAndCenter!) {
        valueBarMaxOfLeftAndCenter = 0;
      } else {
        xAxisForGaugeContainer = valueBarMaxOfLeftAndCenter!;
        pointerMaxOfLeftAndCenter = 0;
      }
      if (valueBarMaxOfRightAndCenter! <=
          pointerMaxOfRightAndCenter! + spacingForGauge) {
        valueBarMaxOfRightAndCenter = 0;
      } else {
        valueBarMaxOfRightAndCenter =
            valueBarMaxOfRightAndCenter! - spacingForGauge;
        pointerMaxOfRightAndCenter = 0;
      }

      if (rightCurveMaxHeight! <= spacingForGauge) {
        rightCurveMaxHeight = 0;
      } else {
        getEffectiveRulersWidth = rightCurveMaxHeight!;
        rulersOffset = 0;
      }
      if (pointerMaxOfRightAndCenter! <= spacingForGauge) {
        pointerMaxOfRightAndCenter = 0;
      } else {
        getEffectiveRulersWidth = 0;
        rulersOffset = 0;
      }
    } else if (rulerPosition == RulerPosition.left) {
      /// This statement add the ruler and label when pointer height is less
      /// ruler and label
      xAxisForGaugeContainer = spacingForGauge;
      if (valueBarMaxOfLeftAndCenter! <= pointerMaxOfLeftAndCenter!) {
        valueBarMaxOfLeftAndCenter = 0;
      } else {
        pointerMaxOfLeftAndCenter = valueBarMaxOfLeftAndCenter!;
        valueBarMaxOfLeftAndCenter = 0;
      }
      if (valueBarMaxOfRightAndCenter! <= pointerMaxOfRightAndCenter!) {
        valueBarMaxOfRightAndCenter = 0;
      } else {
        pointerMaxOfRightAndCenter = valueBarMaxOfRightAndCenter!;
        valueBarMaxOfRightAndCenter = 0;
      }

      if (pointerMaxOfLeftAndCenter! < spacingForGauge) {
        pointerMaxOfLeftAndCenter = 0;
      } else {
        xAxisForGaugeContainer = pointerMaxOfLeftAndCenter!;
        getEffectiveRulersWidth = 0;
        rulersOffset = 0;
      }
    } else if (rulerPosition == RulerPosition.center) {
      getEffectiveRulersWidth = getMaxRulerHeightForCenter();
      getEffectiveRulersWidth =
          getEffectiveRulersWidth > 0 ? getEffectiveRulersWidth : 0;
      xAxisForGaugeContainer = 0;
      rulersOffset = 0;

      double centerAdjustment = labelThickness + labelsOffset;

      if (valueBarMaxOfLeftAndCenter! <= pointerMaxOfLeftAndCenter!) {
        valueBarMaxOfLeftAndCenter = 0;
      } else {
        pointerMaxOfLeftAndCenter = valueBarMaxOfLeftAndCenter;
        valueBarMaxOfLeftAndCenter = 0;
      }

      if (valueBarMaxOfRightAndCenter! <= pointerMaxOfRightAndCenter!) {
        valueBarMaxOfRightAndCenter = 0;
      } else {
        pointerMaxOfRightAndCenter = valueBarMaxOfRightAndCenter;
        valueBarMaxOfRightAndCenter = 0;
      }

      double leftEffectiveRulerWidth = getEffectiveRulersWidth / 2;

      if (pointerMaxOfLeftAndCenter! <= leftEffectiveRulerWidth) {
        xAxisForGaugeContainer = leftEffectiveRulerWidth;
        pointerMaxOfLeftAndCenter = 0;
      } else {
        xAxisForGaugeContainer = pointerMaxOfLeftAndCenter!;
        leftEffectiveRulerWidth = 0;
      }

      double rightEffectiveRulerWidth = getEffectiveRulersWidth / 2;

      if (getEffectiveRulersWidth == 0) {
        rightEffectiveRulerWidth =
            (getPrimaryRulersHeight / 2 + centerAdjustment) - getThickness / 2;
        rightEffectiveRulerWidth =
            (rightEffectiveRulerWidth > 0) ? rightEffectiveRulerWidth : 0;
      } else {
        if (getPrimaryRulersHeight - getThickness == getEffectiveRulersWidth) {
          rightEffectiveRulerWidth =
              getEffectiveRulersWidth / 2 + centerAdjustment;
        } else if (((getPrimaryRulersHeight / 2 + centerAdjustment) -
                getThickness / 2) >
            getEffectiveRulersWidth / 2) {
          rightEffectiveRulerWidth =
              (getPrimaryRulersHeight / 2 + centerAdjustment) -
                  getThickness / 2;
        }
      }

      if (pointerMaxOfRightAndCenter! <= rightEffectiveRulerWidth) {
        pointerMaxOfRightAndCenter = 0;
      } else {
        rightEffectiveRulerWidth = 0;
      }

      getEffectiveRulersWidth =
          leftEffectiveRulerWidth + rightEffectiveRulerWidth;
    }
    return getEffectiveRulersWidth +
        pointerMaxOfLeftAndCenter! +
        pointerMaxOfRightAndCenter! +
        valueBarMaxOfLeftAndCenter! +
        valueBarMaxOfRightAndCenter! +
        getThickness +
        rulersOffset;
  }

  double layoutHorizontalGauge(
    List<Pointer> topPointers,
    List<Pointer> bottomPointers,
    List<Pointer> centerPointers,
    double linearGaugeContainerThickness,
    List<ValueBar> topValueBars,
    List<ValueBar> bottomValueBars,
    List<ValueBar> centerValueBars,
    List<RenderLinearGaugeWidgetPointer> topWidgetPointers,
    List<RenderLinearGaugeWidgetPointer> bottomWidgetPointers,
    List<RenderLinearGaugeWidgetPointer> centerWidgetPointers,
    // List<CustomCurve> topCurves,
    // List<CustomCurve> bottomCurves,
  ) {
    double getEffectiveRulersHeight = getMaxRulerHeight();
    double labelThickness = getLabelHeight();
    double rulersOffset = getRulersOffset;
    double labelsOffset = getLabelOffset;
    _layoutTopPointers(topPointers);
    _layoutBottomPointers(bottomPointers);
    _layoutTopCurves(getCustomCurves!);
    _layoutBottomCurves(getCustomCurves!);
    _layoutCenterPointers(centerPointers);
    _initMaxHeightPointerFromTopAndCenter(linearGaugeContainerThickness);
    _initMaxHeightPointerFromBottomAndCenter(linearGaugeContainerThickness);
    _layoutTopValueBar(topValueBars);
    _layoutBottomValueBar(bottomValueBars);
    _layoutCenterValueBar(centerValueBars);
    _initMaxValueBarFromTopAndCenter(linearGaugeContainerThickness);
    _initMaxValueBarFromBottomAndCenter(linearGaugeContainerThickness);

    spacingForGauge = getEffectiveRulersHeight + rulersOffset;
    if (rulerPosition == RulerPosition.top) {
      /// This statement add the ruler and label when pointer height is less
      /// ruler and label
      yAxisForGaugeContainer = spacingForGauge;

      if (topCurveMaxHeight! <= pointerMaxOfTopAndCenter!) {
        topCurveMaxHeight = 0;
      } else {
        pointerMaxOfTopAndCenter = topCurveMaxHeight!;
        valueBarMaxOfTopAndCenter = 0;
      }

      if (valueBarMaxOfTopAndCenter! <= pointerMaxOfTopAndCenter!) {
        valueBarMaxOfTopAndCenter = 0;
      } else {
        pointerMaxOfTopAndCenter = valueBarMaxOfTopAndCenter!;
        valueBarMaxOfTopAndCenter = 0;
      }

      if (bottomCurveMaxHeight! <= pointerMaxOfBottomAndCenter!) {
        bottomCurveMaxHeight = 0;
      } else {
        pointerMaxOfBottomAndCenter = bottomCurveMaxHeight!;
        valueBarMaxOfBottomAndCenter = 0;
      }

      if (valueBarMaxOfBottomAndCenter! <= pointerMaxOfBottomAndCenter!) {
        valueBarMaxOfBottomAndCenter = 0;
      } else {
        pointerMaxOfBottomAndCenter = valueBarMaxOfBottomAndCenter!;
        valueBarMaxOfBottomAndCenter = 0;
      }

      if (pointerMaxOfTopAndCenter! <= spacingForGauge) {
        pointerMaxOfTopAndCenter = 0;
      } else {
        yAxisForGaugeContainer = pointerMaxOfTopAndCenter!;
        getEffectiveRulersHeight = 0;
        rulersOffset = 0;
      }
    } else if (rulerPosition == RulerPosition.bottom) {
      yAxisForGaugeContainer = pointerMaxOfTopAndCenter!;

      if (topCurveMaxHeight! <= pointerMaxOfTopAndCenter!) {
        topCurveMaxHeight = 0;
      } else {
        yAxisForGaugeContainer = topCurveMaxHeight!;
        pointerMaxOfTopAndCenter = yAxisForGaugeContainer;
      }
      if (valueBarMaxOfTopAndCenter! <= pointerMaxOfTopAndCenter!) {
        valueBarMaxOfTopAndCenter = 0;
      } else {
        yAxisForGaugeContainer = valueBarMaxOfTopAndCenter!;
        pointerMaxOfTopAndCenter = 0;
      }

      if (valueBarMaxOfBottomAndCenter! <=
          pointerMaxOfBottomAndCenter! + spacingForGauge) {
        valueBarMaxOfBottomAndCenter = 0;
      } else {
        valueBarMaxOfBottomAndCenter =
            valueBarMaxOfBottomAndCenter! - spacingForGauge;
        pointerMaxOfBottomAndCenter = 0;
      }
      if (bottomCurveMaxHeight! <=
          pointerMaxOfBottomAndCenter! + spacingForGauge) {
        bottomCurveMaxHeight = 0;
      } else {
        valueBarMaxOfBottomAndCenter = bottomCurveMaxHeight! - spacingForGauge;
        pointerMaxOfBottomAndCenter = 0;
      }

      if (pointerMaxOfBottomAndCenter! <= spacingForGauge) {
        pointerMaxOfBottomAndCenter = 0;
      } else {
        getEffectiveRulersHeight = 0;
        rulersOffset = 0;
      }
    } else if (rulerPosition == RulerPosition.center) {
      getEffectiveRulersHeight = getMaxRulerHeightForCenter();
      getEffectiveRulersHeight =
          getEffectiveRulersHeight > 0 ? getEffectiveRulersHeight : 0;
      yAxisForGaugeContainer = 0;
      rulersOffset = 0;

      double centerAdjustment = labelThickness + labelsOffset;

      if (valueBarMaxOfTopAndCenter! <= pointerMaxOfTopAndCenter!) {
        valueBarMaxOfTopAndCenter = 0;
      } else {
        pointerMaxOfTopAndCenter = valueBarMaxOfTopAndCenter;
        valueBarMaxOfTopAndCenter = 0;
      }

      if (valueBarMaxOfBottomAndCenter! <= pointerMaxOfBottomAndCenter!) {
        valueBarMaxOfBottomAndCenter = 0;
      } else {
        pointerMaxOfBottomAndCenter = valueBarMaxOfBottomAndCenter;
        valueBarMaxOfBottomAndCenter = 0;
      }

      double upperEffectiveRulerHeight = getEffectiveRulersHeight / 2;

      if (pointerMaxOfTopAndCenter! <= upperEffectiveRulerHeight) {
        yAxisForGaugeContainer = upperEffectiveRulerHeight;
        pointerMaxOfTopAndCenter = 0;
      } else {
        yAxisForGaugeContainer = pointerMaxOfTopAndCenter!;
        upperEffectiveRulerHeight = 0;
      }

      double bottomEffectiveRulerHeight = getEffectiveRulersHeight / 2;

      if (getEffectiveRulersHeight == 0) {
        bottomEffectiveRulerHeight =
            (getPrimaryRulersHeight / 2 + centerAdjustment) - getThickness / 2;
        bottomEffectiveRulerHeight =
            (bottomEffectiveRulerHeight > 0) ? bottomEffectiveRulerHeight : 0;
      } else {
        if (getPrimaryRulersHeight - getThickness == getEffectiveRulersHeight) {
          bottomEffectiveRulerHeight =
              getEffectiveRulersHeight / 2 + centerAdjustment;
        } else if (((getPrimaryRulersHeight / 2 + centerAdjustment) -
                getThickness / 2) >
            getEffectiveRulersHeight / 2) {
          bottomEffectiveRulerHeight =
              (getPrimaryRulersHeight / 2 + centerAdjustment) -
                  getThickness / 2;
        }
      }

      if (pointerMaxOfBottomAndCenter! <= bottomEffectiveRulerHeight) {
        pointerMaxOfBottomAndCenter = 0;
      } else {
        bottomEffectiveRulerHeight = 0;
      }

      getEffectiveRulersHeight =
          upperEffectiveRulerHeight + bottomEffectiveRulerHeight;
    }
    return getEffectiveRulersHeight +
        pointerMaxOfTopAndCenter! +
        pointerMaxOfBottomAndCenter! +
        getThickness +
        rulersOffset +
        valueBarMaxOfBottomAndCenter! +
        valueBarMaxOfTopAndCenter!;
  }

  double getMaxRulerHeight() {
    double effectiveSize = (getGaugeOrientation == GaugeOrientation.horizontal)
        ? getLabelHeight()
        : getLabelWidth();
    double getEffectiveRulersHeight = math.max(
        getPrimaryRulersHeight + getLabelOffset + effectiveSize,
        getSecondaryRulersHeight);
    return getEffectiveRulersHeight;
  }

  double getMaxRulerHeightForCenter() {
    double getEffectiveRulersHeight = math.max(
        getPrimaryRulersHeight - getThickness,
        getSecondaryRulersHeight - getThickness);
    return getEffectiveRulersHeight;
  }

  double getMaxRulerWidth() {
    double getEffectiveRulersWidth =
        math.max(getPrimaryRulersWidth, getSecondaryRulersWidth);
    return getEffectiveRulersWidth;
  }

  double getLabelHeight() {
    double labelThickness = _linearGaugeLabel
        .getLabelSize(textStyle: getTextStyle, value: getStart.toString())
        .height;
    return labelThickness;
  }

  double getLabelWidth() {
    double labelThickness = _linearGaugeLabel
        .getLabelSize(textStyle: getTextStyle, value: getEnd.toString())
        .width;
    return labelThickness;
  }

  void _initMaxHeightPointerFromBottomAndCenter(
      double linearGaugeContainerThickness) {
    pointerMaxOfBottomAndCenter = math.max(
        math.max(bottomPointerHeight!, bottomWidgetPointerHeight!),
        (math.max(centerPointerHeight! / 2, centerWidgetPointerHeight! / 2) -
            (linearGaugeContainerThickness / 2)));
  }

  void _initMaxWidthPointerFromLeftAndCenter(
      double linearGaugeContainerThickness) {
    pointerMaxOfLeftAndCenter = math.max(
        math.max(leftPointerHeight!, leftWidgetPointerHeight!),
        (math.max(centerPointerHeight! / 2, centerWidgetPointerHeight! / 2) -
            (linearGaugeContainerThickness / 2)));
  }

  void _initMaxHeightPointerFromTopAndCenter(
      double linearGaugeContainerThickness) {
    pointerMaxOfTopAndCenter = math.max(
        math.max(topPointerHeight!, topWidgetPointerHeight!),
        (math.max(centerPointerHeight! / 2, centerWidgetPointerHeight! / 2) -
            (linearGaugeContainerThickness / 2)));
  }

  void _initMaxValueBarFromTopAndCenter(double linearGaugeContainerThickness) {
    valueBarMaxOfTopAndCenter = math.max((topValueBarOffset!),
        ((centerValueBarOffset! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxValueBarFromBottomAndCenter(
      double linearGaugeContainerThickness) {
    valueBarMaxOfBottomAndCenter = math.max((bottomValueBarOffset!),
        ((centerValueBarOffset! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxValueBarFromLeftAndCenter(double linearGaugeContainerThickness) {
    valueBarMaxOfLeftAndCenter = math.max((leftValueBarOffset!),
        ((centerValueBarOffset! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxValueBarFromRightAndCenter(
      double linearGaugeContainerThickness) {
    valueBarMaxOfRightAndCenter = math.max((rightValueBarOffset!),
        ((centerValueBarOffset! / 2) - (linearGaugeContainerThickness / 2)));
  }

  void _initMaxWidthPointerFromRightAndCenter(
      double linearGaugeContainerThickness) {
    pointerMaxOfRightAndCenter = math.max(
        math.max(rightPointerHeight!, rightWidgetPointerHeight!),
        (math.max(centerPointerHeight! / 2, centerWidgetPointerHeight! / 2) -
            (linearGaugeContainerThickness / 2)));
  }

  void _layoutCenterPointers(List<Pointer> centerPointers) {
    centerPointers =
        getPointersByPosition(filteredShapePointers, PointerPosition.center);

    List<RenderLinearGaugeWidgetPointer> centerWidgetPointers =
        getWidgetPointersByPosition(_widgetPointers, PointerPosition.center);

    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      centerPointerHeight = centerPointers.isNotEmpty
          ? getLargestPointerForLayout(centerPointers)?.height ?? 0
          : 0;
      centerWidgetPointerHeight = centerWidgetPointers.isNotEmpty
          ? getLargestWidgetPointerForLayout(centerWidgetPointers)
                  ?.size
                  .height ??
              0
          : 0;
    } else {
      if (centerPointers.isNotEmpty) {
        var lPointer = getLargestPointerForLayout(centerPointers);
        if (lPointer?.shape == PointerShape.rectangle ||
            lPointer?.shape == PointerShape.diamond) {
          centerPointerHeight = lPointer?.width;
        } else {
          centerPointerHeight = lPointer?.height;
        }
      } else {
        centerPointerHeight = 0;
      }
      if (centerWidgetPointers.isNotEmpty) {
        var lPointer = getLargestWidgetPointerForLayout(centerWidgetPointers);

        centerWidgetPointerHeight = lPointer?.size.width;
      } else {
        centerWidgetPointerHeight = 0;
      }
    }
  }

  void _layoutBottomPointers(List<Pointer> bottomPointers) {
    bottomPointers =
        getPointersByPosition(filteredShapePointers, PointerPosition.bottom);
    bottomPointerHeight = bottomPointers.isNotEmpty
        ? getLargestPointerForLayout(bottomPointers)?.height ?? 0
        : 0;

    List<RenderLinearGaugeWidgetPointer> bottomWidgetPointers =
        getWidgetPointersByPosition(_widgetPointers, PointerPosition.bottom);
    bottomWidgetPointerHeight = bottomWidgetPointers.isNotEmpty
        ? getLargestWidgetPointerForLayout(bottomWidgetPointers)?.size.height ??
            0
        : 0;
  }

  void _layoutLeftPointers(List<Pointer> leftPointers) {
    leftPointers =
        getPointersByPosition(filteredShapePointers, PointerPosition.left);
    if (leftPointers.isNotEmpty) {
      var lPointer = getLargestPointerForLayout(leftPointers);
      if (lPointer?.shape == PointerShape.rectangle ||
          lPointer?.shape == PointerShape.diamond) {
        leftPointerHeight = lPointer?.width;
      } else {
        leftPointerHeight = lPointer?.height;
      }
    } else {
      leftPointerHeight = 0;
    }

    List<RenderLinearGaugeWidgetPointer> leftWidgetPointers =
        getWidgetPointersByPosition(_widgetPointers, PointerPosition.left);
    if (leftWidgetPointers.isNotEmpty) {
      var lWidgetPointer = getLargestWidgetPointerForLayout(leftWidgetPointers);

      leftWidgetPointerHeight = lWidgetPointer?.size.width;
    } else {
      leftWidgetPointerHeight = 0;
    }
  }

  List<CustomCurve> getCurvesByPosition(
      List<CustomCurve> curveList, CurvePosition position) {
    List<CustomCurve> result = [];
    for (CustomCurve curve in curveList) {
      if (curve.curvePosition == position) {
        result.add(curve);
      }
    }
    return result;
  }

  double? getLargestCurveForLayout(
    List<CustomCurve>? curve,
    CurvePosition position,
  ) {
    double greatestHeight = 0;

    for (CustomCurve customCurve in curve!) {
      double currentGreatestHeight = customCurve.startHeight!;
      if (customCurve.midHeight! > currentGreatestHeight) {
        currentGreatestHeight = customCurve.midHeight!;
      }
      if (customCurve.endHeight! > currentGreatestHeight) {
        currentGreatestHeight = customCurve.endHeight!;
      }

      if (currentGreatestHeight > greatestHeight) {
        greatestHeight = currentGreatestHeight;
      }
    }

    return greatestHeight;
  }

  void _layoutTopCurves(List<CustomCurve> topCurves) {
    topCurves = getCurvesByPosition(getCustomCurves!, CurvePosition.top);
    topCurveMaxHeight = topCurves.isNotEmpty
        ? getLargestCurveForLayout(topCurves, CurvePosition.top)
        : 0;
  }

  void _layoutBottomCurves(List<CustomCurve> bottomCurves) {
    bottomCurves = getCurvesByPosition(getCustomCurves!, CurvePosition.bottom);
    bottomCurveMaxHeight = bottomCurves.isNotEmpty
        ? getLargestCurveForLayout(bottomCurves, CurvePosition.bottom)
        : 0;
  }

  void _layoutLeftCurves(List<CustomCurve> leftCurves) {
    leftCurves = getCurvesByPosition(getCustomCurves!, CurvePosition.left);
    leftCurveMaxHeight = leftCurves.isNotEmpty
        ? getLargestCurveForLayout(leftCurves, CurvePosition.left)
        : 0;
  }

  void _layoutRightCurves(List<CustomCurve> rightCurves) {
    rightCurves = getCurvesByPosition(getCustomCurves!, CurvePosition.right);
    rightCurveMaxHeight = rightCurves.isNotEmpty
        ? getLargestCurveForLayout(rightCurves, CurvePosition.right)
        : 0;
  }

  void _layoutTopPointers(List<Pointer> topPointers) {
    topPointers =
        getPointersByPosition(filteredShapePointers, PointerPosition.top);
    topPointerHeight = topPointers.isNotEmpty
        ? getLargestPointerForLayout(topPointers)?.height ?? 0
        : 0;

    List<RenderLinearGaugeWidgetPointer> topWidgetPointers =
        getWidgetPointersByPosition(_widgetPointers, PointerPosition.top);
    topWidgetPointerHeight = (topWidgetPointers.isNotEmpty &&
            _widgetPointers.isNotEmpty)
        ? getLargestWidgetPointerForLayout(topWidgetPointers)?.size.height ?? 0
        : 0;
  }

  void _layoutRightPointers(List<Pointer> rightPointers) {
    rightPointers =
        getPointersByPosition(filteredShapePointers, PointerPosition.right);
    if (rightPointers.isNotEmpty) {
      var lPointer = getLargestPointerForLayout(rightPointers);
      if (lPointer?.shape == PointerShape.rectangle ||
          lPointer?.shape == PointerShape.diamond) {
        rightPointerHeight = lPointer?.width;
      } else {
        rightPointerHeight = lPointer?.height;
      }
    } else {
      rightPointerHeight = 0;
    }

    List<RenderLinearGaugeWidgetPointer> rightWidgetPointers =
        getWidgetPointersByPosition(_widgetPointers, PointerPosition.right);
    if (rightWidgetPointers.isNotEmpty) {
      var lWidgetPointer =
          getLargestWidgetPointerForLayout(rightWidgetPointers);

      rightWidgetPointerHeight = lWidgetPointer?.size.width;
    } else {
      rightWidgetPointerHeight = 0;
    }
  }

  void _layoutTopValueBar(List<ValueBar> topValueBars) {
    topValueBars = getValueBarByPosition(getValueBar, ValueBarPosition.top);
    if (topValueBars.isNotEmpty) {
      ValueBar? topLargestValueBar = getLargestValueBarForLayout(topValueBars);
      topValueBarOffset =
          topLargestValueBar!.valueBarThickness + topLargestValueBar.offset;
    } else {
      topValueBarOffset = 0;
    }
  }

  void _layoutBottomValueBar(List<ValueBar> bottomValueBars) {
    bottomValueBars =
        getValueBarByPosition(getValueBar, ValueBarPosition.bottom);
    if (bottomValueBars.isNotEmpty) {
      ValueBar? bottomLargestValueBar =
          getLargestValueBarForLayout(bottomValueBars);
      bottomValueBarOffset = bottomLargestValueBar!.valueBarThickness +
          bottomLargestValueBar.offset;
    } else {
      bottomValueBarOffset = 0;
    }
  }

  void _layoutCenterValueBar(List<ValueBar> centerValueBars) {
    centerValueBars =
        getValueBarByPosition(getValueBar, ValueBarPosition.center);
    if (centerValueBars.isNotEmpty) {
      ValueBar? centerLargestValueBar =
          getLargestValueBarForLayout(centerValueBars);
      centerValueBarOffset = centerLargestValueBar!.valueBarThickness;
    } else {
      centerValueBarOffset = 0;
    }
  }

  void _layoutLeftValueBar(List<ValueBar> leftValueBars) {
    leftValueBars = getValueBarByPosition(getValueBar, ValueBarPosition.left);
    if (leftValueBars.isNotEmpty) {
      ValueBar? leftLargestValueBar =
          getLargestValueBarForLayout(leftValueBars);
      leftValueBarOffset =
          leftLargestValueBar!.valueBarThickness + leftLargestValueBar.offset;
    } else {
      leftValueBarOffset = 0;
    }
  }

  void _layoutRightValueBar(List<ValueBar> rightValueBars) {
    rightValueBars = getValueBarByPosition(getValueBar, ValueBarPosition.right);
    if (rightValueBars.isNotEmpty) {
      ValueBar? rightLargestValueBar =
          getLargestValueBarForLayout(rightValueBars);
      rightValueBarOffset =
          rightLargestValueBar!.valueBarThickness + rightLargestValueBar.offset;
    } else {
      rightValueBarOffset = 0;
    }
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    double parentWidgetSize;
    final double actualParentWidth = constraints.maxWidth;
    final double actualParentHeight = constraints.maxHeight;

    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      parentWidgetSize = actualParentWidth;
    } else {
      parentWidgetSize = actualParentHeight;
    }
    final widgetThickness = getLinearGaugeThickness();
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      _axisActualSize = Size(parentWidgetSize, widgetThickness);
    } else {
      _axisActualSize = Size(widgetThickness, parentWidgetSize);
    }

    return constraints.constrain(_axisActualSize);
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! LinearGaugeParentData) {
      child.parentData = LinearGaugeParentData(xAxisForGaugeContainer,
          yAxisForGaugeContainer, gaugeStart, gaugeEnd, LinearGaugeLabel());
    }
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  double valueToPixel(double value) {
    final double pixel = ((value - getStart) / (getEnd - getStart)) * gaugeEnd;

    return pixel;
  }

  void filterShapePointers(List<BasePointer> pointers) {
    filteredShapePointers.clear();
    for (dynamic pointer in pointers) {
      if (pointer.runtimeType == Pointer) {
        filteredShapePointers.add(pointer as Pointer);
      }
    }
  }

  double _calculatePosition(Offset localPosition) {
    double totalWidth = (gaugeEnd) - (2 * getExtendLinearGauge);
    localPosition = Offset(localPosition.dx, localPosition.dy);

    double dx = localPosition.dx;
    double dy = localPosition.dy;

    var range = getEnd - getStart;

    double adjustedValue = getGaugeOrientation == GaugeOrientation.horizontal
        ? (dx - gaugeStart - ((getExtendLinearGauge))) / (totalWidth)
        : (dy - gaugeStart - (getExtendLinearGauge)) / (totalWidth);

    var value = (getStart + (adjustedValue * range));

    value = value.clamp(getStart, getEnd).toDouble();

    if (getGaugeOrientation == GaugeOrientation.vertical) {
      value = !getInversedRulers ? getEnd - (value - getStart) : value;
    } else {
      value = getInversedRulers ? getEnd - (value - getStart) : value;
    }

    return value;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    Offset localPosition = details.localPosition;
    double value = _calculatePosition(localPosition);

    if (_pointerType is RenderLinearGaugeWidgetPointer) {
      if (_movableWidget.isInteractive) {
        _movableWidget.onChanged!(value);
      }
    } else if (_pointerType is RenderLinearGaugeShapePointer) {
      if (_movablePointer.isInteractive) {
        _movablePointer.onChanged!(value);
      }
    }

    // if getGaugeOrientation == GaugeOrientation.horizontal) {

    // if (_movableWidget.isInteractive) {
    //   _movableWidget.onChanged!(value);
    // }

    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  void _handleDragStart(DragStartDetails details) {
    if (_pointerType is RenderLinearGaugeWidgetPointer) {
      _movableWidget.setIsInteractive = true;
    } else if (_pointerType is RenderLinearGaugeShapePointer) {
      _movablePointer.setIsInteractive = true;
    }
    markNeedsLayout();
    markNeedsSemanticsUpdate();
  }

  void _handleDragEnd(DragEndDetails details) {
    restrictPointerChange = false;
    restrictWidgetPointerChange = false;
    _horizontalDrag.dispose();
    _verticalDrag.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    _horizontalDrag.dispose();
    _verticalDrag.dispose();
  }
}

class LinearGaugeParentData extends MultiChildLayoutParentData {
  double xAxisForGaugeContainer;
  double yAxisForGaugeContainer;
  double gaugeStart;
  double gaugeEnd;
  LinearGaugeLabel linearGaugeLabel;
  LinearGaugeParentData(
      this.xAxisForGaugeContainer,
      this.yAxisForGaugeContainer,
      this.gaugeStart,
      this.gaugeEnd,
      this.linearGaugeLabel);
}

// class Temp implements MouseTrackerAnnotation {}
