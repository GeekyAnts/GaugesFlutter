import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_container.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_painter.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_state.dart';

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
    this.widgetPointer = const [],
    this.strokeCap = StrokeCap.round,
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
  /// The list of [RadialWidgetPointer] to be displayed in the Radial Gauge.
  ///
  /// ```dart
  /// RadialGauge(
  ///     track: RadialTrack(
  ///          start: 0,
  ///          end: 100,
  ///       ),
  ///   widgetPointer: [
  ///   RadialWidgetPointer(value: 10, child: FlutterLogo()),
  ///   ],
  /// ),
  /// ```
  ///
  final List<RadialWidgetPointer>? widgetPointer;

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

  ///
  /// The stroke cap of the radial gauge container.
  ///
  /// Defaults to StrokeCap.round.
  ///
  final StrokeCap strokeCap;

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
    if (widget.widgetPointer != null) {
      for (int i = 0; i < widget.widgetPointer!.length; i++) {
        _addChild(widget.widgetPointer![i], null, null);
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
      ..setXCenterCoordinate = rGauge.xCenterCoordinate
      ..setYCenterCoordinate = rGauge.yCenterCoordinate
      ..setValueBar = rGauge.valueBar
      ..setShapePointer = rGauge.shapePointer
      ..setXCenterCoordinate = rGauge.xCenterCoordinate
      ..setYCenterCoordinate = rGauge.yCenterCoordinate
      ..setNeedlePointer = rGauge.needlePointer!;
  }
}
