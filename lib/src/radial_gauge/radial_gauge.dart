import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/pointer/needle_pointer_painter.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_container.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_state.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/valuebar/radial_value_bar_painter.dart';

/// Creates a Radial Gauge Widget to display the values in a Radial Scale.
/// The widget can be customized using the properties available in [RadialGauge].
///
/// ```dart
/// RadialGauge(
///   track: [
///     RadialTrack(
///       start: 0,
///       end: 100,
///      ),
///    ],
/// ),
/// ```
class RadialGauge extends StatefulWidget {
  /// Creates a Radial Gauge Widget to display the values in a Radial Scale.
  /// The widget can be customized using the properties available in [RadialGauge].
  ///
  /// ```dart
  /// RadialGauge(
  ///   track: [
  ///     RadialTrack(
  ///       start: 0,
  ///       end: 100,
  ///      ),
  ///    ],
  /// ),
  /// ```
  const RadialGauge({
    Key? key,
    required this.track,
    this.valueBar,
    this.xCenterCoordinate = 0.5,
    this.yCenterCoordinate = 0.5,
    this.radiusFactor = 1,
    this.shapePointer = const [],
    this.needlePointer = const [],
    // List<RadialTrack>? track,
  }) : super(key: key);

  ///
  /// The x-coordinate of the center of the Radial Gauge.
  ///
  /// Defaults to 0.5.
  /// ```dart
  /// RadialGauge(
  ///   xCenterCoordinate: 0.5,
  ///   track: RadialTrack(
  ///    start: 0,
  ///    end: 100,
  ///  ),
  /// ),
  /// ```
  ///
  final double xCenterCoordinate;

  ///
  /// The y-coordinate of the center of the Radial Gauge.
  ///
  /// Defaults to 0.5.
  /// ```dart
  /// RadialGauge(
  ///  yCenterCoordinate: 0.5,
  ///  track: RadialTrack(
  ///   start: 0,
  ///  end: 100,
  ///   ),
  /// ),
  /// ```
  final double yCenterCoordinate;

  ///
  /// The radius factor of the Radial Gauge.
  /// The value ranges from 0 to 1.
  ///
  /// Defaults to 1.
  /// ```dart
  /// RadialGauge(
  /// radiusFactor: 0.8,
  ///    track: RadialTrack(
  ///          start: 0,
  ///          end: 100,
  ///       ),
  ///    ),
  /// ```
  ///
  final double radiusFactor;

  ///
  /// The list of [ShapePointers] to be displayed in the Radial Gauge.
  ///
  /// ```dart
  /// RadialGauge(
  ///        track: RadialTrack(
  ///          start: 0,
  ///          end: 100,
  ///        ),
  ///        shapePointer: [
  ///            RadialShapePointer(value: 10),
  ///        ],
  ///      ),
  /// ```
  ///
  final List<RadialShapePointer>? shapePointer;

  ///
  /// The list of [RadialTrack] to be displayed in the Radial Gauge.
  ///
  /// ```dart
  /// RadialGauge(
  ///  track: [
  ///   RadialTrack(
  ///    start: 0,
  ///   end: 100,
  ///   thickness: 10,
  ///   color: Colors.grey,
  ///  ),
  /// ],
  /// ),
  /// ```
  ///
  final RadialTrack track;

  ///
  /// The [NeedlePointer] is a Pointer that is  displayed  from the center in
  /// the Radial Gauge.
  ///
  /// ```dart
  /// RadialGauge(
  ///  needlePointer: NeedlePointer(
  ///     value: 10,
  ///    needleColor: Colors.red,
  ///     ),
  /// ),
  /// ```
  ///
  final List<NeedlePointer>? needlePointer;

  ///
  /// The [RadialValueBar] is used to display the value in the Radial Gauge.
  ///
  /// ```dart
  /// RadialGauge(
  ///   valueBar: RadialValueBar(
  ///     value: 10,
  ///    color: Colors.red,
  ///    ),
  /// ),
  /// ```
  ///
  final List<RadialValueBar>? valueBar;

  @override
  State<RadialGauge> createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  late List<Widget> _radialGaugeWidgets;

  @override
  void initState() {
    super.initState();
    _radialGaugeWidgets = <Widget>[];
  }

  @override
  void didUpdateWidget(RadialGauge oldWidget) {
    if (widget != oldWidget) {
      _radialGaugeWidgets = <Widget>[];
    }
    super.didUpdateWidget(oldWidget);
  }

  List<Widget> _buildChildWidgets(BuildContext context) {
    _radialGaugeWidgets.clear();

    _radialGaugeWidgets.add(RadialGaugeContainer(
      radialGauge: widget,
    ));

    if (widget.needlePointer != null) {
      for (int i = 0; i < widget.needlePointer!.length; i++) {
        _addChild(widget.needlePointer![i], null, null);
      }
    }
    if (widget.valueBar != null) {
      for (int i = 0; i < widget.valueBar!.length; i++) {
        _addChild(widget.valueBar![i], null, null);
      }
    }

    if (widget.shapePointer != null) {
      for (int i = 0; i < widget.shapePointer!.length; i++) {
        _addChild(widget.shapePointer![i], null, null);
      }
    }
    return _radialGaugeWidgets;
  }

  void _addChild(Widget child, Animation<double>? animation,
      AnimationController? controller) {
    _radialGaugeWidgets.add(RadialGaugeState(
      rGauge: widget,
      track: widget.track,
      child: child,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return RRadialGauge(
      rGauge: widget,
      children: _buildChildWidgets(context),
    );
  }
}

class RRadialGauge extends MultiChildRenderObjectWidget {
  // ignore: prefer_const_constructors_in_immutables
  RRadialGauge({
    Key? key,
    required this.rGauge,
    required List<Widget> children,
  }) : super(key: key, children: children);
  final RadialGauge rGauge;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRadialGauge(
      needlePointer: rGauge.needlePointer,
      xCenterCoordinate: rGauge.xCenterCoordinate,
      yCenterCoordinate: rGauge.yCenterCoordinate,
      valueBar: rGauge.valueBar,
      shapePointer: rGauge.shapePointer,
      radiusFactor: rGauge.radiusFactor,
      track: rGauge.track,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderRadialGauge renderObject) {
    renderObject
      ..setTrack = rGauge.track
      ..setValueBar = rGauge.valueBar
      ..setShapePointer = rGauge.shapePointer
      ..setXCenterCoordinate = rGauge.xCenterCoordinate
      ..setYCenterCoordinate = rGauge.yCenterCoordinate
      ..setNeedlePointer = rGauge.needlePointer!;
  }
}

class RenderRadialGauge extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData>,
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
        _yCenterCoordinate = yCenterCoordinate,
        super();

  double gaugeHeight = 0;
  double gaugeWidth = 0;
  double valueBarTopHeight = 0, valueBarWidth = 0;

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

  late double? extraH;
  @override
  void performLayout() {
    size = computeDryLayout(constraints);

    RenderBox? child = firstChild;

    while (child != null) {
      final MultiChildLayoutParentData childParentData =
          child.parentData as MultiChildLayoutParentData;

      if (child is RenderRadialValueBar) {
        childParentData.offset = Offset(
            size.width * xCenterCoordinate, size.height * yCenterCoordinate);

        extraH = (child.getRadialOffset);
        final childConstraints = BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        );
        child.layout(childConstraints, parentUsesSize: true);
      } else if (child is RenderRadialGaugeContainer) {
        childParentData.offset = Offset((size.width * xCenterCoordinate),
            (size.height * yCenterCoordinate));

        final childConstraints = BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        );

        child.layout(childConstraints, parentUsesSize: true);
      } else if (child is RenderNeedlePointer) {
        childParentData.offset = Offset(
            size.width * xCenterCoordinate, size.height * yCenterCoordinate);
        final childConstraints = BoxConstraints(
          maxWidth: size.shortestSide - getTrack.thickness,
          maxHeight: size.shortestSide - getTrack.thickness,
        );
        child.layout(childConstraints, parentUsesSize: true);
      } else if (child is RenderRadialShapePointer) {
        childParentData.offset = Offset(
            size.width * xCenterCoordinate, size.height * yCenterCoordinate);
        child.layout(constraints, parentUsesSize: true);
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
    if (child.parentData is! MultiChildLayoutParentData) {
      child.parentData = MultiChildLayoutParentData();
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final bool isHit = super.defaultHitTestChildren(result, position: position);
    return isHit;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
