import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/rulers/rulers_painter.dart';

import '../../../geekyants_flutter_gauges.dart';

class Rulers extends LeafRenderObjectWidget {
  const Rulers({
    Key? key,
    required this.linearGauge,
    this.gaugeAnimation,
  }) : super(key: key);

  final LinearGauge linearGauge;
  final Animation<double>? gaugeAnimation;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRulers(
      gaugeOrientation: linearGauge.gaugeOrientation!,
      gaugeAnimation: gaugeAnimation,
      primaryRulersWidth: linearGauge.rulers!.primaryRulersWidth!,
      primaryRulersHeight: linearGauge.rulers!.primaryRulersHeight!,
      secondaryRulersWidth: linearGauge.rulers!.secondaryRulersWidth!,
      secondaryRulersHeight: linearGauge.rulers!.secondaryRulersHeight!,
      primaryRulerColor: linearGauge.rulers!.primaryRulerColor!,
      secondaryRulerColor: linearGauge.rulers!.secondaryRulerColor!,
      thickness: linearGauge.linearGaugeBoxDecoration!.thickness!,
      rulersOffset: linearGauge.rulers!.rulersOffset!,
      rulerPosition: linearGauge.rulers!.rulerPosition!,
      showPrimaryRulers: linearGauge.rulers!.showPrimaryRulers,
      showSecondaryRulers: linearGauge.rulers!.showSecondaryRulers,
      extendLinearGauge: linearGauge.extendLinearGauge!,
      inversedRulers: linearGauge.rulers!.inverseRulers!,
      rangeLinearGauge: linearGauge.rangeLinearGauge!,
      secondaryRulerPerInterval: linearGauge.rulers!.secondaryRulerPerInterval!,
      fillExtend: linearGauge.fillExtend,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderRulers renderObject) {
    renderObject
      ..setGaugeOrientation = linearGauge.gaugeOrientation!
      ..setGaugeAnimation = gaugeAnimation
      ..setPrimaryRulersWidth = linearGauge.rulers!.primaryRulersWidth!
      ..setPrimaryRulersHeight = linearGauge.rulers!.primaryRulersHeight!
      ..setSecondaryRulersWidth = linearGauge.rulers!.secondaryRulersWidth!
      ..setSecondaryRulersHeight = linearGauge.rulers!.secondaryRulersHeight!
      ..setPrimaryRulerColor = linearGauge.rulers!.primaryRulerColor!
      ..setSecondaryRulerColor = linearGauge.rulers!.secondaryRulerColor!
      ..setThickness = linearGauge.linearGaugeBoxDecoration!.thickness!
      ..setRulersOffset = linearGauge.rulers!.rulersOffset!
      ..setRulerPosition = linearGauge.rulers!.rulerPosition!
      ..setShowPrimaryRulers = linearGauge.rulers!.showPrimaryRulers
      ..setShowSecondaryRulers = linearGauge.rulers!.showSecondaryRulers
      ..setExtendLinearGauge = linearGauge.extendLinearGauge!
      ..setInversedRulers = linearGauge.rulers!.inverseRulers!
      ..setRangeLinearGauge = linearGauge.rangeLinearGauge!
      ..setSecondaryRulerPerInterval =
          linearGauge.rulers!.secondaryRulerPerInterval!;
  }
}
