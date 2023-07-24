import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/pointer/needle_pointer_painter.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/pointer/radial_shape_pointer_painter.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/pointer/radial_widget_painter.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_container_painter.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/valuebar/radial_value_bar_painter.dart';

import '../../geekyants_flutter_gauges.dart';

class RenderRadialGauge extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, RadialGaugeParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, RadialGaugeParentData>,
        DebugOverflowIndicatorMixin {
  RenderRadialGauge({
    Key? key,
    required RadialTrack track,
    required double radiusFactor,
    required double xCenterCoordinate,
    required double yCenterCoordinate,
    required List<NeedlePointer>? needlePointer,
    required List<RadialShapePointer>? shapePointer,
    required List<RadialValueBar>? valueBar,
  })  : _track = track,
        _needlePointer = needlePointer,
        _valueBar = valueBar,
        _xCenterCoordinate = xCenterCoordinate,
        _radiusFactor = radiusFactor,
        _shapePointer = shapePointer,
        _yCenterCoordinate = yCenterCoordinate {
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

  double gaugeHeight = 0;
  double gaugeWidth = 0;
  double valueBarTopHeight = 0, valueBarWidth = 0;

  /// Horizontal  Gesture Recognizer for the Radial Gauge.
  late HorizontalDragGestureRecognizer _horizontalDrag;

  /// Vertical Gesture Recognizer for the Radial Gauge.
  late VerticalDragGestureRecognizer _verticalDrag;

  List<RadialShapePointer>? get getShapePointer => _shapePointer;
  List<RadialShapePointer>? _shapePointer;

  set setShapePointer(List<RadialShapePointer>? shapePointer) {
    if (_shapePointer == shapePointer) return;
    _shapePointer = shapePointer;

    markNeedsPaint();
  }

  double get getRadiusFactor => _radiusFactor;
  double _radiusFactor;
  set setRadiusFactor(double radiusFactor) {
    if (_radiusFactor == radiusFactor) return;
    _radiusFactor = radiusFactor;
    markNeedsPaint();
  }

  double get xCenterCoordinate => _xCenterCoordinate;
  double _xCenterCoordinate;
  set setXCenterCoordinate(double xCenterCoordinate) {
    if (_xCenterCoordinate == xCenterCoordinate) return;
    _xCenterCoordinate = xCenterCoordinate;
    markNeedsPaint();
  }

  double get yCenterCoordinate => _yCenterCoordinate;
  double _yCenterCoordinate;
  set setYCenterCoordinate(double yCenterCoordinate) {
    if (_yCenterCoordinate == yCenterCoordinate) return;
    _yCenterCoordinate = yCenterCoordinate;
    markNeedsPaint();
  }

  RadialTrack get getTrack => _track;
  RadialTrack _track;
  set setTrack(RadialTrack track) {
    if (_track == track) return;
    _track = track;
    markNeedsPaint();
  }

  List<RadialValueBar> get getValueBar => _valueBar!;
  List<RadialValueBar>? _valueBar;
  set setValueBar(List<RadialValueBar>? valueBar) {
    if (_valueBar == valueBar) return;
    _valueBar = valueBar;
    markNeedsPaint();
  }

  List<NeedlePointer> get getNeedlePointer => _needlePointer!;
  List<NeedlePointer>? _needlePointer;
  set setNeedlePointer(List<NeedlePointer>? needlePointer) {
    if (_needlePointer == needlePointer) return;
    _needlePointer = needlePointer;
    markNeedsPaint();
  }

  late Offset centOffset;
  late double? extraH;
  late Offset center;
  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    Size s = size;

    RenderBox? child = firstChild;
    center =
        Offset(size.width * xCenterCoordinate, size.height * yCenterCoordinate);

    while (child != null) {
      final RadialGaugeParentData childParentData =
          child.parentData as RadialGaugeParentData;

      if (child is RenderRadialShapePointer) {
        childParentData.offset = const Offset(0, 0);
        centOffset = childParentData.offset;
        final childConstrainst = BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        );

        child.layout(childConstrainst, parentUsesSize: true);
      } else if (child is RenderRadialWidgetPointer) {
        childParentData.offset = const Offset(0, 0);
        final childConstrainst = BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        );
        child.layout(childConstrainst, parentUsesSize: true);
      } else if (child is RenderRadialGaugeContainer) {
        childParentData.offset = center;

        final childConstraints = BoxConstraints(
          maxWidth: s.width,
          maxHeight: s.height,
        );

        child.layout(childConstraints, parentUsesSize: true);
      } else if (child is RenderRadialValueBar) {
        childParentData.offset = center;

        extraH = (child.getRadialOffset);
        final childConstraints = BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        );
        child.layout(childConstraints, parentUsesSize: true);
      } else if (child is RenderNeedlePointer) {
        childParentData.offset = const Offset(0, 0);
        centOffset = childParentData.offset;
        final childConstraints = BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        );
        child.layout(childConstraints, parentUsesSize: true);
      } else {
        childParentData.offset =
            Offset(((size.width) / 2), ((size.height) / 2));
      }

      child = childParentData.nextSibling;
    }
  }

  late double kheight;
  late double kwidth;
  double kDefaultRadialGaugeSize = 350.0;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final double actualHeight = constraints.hasBoundedHeight
        ? constraints.maxHeight
        : kDefaultRadialGaugeSize;
    final double actualWidth = constraints.hasBoundedWidth
        ? constraints.maxWidth
        : kDefaultRadialGaugeSize;

    kheight = actualHeight;
    kwidth = actualWidth;

    Size s = Size(actualWidth, actualHeight);

    return constraints.constrain(s);
  }

  getRadialGaugeContainerSize() {
    Offset c = Offset(kheight / 2, kwidth / 2);

    final Rect rect =
        Rect.fromCenter(center: c, width: kwidth, height: kheight);

    return rect.size;
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! RadialGaugeParentData) {
      child.parentData = RadialGaugeParentData(
        center: Offset.zero,
        height: 500,
        width: 500,
      );
    }
  }

  late HitTestTarget _pointerType;
  late RenderNeedlePointer _movableWidget;
  late RenderRadialShapePointer _movableShapePointer;
  bool _restrictNeedlePointer = false;

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final bool isHit = super.defaultHitTestChildren(result, position: position);
    // HitTestTarget child = result.path.last.target;

    if (isHit && !_restrictNeedlePointer) {
      final HitTestTarget child = result.path.last.target;

      if (child is RenderNeedlePointer) {
        _pointerType = child;
        _movableWidget = child;
        if (!_movableWidget.isInteractive) {
          return false;
        }

        return true;
      } else if (child is RenderRadialShapePointer) {
        _pointerType = child;
        _movableShapePointer = child;
        if (!_movableShapePointer.isInteractive) {
          return false;
        }

        return true;
      }
      // }
    }
    // Calculate the bounds of the rendered shape

    return false;
  }

  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent) {
      _horizontalDrag.addPointer(event);
      _verticalDrag.addPointer(event);
      _restrictNeedlePointer = true;
    }
    super.handleEvent(event, entry);
  }

  // @override
  // void applyPaintTransform(RenderBox child, Matrix4 transform) {
  //   if (child is RenderNeedlePointer) {
  //     final centerX = size.width / 2;
  //     final centerY = size.height / 2;

  //     transform.translate(centerX, centerY);
  //     double value = calculateValueAngle(
  //         getNeedlePointer[0].value, getTrack.start, getTrack.end);
  //     double startAngle = (getTrack.startAngle) * (pi / 180);
  //     double endAngle = (getTrack.endAngle) * (pi / 180);
  //     double angle = startAngle + (value / 100) * (endAngle - startAngle);
  //     double toRotateAngle = angle - (pi / 2);
  //     transform.rotateZ(toRotateAngle); // Specify the rotation in radians
  //     transform.translate(
  //         -centerX - child.getNeedleWidth / 2 - child.getTailRadius / 2,
  //         -centerY - child.getNeedleHeight + child.getTailRadius / 2);

  //     super.applyPaintTransform(child, transform);
  //     markNeedsLayout();
  //     markNeedsCompositedLayerUpdate();
  //   }
  // }

  double calculateValueAngle(double value, double gaugeStart, double gaugeEnd) {
    double newValue = (value - gaugeStart) / (gaugeEnd - gaugeStart) * 100;

    return newValue;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final Offset localPosition = globalToLocal(details.globalPosition);
    final double angle = _getAngleFromOffset(localPosition);
    final double value = _getValueFromAngle(angle);

    if (value >= getTrack.start && value <= getTrack.end) {
      if (_pointerType is RenderNeedlePointer) {
        if (_movableWidget.isInteractive) {
          if (_movableWidget.onChanged != null) {
            _movableWidget.onChanged!(value);
          }
        }
      } else if (_pointerType is RenderRadialShapePointer) {
        if (_movableShapePointer.isInteractive) {
          if (_movableShapePointer.onChanged != null) {
            _movableShapePointer.onChanged!(value);
          }
        }
      }
    }

    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  _getAngleFromOffset(Offset offset) {
    final double centerX = size.width * xCenterCoordinate + centOffset.dx;
    final double centerY = size.height * yCenterCoordinate + centOffset.dy;

    final double dx = offset.dx - centerX;
    final double dy = offset.dy - centerY;
    final double angle = atan2(dy, dx);

    return (angle + pi);
  }

  _getValueFromAngle(double angle) {
    final double startAngle = (getTrack.startAngle) * (pi / 180);
    final double endAngle = (getTrack.endAngle) * (pi / 180);

    double normalizedAngle = (angle - startAngle) % (2 * pi);
    if (normalizedAngle < 0) {
      // normalizedAngle = 0;
      normalizedAngle += 2 * pi;
      // normalizedAngle += 2 * pi; // Make sure the angle is positive
    }

    final double value = (normalizedAngle /
            (endAngle - startAngle) *
            (getTrack.end - getTrack.start)) +
        getTrack.start;
    return value;
  }

  void _handleDragStart(DragStartDetails details) {
    if (_pointerType is RenderNeedlePointer) {
      _movableWidget.setIsInteractive = true;
    } else if (_pointerType is RenderRadialShapePointer) {
      _movableShapePointer.setIsInteractive = true;
    }
    markNeedsLayout();
    markNeedsSemanticsUpdate();
  }

  void _handleDragEnd(DragEndDetails details) {
    _restrictNeedlePointer = false;

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

class RadialGaugeParentData extends MultiChildLayoutParentData {
  Offset center;
  double width;
  double height;

  RadialGaugeParentData({
    required this.center,
    required this.width,
    required this.height,
  });
}
