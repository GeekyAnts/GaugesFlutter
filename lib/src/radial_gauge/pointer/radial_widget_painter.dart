import 'dart:math';
import 'package:flutter/rendering.dart';
import '../../../geekyants_flutter_gauges.dart';

class RenderRadialWidgetPointer extends RenderProxyBox {
  RenderRadialWidgetPointer({
    Key? key,
    required double value,
    required RadialGauge radialGauge,
    required bool isInteractive,
    required ValueChanged<double>? onChanged,
  })  : _value = value,
        _radialGauge = radialGauge,
        _isInteractive = isInteractive,
        _onChanged = onChanged;

  /// Gets the value to [RadialWidgetPointer].
  double get value => _value;
  double _value;

  /// Sets the value for [RadialWidgetPointer].
  set setValue(double value) {
    if (_value == value) {
      return;
    }
    _value = value;
    markNeedsPaint();
  }

  /// Sets  isInteractive for  [RadialWidgetPointer].
  set setIsInteractive(bool value) {
    if (value == _isInteractive) {
      return;
    }

    _isInteractive = value;
    markNeedsPaint();
  }

  RadialGauge get radialGauge => _radialGauge;
  RadialGauge _radialGauge;
  set setRadialGauge(RadialGauge value) {
    if (value == _radialGauge) {
      return;
    }

    _radialGauge = value;
    markNeedsPaint();
  }

  /// Gets  isInteractive for  [RadialWidgetPointer].
  bool get isInteractive => _isInteractive;
  bool _isInteractive;

  /// Gets and sets the onChanged assigned to [RadialWidgetPointer].
  ValueChanged<double>? get onChanged => _onChanged;
  ValueChanged<double>? _onChanged;
  set onChanged(ValueChanged<double>? value) {
    if (value == _onChanged) {
      return;
    }
    _onChanged = value;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    double gaugeStart = _radialGauge.track.start;
    double gaugeEnd = _radialGauge.track.end;

    // final center = Offset(offset.dx, offset.dy);
    final center = Offset(
        1440 * _radialGauge.xCenterCoordinate -
            2 * _radialGauge.track.thickness,
        900 * _radialGauge.yCenterCoordinate - _radialGauge.track.thickness);
    double value = calculateValueAngle(_value, gaugeStart, gaugeEnd);
    double startAngle = (_radialGauge.track.startAngle - 180) * (pi / 180);
    double endAngle = (_radialGauge.track.endAngle - 180) * (pi / 180);

    final double angle = startAngle + (value / 100) * (endAngle - startAngle);

    double circlePointerOffset =
        (900 / 2 - _radialGauge.track.thickness) * _radialGauge.radiusFactor;

    double circlePointerEndX = center.dx + circlePointerOffset * cos(angle);
    double circlePointerEndY = center.dy + circlePointerOffset * sin(angle);
    // canvas.drawCircle(Offset(circlePointerEndX, circlePointerEndY), 30,
    //     Paint()..color = Colors.red);
    super.paint(context, Offset(circlePointerEndX, circlePointerEndY));
  }

  double calculateValueAngle(double value, double gaugeStart, double gaugeEnd) {
    double newValue = (value - gaugeStart) / (gaugeEnd - gaugeStart) * 100;

    return newValue;
  }
}
