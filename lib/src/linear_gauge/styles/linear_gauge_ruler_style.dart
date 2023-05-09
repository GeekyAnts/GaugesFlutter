import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/src/base/base_ruler_style.dart';

///
/// RulerStyle allows to customize the style of [LinearGauge] Rulers.
///

class RulerStyle extends BaseRulerStyle {
  const RulerStyle({
    required this.rulerPosition,
    super.primaryRulersWidth,
    super.primaryRulersHeight,
    super.secondaryRulersHeight,
    super.secondaryRulersWidth,
    super.secondaryRulerColor,
    super.secondaryRulerPerInterval,
    super.showSecondaryRulers,
    super.showPrimaryRulers,
    super.textStyle,
    super.showLabel,
    super.rulersOffset,
    super.labelOffset,
    super.inverseRulers,
    super.primaryRulerColor,
  });

  ///
  ///
  /// `rulerPosition` Sets the position of the rulers (top,center,bottom)
  ///
  /// default is to `rulerPosition =RulerPosition.bottom
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  /// rulers : RulerStyle(
  ///   rulerPosition: RulerPosition.bottom,
  /// ),
  /// ```
  ///

  final RulerPosition? rulerPosition;
}
