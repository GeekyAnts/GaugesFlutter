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
class CustomRulerLabel {
  const CustomRulerLabel({
    required this.text,
    required this.value,
  });

  ///
  /// `text` Sets the text of the ruler label  on [LinearGauge]
  ///
  /// ```dart
  /// const CustomRulerLabel(
  ///   text : "10$"
  /// ),
  /// ```
  final String? text;

  ///
  /// `value` Sets the value of the ruler label  on [LinearGauge]
  ///
  /// ```dart
  /// const CustomRulerLabel(
  ///   value : 10
  /// ),
  /// ```
  final double? value;
}
