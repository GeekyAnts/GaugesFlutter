import '../../base/base_custom_ruler_label.dart';

/// A [CustomRulerLabel] class allows to add custom text of any kind and assign value to it
/// on the gauge scale.
///
/// ```dart
/// child : const LinearGauge(
///   customLabels: [
///     CustomRulerLabel(text: "1%", value: 10),
///     CustomRulerLabel(text: "2%", value:20),
///     CustomRulerLabel(text: "2.5%", value: 25),
///     CustomRulerLabel(text: "3%", value: 30),
/// ]),
/// ```
///
///

class CustomRulerLabel extends BaseCustomRulerLabel {
  const CustomRulerLabel({
    required super.text,
    required super.value,
  });
}
