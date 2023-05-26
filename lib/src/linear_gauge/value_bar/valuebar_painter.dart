import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../geekyants_flutter_gauges.dart';
import '../linear_gauge_painter.dart';

class RenderValueBar extends RenderBox {
  RenderValueBar({
    Key? key,
    required LinearGauge linearGauge,
    required double value,
    required double offset,
    required ValueBarPosition position,
    required Color color,
    required double valueBarThickness,
    required LinearEdgeStyle edgeStyle,
    required double borderRadius,
    required int animationDuration,
    required Curve animationType,
    required bool enableAnimation,
    required Animation<double> valueBarAnimation,
    LinearGradient? linearGradient,
  })  : _linearGauge = linearGauge,
        _value = value,
        _position = position,
        _color = color,
        _thickness = valueBarThickness,
        _borderRadius = borderRadius,
        _offset = offset,
        _edgeStyle = edgeStyle,
        _valueBarAnimation = valueBarAnimation,
        _enableAnimation = enableAnimation,
        _linearGradient = linearGradient;

  double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;
  late double gaugeEnd;

  late Size _axisActualSize;

  LinearGauge get linearGauge => _linearGauge;
  LinearGauge _linearGauge;
  set setLinearGAuge(LinearGauge linearGauge) {
    if (_linearGauge == linearGauge) {
      return;
    }
    _linearGauge = linearGauge;
    markNeedsPaint();
  }

  double get value => _value;
  double _value;
  set setValue(double val) {
    if (_value == val) {
      return;
    }
    _value = val;
    markNeedsPaint();
  }

  /// Gets the pointerPosition assigned to [RenderValueBar].
  ValueBarPosition get position => _position;
  ValueBarPosition _position;

  /// Sets the pointerPosition for [RenderValueBar].
  set setPosition(ValueBarPosition value) {
    if (value == _position) {
      return;
    }

    _position = value;
    markNeedsPaint();
  }

  /// Gets the linearGradient assigned to [RenderValueBar].
  LinearGradient? get linearGradient => _linearGradient;
  LinearGradient? _linearGradient;

  /// Sets the LinearGradient for [RenderValueBar].
  set setLinearGradient(LinearGradient? value) {
    if (value == _linearGradient) {
      return;
    }

    _linearGradient = value;
    markNeedsPaint();
  }

  /// Gets the color assigned to [RenderValueBar].
  Color get color => _color;
  Color _color;

  /// Sets the color for [RenderValueBar].
  set setColor(Color value) {
    if (value == _color) {
      return;
    }

    _color = value;
    markNeedsPaint();
  }

  /// Getter and Setter for the [_thickness] parameter.
  ///
  double get valueBarThickness => _thickness;
  double _thickness;
  set setThickness(double val) {
    if (_thickness == val) return;
    _thickness = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_offset] parameter.
  ///

  double get offset => _offset;
  double _offset;
  set setOffset(double val) {
    if (_offset == val) return;
    _offset = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_borderRadius] parameter.
  ///

  double get borderRadius => _borderRadius;
  double _borderRadius;
  set setBorderRadius(double val) {
    if (_borderRadius == val) return;
    _borderRadius = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_enableAnimation] parameter.
  ///

  bool get enableAnimation => _enableAnimation;
  bool _enableAnimation;
  set setEnableAnimation(bool val) {
    if (_enableAnimation == val) return;
    _enableAnimation = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_edgeStyle] parameter.
  ///

  LinearEdgeStyle get edgeStyle => _edgeStyle;
  LinearEdgeStyle _edgeStyle;
  set setEdgeStyle(LinearEdgeStyle val) {
    if (_edgeStyle == val) return;
    _edgeStyle = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [valueBarAnimation] parameter.
  ///
  Animation<double> get getValueBarAnimation => _valueBarAnimation;
  Animation<double> _valueBarAnimation;
  set setValueBarAnimation(Animation<double> val) {
    if (_valueBarAnimation == val) return;
    _valueBarAnimation = val;
    _removeAnimationListeners();
    _addAnimationListener();
    markNeedsLayout();
  }

  void _addAnimationListener() {
    _valueBarAnimation.addListener(markNeedsPaint);
  }

  void _removeAnimationListeners() {
    _valueBarAnimation.removeListener(markNeedsPaint);
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

  void drawValueBar(Canvas canvas, double start, double end, double totalWidth,
      LinearGauge linearGauge, Offset paintingOffset) {
    assert(value >= linearGauge.start! && value <= linearGauge.end!,
        'Value should be between start and end values');

    GaugeOrientation gaugeOrientation = linearGauge.gaugeOrientation!;
    double valueBarWidth = calculateValueBarWidth();

    double valueBarAnimationValue = getValueBarAnimation.value;

    valueBarWidth = (enableAnimation)
        ? valueBarWidth * valueBarAnimationValue
        : valueBarWidth;

    final Paint linearGaugeContainerPaint = Paint();
    linearGaugeContainerPaint.color = color;

    bool getInversedRulers = linearGauge.rulers!.inverseRulers!;
    // Drawing Value Bar
    final Rect gaugeContainer;

    if (gaugeOrientation == GaugeOrientation.horizontal) {
      if (linearGauge.fillExtend) {
        if (linearGauge.end == value) {
          valueBarWidth += 2 * linearGauge.extendLinearGauge!;
        } else {
          valueBarWidth += linearGauge.extendLinearGauge!;
        }
      }

      gaugeContainer = Rect.fromLTWH(
        paintingOffset.dx,
        paintingOffset.dy,
        !getInversedRulers ? valueBarWidth : -valueBarWidth,
        valueBarThickness,
      );
    } else {
      if (linearGauge.fillExtend) {
        if (linearGauge.end! == value) {
          valueBarWidth += 2 * linearGauge.extendLinearGauge!;
        } else {
          valueBarWidth += linearGauge.extendLinearGauge!;
        }
      }

      gaugeContainer = Rect.fromLTWH(
        paintingOffset.dx,
        paintingOffset.dy,
        (position == ValueBarPosition.left)
            ? -valueBarThickness
            : valueBarThickness, // set width to half of the gauge width
        !getInversedRulers ? -valueBarWidth : valueBarWidth,
      );
    }

    if (linearGradient != null) {
      linearGaugeContainerPaint.shader =
          linearGradient!.createShader(gaugeContainer);
    }

    if (borderRadius != 0) {
      var rectangularBox = _getRoundedContainer(
        gaugeContainer: gaugeContainer,
        linearGauge: linearGauge,
      );
      canvas.drawRRect(rectangularBox, linearGaugeContainerPaint);
    } else {
      canvas.drawRect(gaugeContainer, linearGaugeContainerPaint);
    }
  }

  double getLinearGaugeStart() {
    if (linearGauge.customLabels!.isNotEmpty) {
      return linearGauge.customLabels!.first.value!;
    }
    return linearGauge.start!;
  }

  double getLinearGaugeEnd() {
    if (linearGauge.customLabels!.isNotEmpty) {
      return linearGauge.customLabels!.last.value!;
    }
    return linearGauge.end!;
  }

  double calculateValueBarWidth() {
    // Start and End values of the Linear Gauge
    double endValue = getLinearGaugeEnd();
    double startValue = getLinearGaugeStart();

    //  width of the value bar in pixels based on the value
    double valueBarWidth = ((value - startValue) / (endValue - startValue)) *
        (gaugeEnd - 2 * linearGauge.extendLinearGauge!);

    return valueBarWidth;
  }

  RRect _getRoundedContainer({
    required Rect gaugeContainer,
    required var linearGauge,
  }) {
    GaugeOrientation gaugeOrientation = linearGauge.gaugeOrientation!;
    RRect rectangularBox;
    switch (edgeStyle) {
      case LinearEdgeStyle.startCurve:
        gaugeOrientation == GaugeOrientation.horizontal
            ? rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topLeft: Radius.circular(borderRadius),
                bottomLeft: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius)
                    : Radius.zero,
                topRight: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius),
              )
            : rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topRight: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius)
                    : Radius.zero,
                bottomLeft: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              );
        break;
      case LinearEdgeStyle.endCurve:
        gaugeOrientation == GaugeOrientation.horizontal
            ? rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topRight: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius)
                    : Radius.zero,
                bottomLeft: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              )
            : rectangularBox = RRect.fromRectAndCorners(
                gaugeContainer,
                topLeft: Radius.circular(borderRadius),
                bottomLeft: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.circular(borderRadius)
                    : Radius.zero,
                topRight: (linearGauge.gaugeOrientation! ==
                        GaugeOrientation.horizontal)
                    ? Radius.zero
                    : Radius.circular(borderRadius),
              );
        break;

      default:
        rectangularBox = RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(borderRadius),
        );
        break;
    }

    return rectangularBox;
  }

  @override
  void performLayout() {
    LinearGaugeParentData parentDataRef = parentData as LinearGaugeParentData;
    gaugeEnd = parentDataRef.gaugeEnd;

    final double valueBarWidth = calculateValueBarWidth();

    if (linearGauge.gaugeOrientation == GaugeOrientation.horizontal) {
      _axisActualSize = Size(valueBarWidth, valueBarThickness);
    } else {
      _axisActualSize = Size(valueBarThickness, valueBarWidth);
    }

    size = _axisActualSize;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    LinearGaugeParentData parentDataRef = parentData as LinearGaugeParentData;

    drawValueBar(canvas, parentDataRef.gaugeStart, parentDataRef.gaugeEnd,
        parentDataRef.gaugeEnd, linearGauge, offset);
  }
}
