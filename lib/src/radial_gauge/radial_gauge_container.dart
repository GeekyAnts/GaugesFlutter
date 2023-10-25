import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge.dart';
import 'package:geekyants_flutter_gauges/src/radial_gauge/radial_gauge_container_painter.dart';

class RadialGaugeContainer extends LeafRenderObjectWidget {
  const RadialGaugeContainer({
    Key? key,
    required this.radialGauge,
  }) : super(key: key);

  final RadialGauge radialGauge;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRadialGaugeContainer(
      radialGauge: radialGauge,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderRadialGaugeContainer renderObject) {
    renderObject.setRadialGauge = radialGauge;
  }
}
