import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../geekyants_flutter_gauges.dart';

class RenderNeedlePointer extends RenderBox {
  RenderNeedlePointer({
    Key? key,
    required double value,
    required Color color,
    required RadialGauge radialGauge,
    required ValueChanged<double>? onChanged,
    required double needleHeight,
    required double tailRadius,
    required double needleWidth,
    required NeedleStyle needleStyle,
    required bool isInteractive,
    required Color tailColor,
    required LinearGradient gradient,

    // required RadialTrack track,
  })  : _value = value,
        _color = color,
        _radialGauge = radialGauge,
        _gradient = gradient,
        _onChanged = onChanged,
        _needleHeight = needleHeight,
        _tailRadius = tailRadius,
        _tailColor = tailColor,
        _needleStyle = needleStyle,
        _isInteractive = isInteractive,
        _needleWidth = needleWidth,
        super();

  LinearGradient get getGradient => _gradient;
  LinearGradient _gradient;
  set setGradient(LinearGradient gradient) {
    if (_gradient == gradient) return;
    _gradient = gradient;
    markNeedsPaint();
    markNeedsLayout();
  }

  ValueChanged<double>? get onChanged => _onChanged;
  ValueChanged<double>? _onChanged;
  set onChanged(ValueChanged<double>? value) {
    if (value == _onChanged) {
      return;
    }
    _onChanged = value;
    markNeedsPaint();
    markNeedsLayout();
  }

  //getter and setter for value

  RadialGauge get getRadialGauge => _radialGauge!;
  RadialGauge? _radialGauge;
  set setRadialGauge(RadialGauge radialGauge) {
    if (_radialGauge == radialGauge) return;
    _radialGauge = radialGauge;
    markNeedsPaint();
    markNeedsLayout();
  }

  // Sets the Interaction for [RenderNeedlePointer].
  set setIsInteractive(bool value) {
    if (value == _isInteractive) {
      return;
    }

    _isInteractive = value;
    markNeedsPaint();
    markNeedsLayout();
  }

  // Gets the Interaction assigned to [RenderNeedlePointer].
  bool get isInteractive => _isInteractive;
  bool _isInteractive;

  NeedleStyle get getNeedleStyle => _needleStyle;
  NeedleStyle _needleStyle;
  set setNeedleStyle(NeedleStyle needleStyle) {
    if (_needleStyle == needleStyle) return;
    _needleStyle = needleStyle;
    markNeedsPaint();
    markNeedsLayout();
  }

  double get getValue => _value;
  double _value;
  set setValue(double value) {
    if (_value == value) return;
    _value = value;
    markNeedsPaint();
    markNeedsLayout();
  }

  double get getNeedleWidth => _needleWidth;
  double _needleWidth;
  set setNeedleWidth(double needleWidth) {
    if (_needleWidth == needleWidth) return;
    _needleWidth = needleWidth;
    markNeedsPaint();
    markNeedsLayout();
  }

  double get getTailRadius => _tailRadius;
  double _tailRadius;
  set setTailRadius(double tailRadius) {
    if (_tailRadius == tailRadius) return;
    _tailRadius = tailRadius;
    markNeedsPaint();
    markNeedsLayout();
  }

  double get getNeedleHeight => _needleHeight;
  double _needleHeight;
  set setNeedleHeight(double needleHeight) {
    if (_needleHeight == needleHeight) return;
    _needleHeight = needleHeight;
    markNeedsPaint();
    markNeedsLayout();
  }

  Color get getTailColor => _tailColor;
  Color _tailColor;
  set setTailColor(Color tailColor) {
    if (_tailColor == tailColor) return;
    _tailColor = tailColor;
    markNeedsPaint();
    markNeedsLayout();
  }

  Color get getColor => _color;
  Color _color;
  set setColor(Color color) {
    if (_color == color) return;
    _color = color;
    markNeedsPaint();
    markNeedsLayout();
  }

  @override
  bool hitTestSelf(Offset position) {
    Offset calulatedPosition = localToGlobal(position);
    if (needlePointerRect.contains(calulatedPosition)) {
      return true;
    } else if (needlePointerRect.contains(position)) {
      return true;
    } else {
      return false;
    }
    // Return false if the position is outside the needlePointerRect
  }

  @override
  void performLayout() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  late Path needlePointerRect;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final referencePoint =
        Offset(offset.dx + _needleWidth, offset.dy + _needleHeight);
    offset = Offset(size.width * getRadialGauge.xCenterCoordinate + offset.dx,
        size.height * getRadialGauge.yCenterCoordinate + offset.dy);

    Rect circle = Rect.fromLTWH(offset.dx - getTailRadius / 2,
        offset.dy - getTailRadius / 2, _tailRadius, _tailRadius);
    Path circlePath = Path()..addOval(circle);

    double strokeWidth = _needleWidth;

    LinearGradient gradient = _gradient;

    double gaugeStart = _radialGauge!.track.start;
    double gaugeEnd = _radialGauge!.track.end;

    double value = calculateValueAngle(_value, gaugeStart, gaugeEnd);
    double startAngle = (_radialGauge!.track.startAngle - 180) * (pi / 180);
    double endAngle = (_radialGauge!.track.endAngle - 180) * (pi / 180);

    /// Limit the size of the needle to the gauge size
    final maximumNeedleHeight =
        (size.shortestSide / 2) * (getRadialGauge.radiusFactor) -
            (getRadialGauge.track.thickness);
    final double needleHeightMultiplier =
        _needleHeight.clamp(0, maximumNeedleHeight);

    final double angle = startAngle + (value / 100) * (endAngle - startAngle);

    double needleEndX =
        referencePoint.dx + needleHeightMultiplier * cos(angle) - _needleWidth;
    double needleEndY =
        referencePoint.dy + needleHeightMultiplier * sin(angle) - _needleHeight;
    double needleStartX = referencePoint.dx - _needleWidth;
    double needleStartY = referencePoint.dy - _needleHeight;

    final needlePaint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(
        Rect.fromPoints(
          Offset(needleStartX, needleStartY),
          Offset(needleEndX, needleEndY),
        ),
      )
      ..strokeCap = StrokeCap.round;

    // Needle Path
    Path needlePath = Path();
    double needleWidth = _needleWidth;

    // Base
    needlePath.moveTo(offset.dx + getTailRadius / 2 * cos(angle + pi / 2),
        offset.dy - getTailRadius / 2 * sin(angle - pi / 2));
    needlePath.lineTo(needleStartX + getTailRadius / 2 * cos(angle - pi / 2),
        needleStartY - (getTailRadius / 2) * sin(angle + pi / 2));

    needlePath.moveTo(offset.dx + needleWidth * cos(angle + pi / 2),
        offset.dy - needleWidth * sin(angle - pi / 2));
    needlePath.lineTo(needleStartX + needleWidth * cos(angle - pi / 2),
        needleStartY - (needleWidth) * sin(angle + pi / 2));

    // Pointer
    needlePath.lineTo(needleEndX, needleEndY);
    needlePath.close();
    needlePointerRect = needlePath;

// Needle  Pointer paint
    if (getNeedleStyle == NeedleStyle.gaugeNeedle) {
      canvas.drawPath(needlePath, needlePaint);
      canvas.drawPath(circlePath, Paint()..color = _tailColor);
    } else {
      //  Simple Needle
      canvas.drawLine(Offset(needleStartX, needleStartY),
          Offset(needleEndX, needleEndY), needlePaint);
      canvas.drawPath(circlePath, Paint()..color = _tailColor);
    }
  }

  /// Calculate the value angle
  double calculateValueAngle(double value, double gaugeStart, double gaugeEnd) {
    double newValue = (value - gaugeStart) / (gaugeEnd - gaugeStart) * 100;

    return newValue;
  }
}
