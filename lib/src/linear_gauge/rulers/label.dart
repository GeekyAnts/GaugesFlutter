import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/rulers/label_painter.dart';

import '../../../geekyants_flutter_gauges.dart';

class RulerLabel extends LeafRenderObjectWidget {
  const RulerLabel({
    Key? key,
    required this.linearGauge,
    this.gaugeAnimation,
  }) : super(key: key);

  final LinearGauge linearGauge;
  final Animation<double>? gaugeAnimation;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRulerLabel(
        gaugeOrientation: linearGauge.gaugeOrientation!,
        gaugeAnimation: gaugeAnimation,
        labelOffset: linearGauge.rulers!.labelOffset!,
        rulersOffset: linearGauge.rulers!.rulersOffset!,
        rulerPosition: linearGauge.rulers!.rulerPosition!,
        showLabel: linearGauge.rulers!.showLabel!,
        inversedRulers: linearGauge.rulers!.inverseRulers!,
        rangeLinearGauge: linearGauge.rangeLinearGauge!,
        customLabel: linearGauge.customLabels!,
        textStyle: linearGauge.rulers!.textStyle!,
        primaryRulersHeight: linearGauge.rulers!.primaryRulersHeight!);
  }

  @override
  void updateRenderObject(BuildContext context, RenderRulerLabel renderObject) {
    renderObject
      ..setGaugeOrientation = linearGauge.gaugeOrientation!
      ..setGaugeAnimation = gaugeAnimation
      ..setPrimaryRulersHeight = linearGauge.rulers!.primaryRulersHeight!
      ..setLabelOffset = linearGauge.rulers!.labelOffset!
      ..setRulersOffset = linearGauge.rulers!.rulersOffset!
      ..setRulerPosition = linearGauge.rulers!.rulerPosition!
      ..setShowLabel = linearGauge.rulers!.showLabel!
      ..setInversedRulers = linearGauge.rulers!.inverseRulers!
      ..setRangeLinearGauge = linearGauge.rangeLinearGauge!
      ..setCustomLabels = linearGauge.customLabels!
      ..setTextStyle = linearGauge.rulers!.textStyle!;
  }
}
