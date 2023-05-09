import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

import '../../base/base_range_linear_gauge.dart';

/// A [RangeLinearGauge]  represents range values to be displayed on a linear gauge.

/// ```dart
/// const LinearGauge(
///  rangeLinearGauge: [
///   RangeLinearGauge(color: Colors.red, start: 0, end: 25),
///  RangeLinearGauge(color: Colors.yellow, start: 25, end: 50),
/// RangeLinearGauge(color: Colors.red, start: 51, end: 100)
///  ],
/// )
/// ```

class RangeLinearGauge extends BaseRangeLinearGauge {
  RangeLinearGauge({
    required super.color,
    required super.start,
    required super.end,
    super.borderRadius,
    super.edgeStyle = LinearEdgeStyle.bothCurve,
  });
}
