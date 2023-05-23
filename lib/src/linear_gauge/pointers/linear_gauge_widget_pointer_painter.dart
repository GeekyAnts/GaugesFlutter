import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/gauge_container/linear_gauge_container.dart';

import '../../../geekyants_flutter_gauges.dart';
import '../linear_gauge_label.dart';

class RenderLinearGaugeWidgetPointer extends RenderProxyBox {
  RenderLinearGaugeWidgetPointer({
    Key? key,
    required double value,
    required PointerPosition pointerPosition,
    required PointerAlignment pointerAlignment,
    required int animationDuration,
    required Curve animationType,
    required bool enableAnimation,
    required Animation<double> pointerAnimation,
    required ValueChanged<double>? onChanged,
    required bool isInteractive,
    required LinearGauge linearGauge,
  })  : _value = value,
        _pointerAlignment = pointerAlignment,
        _pointerPosition = pointerPosition,
        _onChanged = onChanged,
        _linearGauge = linearGauge,
        _isInteractive = isInteractive,
        _pointerAnimation = pointerAnimation,
        _enableAnimation = enableAnimation;

  double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;

  /// Gets the value to [RenderLinearGaugeWidgetPointer].
  double? get value => _value;
  double? _value;

  /// Sets the value for [RenderLinearGaugeWidgetPointer].
  set setValue(double? value) {
    if (value == _value) {
      return;
    }

    _value = value;
    markNeedsLayout();
  }

  /// Sets  isInteractive for  [RenderLinearGaugeWidgetPointer].
  set setIsInteractive(bool value) {
    if (value == _isInteractive) {
      return;
    }

    _isInteractive = value;
    markNeedsPaint();
  }

  /// Gets  isInteractive for  [RenderLinearGaugeWidgetPointer].
  bool get isInteractive => _isInteractive;
  bool _isInteractive;

  set setLinearGAuge(LinearGauge linearGauge) {
    if (_linearGauge == linearGauge) {
      return;
    }
    _linearGauge = linearGauge;
    markNeedsPaint();
  }

  /// Gets the orientation to [RenderLinearGaugeWidgetPointer].
  GaugeOrientation? get orientation => _orientation;
  GaugeOrientation? _orientation;

  /// Sets the orientation for [RenderLinearGaugeWidgetPointer].
  ///
  /// Default value is [GaugeOrientation.horizontal].
  set setOrientation(GaugeOrientation? value) {
    if (value == _orientation) {
      return;
    }

    _orientation = value;
    markNeedsLayout();
  }

  /// Gets the pointerPosition assigned to [RenderLinearGaugeWidgetPointer].
  PointerPosition get pointerPosition => _pointerPosition;
  PointerPosition _pointerPosition;

  /// Sets the pointerPosition for [RenderLinearGaugeWidgetPointer].
  set setPointerPosition(PointerPosition value) {
    if (value == _pointerPosition) {
      return;
    }

    _pointerPosition = value;
    markNeedsPaint();
  }

  /// Gets the pointerAlignment assigned to [RenderLinearGaugeWidgetPointer].
  PointerAlignment get pointerAlignment => _pointerAlignment;
  PointerAlignment _pointerAlignment;

  /// Sets the pointerAlignment for [RenderLinearGaugeWidgetPointer].
  set setPointerAlignment(PointerAlignment value) {
    if (value == _pointerAlignment) {
      return;
    }

    _pointerAlignment = value;
    markNeedsPaint();
  }

  /// Gets and sets the onChanged assigned to [RenderLinearPointerBase].
  ValueChanged<double>? get onChanged => _onChanged;
  ValueChanged<double>? _onChanged;
  set onChanged(ValueChanged<double>? value) {
    if (value == _onChanged) {
      return;
    }
    _onChanged = value;
  }

  /// Gets the pointerAlignment assigned to [RenderLinearGaugeWidgetPointer].
  bool get enableAnimation => _enableAnimation;
  bool _enableAnimation;

  LinearGauge get linearGauge => _linearGauge;
  LinearGauge _linearGauge;

  /// Sets the pointerAlignment for [RenderLinearGaugeWidgetPointer].
  set setEnableAnimation(bool value) {
    if (value == _enableAnimation) {
      return;
    }

    _enableAnimation = value;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [pointerAnimation] parameter.
  ///
  Animation<double> get getPointerAnimation => _pointerAnimation;
  Animation<double> _pointerAnimation;
  set setPointerAnimation(Animation<double> val) {
    if (_pointerAnimation == val) return;
    _pointerAnimation = val;
    _removeAnimationListeners();
    _addAnimationListener();
    markNeedsLayout();
  }

  double getLinearGaugeStart() {
    if (linearGauge.customLabels!.isNotEmpty) {
      return linearGauge.customLabels!.first.value!;
    }
    return linearGauge.start!;
  }

  void _addAnimationListener() {
    _pointerAnimation.addListener(markNeedsPaint);
  }

  void _removeAnimationListeners() {
    _pointerAnimation.removeListener(markNeedsPaint);
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

  /// Method to draw the pointer on the canvas based on the pointer shape
  void drawPointer(Canvas canvas, Offset offset, LinearGauge linearGauge,
      PaintingContext context) {
    if (linearGauge.gaugeOrientation == GaugeOrientation.horizontal) {
      if (pointerPosition != PointerPosition.bottom &&
          pointerPosition != PointerPosition.center &&
          pointerPosition != PointerPosition.top) {
        throw ArgumentError(
            'Invalid pointer position: $pointerPosition. For a horizontal gauge, pointer should be positioned at top, bottom, or center.');
      }
    } else {
      if (pointerPosition != PointerPosition.left &&
          pointerPosition != PointerPosition.center &&
          pointerPosition != PointerPosition.right) {
        throw ArgumentError(
            'Invalid pointer position: $pointerPosition. For a vertical gauge, pointer should be positioned at left, right, or center.');
      }
    }

    _layoutChildWidget(canvas, offset, linearGauge, context);
  }

  Offset applyAnimations(LinearGauge linearGauge, Offset offset) {
    if (enableAnimation && getPointerAnimation.value > 0) {
      double animationValue = getPointerAnimation.value;

      double endPoint =
          (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
              ? offset.dx
              : offset.dy;

      double animatedAxisPoint =
          getAnimatedAxisPoint(endPoint, animationValue, linearGauge);
      offset = (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
          ? Offset(animatedAxisPoint, offset.dy)
          : Offset(offset.dx, animatedAxisPoint);
    }
    return offset;
  }

  double getAnimatedAxisPoint(
      double endPoint, double animationValue, LinearGauge linearGauge) {
    Offset startPointOffset =
        LinearGaugeLabel.primaryRulers[getLinearGaugeStart().toString()]!.first;
    double startPoint =
        (linearGauge.gaugeOrientation! == GaugeOrientation.horizontal)
            ? startPointOffset.dx
            : startPointOffset.dy;
    return startPoint + ((endPoint - startPoint) * animationValue);
  }

  _layoutChildWidget(Canvas canvas, Offset offset, LinearGauge linearGauge,
      PaintingContext context) {
    offset = applyAnimations(linearGauge, offset);
    super.paint(context, offset);
  }

  @override
  bool hitTestSelf(Offset position) {
    return true;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    if (getPointerAnimation.value > 0) {
      drawPointer(canvas, offset, linearGauge, context);
    }
  }
}
