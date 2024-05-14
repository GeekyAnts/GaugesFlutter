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
    // size = Size(_needleWidth + _tailRadius, _needleHeight);
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  late Path needlePointerRect;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    offset = Offset(size.width * getRadialGauge.xCenterCoordinate + offset.dx,
        size.height * getRadialGauge.yCenterCoordinate + offset.dy);
    final center = Offset(offset.dx + _needleWidth, offset.dy + _needleHeight);

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

    final maxH = size.shortestSide / (2 * getRadialGauge.radiusFactor) -
        (2 * getRadialGauge.track.thickness);

    final double needleMultiplier = _needleHeight.clamp(0, maxH);

    final double angle = startAngle + (value / 100) * (endAngle - startAngle);

    double needleEndX =
        center.dx + needleMultiplier * cos(angle) - _needleWidth;
    double needleEndY =
        center.dy + needleMultiplier * sin(angle) - _needleHeight;
    double needleStartX = center.dx - _needleWidth;
    double needleStartY = center.dy - _needleHeight;

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

//!
    Path path = Path()
      ..moveTo(needleStartX, needleStartY)
      ..lineTo(needleEndX, needleEndY);
    // ..addOval(
    //     Rect.fromCircle(center: Offset(needleEndX, needleEndY), radius: 10));
    canvas.drawPath(path, Paint()..color = Colors.orange);

    // Needle Path
    Path needlePath = Path();
    needlePath.moveTo(offset.dx + getTailRadius / 2 * cos(angle + pi / 2),
        offset.dy - getTailRadius / 2 * sin(angle - pi / 2));
    needlePath.lineTo(needleStartX + getTailRadius / 2 * cos(angle - pi / 2),
        needleStartY - (getTailRadius / 2) * sin(angle + pi / 2));

    double needleWidth = _needleWidth;
    needlePath.moveTo(offset.dx + needleWidth * cos(angle + pi / 2),
        offset.dy - needleWidth * sin(angle - pi / 2));
    needlePath.lineTo(needleStartX + needleWidth * cos(angle - pi / 2),
        needleStartY - (needleWidth) * sin(angle + pi / 2));

    needlePath.lineTo(needleEndX, needleEndY);

    needlePath.close();

    Path apath = Path()
      ..moveTo(needleStartX, needleStartY)
      ..lineTo(needleEndX, needleEndY)
      ..close();
    final pathMetrics = apath.computeMetrics();
    final hitTestWidth =
        _needleWidth; // adjust this to change the hit test area width

    final dx = needleEndX - needleStartX;
    final dy = needleEndY - needleStartY;

    final norm = sqrt(dx * dx + dy * dy);
    final perpX = -dy / norm * hitTestWidth / 2;
    final perpY = dx / norm * hitTestWidth / 2;

    final hitTestPath = Path()
      ..moveTo(needleStartX + perpX, needleStartY + perpY)
      ..lineTo(needleEndX + perpX, needleEndY + perpY)
      ..lineTo(needleEndX - perpX, needleEndY - perpY)
      ..lineTo(needleStartX - perpX, needleStartY - perpY)
      ..close();
    final widerPath = Path()
      ..addRect(Rect.fromPoints(
        Offset(needleStartX + cos(angle - pi / 2),
            needleStartY + sin(angle + pi / 2)),
        Offset(
            needleEndX + cos(angle - pi / 2), needleEndY + sin(angle + pi / 2)),
      ));

    needlePointerRect =
        _needleStyle == NeedleStyle.gaugeNeedle ? needlePath : widerPath;

    canvas.drawPath(hitTestPath, Paint()..color = Colors.black
        // ..strokeWidth = 10
        // ..shader
        );
    _needleStyle == NeedleStyle.gaugeNeedle ? print("A") : print("B");
    // canvas.drawPath(needlePath, Paint()..color = Colors.blue.withOpacity(0.3));
// Needle  Pointer paint
    if (getNeedleStyle == NeedleStyle.gaugeNeedle) {
      canvas.drawPath(needlePath, needlePaint);
      canvas.drawPath(circlePath, Paint()..color = _tailColor);
    } else {
      print('Came here');
      Path apath = Path()
        ..moveTo(needleStartX, needleStartY)
        ..lineTo(needleEndX, needleEndY)
        ..close();

      //  Simple Needle
      canvas.drawLine(Offset(needleStartX, needleStartY),
          Offset(needleEndX, needleEndY), needlePaint);
      canvas.drawPath(circlePath, Paint()..color = _tailColor);
      // canvas.drawPath(
      //     apath,
      //     Paint()
      //       ..color = Colors.green
      //       ..strokeWidth = 10
      //       ..shader
      //       ..strokeWidth = needleWidth
      //       ..style = PaintingStyle.stroke);
      // canvas.drawLine(Offset(needleStartX, needleStartY),
      // Offset(needleEndX, needleEndY), needlePaint);
      // canvas.drawPath(circlePath, Paint()..color = _tailColor);
    }
  }

  double calculateValueAngle(double value, double gaugeStart, double gaugeEnd) {
    double newValue = (value - gaugeStart) / (gaugeEnd - gaugeStart) * 100;

    return newValue;
  }
}

// @override
// void applyPaintTransform(RenderBox child, Matrix4 transform) {
//   if (child is RenderNeedlePointer) {
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;

//     transform.translate(centerX, centerY);
//     double value = calculateValueAngle(
//         child.getValue, getRadialGauge.track.start, getRadialGauge.track.end);
//     double startAngle = (getRadialGauge.track.startAngle - 180) * (pi / 180);
//     double endAngle = (getRadialGauge.track.endAngle - 180) * (pi / 180);
//     double angle = startAngle + (value / 100) * (endAngle - startAngle);
//     double toRotateAngle = angle - (pi / 2);
//     transform.rotateZ(toRotateAngle); // Specify the rotation in radians
//     transform.translate(
//         -centerX - child.getNeedleWidth / 2 - child.getTailRadius / 2,
//         -centerY - child.getNeedleHeight + child.getTailRadius / 2);

//     super.applyPaintTransform(child, transform);
//     markNeedsLayout();
//   }
// }
