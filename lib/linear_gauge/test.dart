import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LinearGaugeOne extends MultiChildRenderObjectWidget {
  final double? start;
  final double? end;

  LinearGaugeOne({
    Key? key,
    @required this.start,
    @required this.end,
    @required List<Widget>? children,
  }) : super(key: key, children: children ?? []);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderLinearGaugeOne(start: start!, end: end!);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLinearGaugeOne renderObject) {
    renderObject
      ..start = start!
      ..end = end!;
  }
}

class RenderLinearGaugeOne extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox,
            ContainerParentDataMixin<RenderBox>> {
  double _start;
  double _end;

  RenderLinearGaugeOne({
    double start = 0.0,
    double end = 100.0,
  })  : _start = start,
        _end = end;

  double get start => _start;

  set start(double value) {
    if (_start != value) {
      _start = value;
      markNeedsLayout();
    }
  }

  double get end => _end;

  set end(double value) {
    if (_end != value) {
      _end = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = constraints.maxWidth;
    //final desiredHeight = constraints.maxHeight;
    final desiredSize = Size(desiredWidth, 50);
    return constraints.constrain(desiredSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Paint the gauge using start and end parameters.
    print(end);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset? position}) {
    // Determine if the touch event hits a child element using start and end parameters.
    return false;
  }
}

class MyLGauge extends StatefulWidget {
  final List<Widget> children;
  final double start;
  final double end;
  const MyLGauge(
      {super.key, this.children = const [], this.end = 100, this.start = 0});

  @override
  State<MyLGauge> createState() => _MyLGaugeState();
}

class _MyLGaugeState extends State<MyLGauge> {
  @override
  Widget build(BuildContext context) {
    return LinearGaugeOne(
        start: widget.start, end: widget.end, children: widget.children);
  }
}
