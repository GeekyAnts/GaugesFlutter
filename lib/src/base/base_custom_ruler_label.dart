abstract class BaseCustomRulerLabel {
  const BaseCustomRulerLabel({
    this.text,
    this.value,
  });

  ///
  /// `text` Sets the text of the ruler label  on [LinearGauge]
  ///
  /// ```dart
  /// const CustomRulerLabel(
  ///   text : "10$"
  /// ),
  /// ```
  ///
  final String? text;

  ///
  /// `value` Sets the value of the ruler label  on [LinearGauge]
  ///
  /// ```dart
  /// const CustomRulerLabel(
  ///   value : 10
  /// ),
  /// ```
  ///
  final double? value;
}
