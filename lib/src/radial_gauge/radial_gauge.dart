import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/pointer/needle_pointer.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_container.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_state.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_track.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/valuebar/radial_value_bar.dart';

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
  const RadialGauge({
    Key? key,
    required this.track,
    this.valueBar,
    this.needlePointer = const NeedlePointer(
      value: 0,
    ),
    // List<RadialTrack>? track,
  }) : super(key: key);

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
  final NeedlePointer? needlePointer;

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
  final RadialValueBar? valueBar;

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
      _addChild(widget.needlePointer!, null, null);
    }
    if (widget.valueBar != null) {
      _addChild(widget.valueBar!, null, null);
    }
    return _radialGaugeWidgets;
  }

  void _addChild(Widget child, Animation<double>? animation,
      AnimationController? controller) {
    _radialGaugeWidgets.add(
        RadialGaugeState(rGauge: widget, track: widget.track, child: child));
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
  final RadialGauge rGauge;
  RRadialGauge({
    Key? key,
    required this.rGauge,
    required List<Widget> children,
  }) : super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRadialGauge(
      needlePointer: rGauge.needlePointer,
      valueBar: rGauge.valueBar,
      track: rGauge.track,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderRadialGauge renderObject) {
    renderObject
      ..setTrack = rGauge.track
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
    required NeedlePointer? needlePointer,
    required RadialValueBar? valueBar,
  })  : _track = track,
        _needlePointer = needlePointer,
        super();

  RadialTrack get getTrack => _track;
  RadialTrack _track;
  set setTrack(RadialTrack track) {
    if (_track == track) return;
    _track = track;
    markNeedsPaint();
  }

  RadialValueBar get getValueBar => _valueBar!;
  RadialValueBar? _valueBar;
  set setValueBar(RadialValueBar valueBar) {
    if (_valueBar == valueBar) return;
    _valueBar = valueBar;
    markNeedsPaint();
  }

  NeedlePointer get getNeedlePointer => _needlePointer!;
  NeedlePointer? _needlePointer;
  set setNeedlePointer(NeedlePointer needlePointer) {
    if (_needlePointer == needlePointer) return;
    _needlePointer = needlePointer;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    RenderBox? child = firstChild;
    while (child != null) {
      final MultiChildLayoutParentData childParentData =
          child.parentData as MultiChildLayoutParentData;

      if (child is RenderRadialGaugeContainer) {
        childParentData.offset = Offset(size.width, size.height);
        print("RadialGaugeContainer ${childParentData.offset}");
        final childConstraints = BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        );
        child.layout(childConstraints, parentUsesSize: true);
      }

      if (child is RenderNeedlePointer) {
        childParentData.offset = Offset(
            size.width / 2 - (child.getTailRadius / 2),
            (size.height / 2) - (child.getTailRadius / 2));
        final childConstraints = BoxConstraints(
          maxWidth: child.getTailRadius,
          maxHeight: child.getTailRadius,
        );
        child.layout(childConstraints, parentUsesSize: true);
      } else if (child is RenderRadialValueBar) {
        childParentData.offset = Offset(size.width / 2, size.height / 2);
        final childConstraints = BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        );
        child.layout(childConstraints, parentUsesSize: true);
      } else {
        childParentData.offset = Offset.zero;
      }

      child = childParentData.nextSibling;
    }

    // if (children.contains(RenderNeedlePointer)) {
    //   print("NeedlePointer");
    // }
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final double actualWidth = constraints.maxWidth;
    final double actualHeight = constraints.maxHeight;

    return constraints.constrain(Size(actualWidth, actualHeight));
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! MultiChildLayoutParentData) {
      child.parentData = MultiChildLayoutParentData();
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return false;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
