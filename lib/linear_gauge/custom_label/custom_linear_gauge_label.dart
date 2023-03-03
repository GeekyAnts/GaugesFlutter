class CustomLinearGaugeLabel {
  /// A [CustomLinearGaugeLabel] is a widget that allows to add custom labels and values on the [LinearGauge].
  ///
  /// ```dart
  /// child : const LinearGauge(
  /// customLabels: [
  /// CustomLinearGaugeLabel(text: "1%", value: 10),
  /// CustomLinearGaugeLabel(text: "2%", value:20),
  /// CustomLinearGaugeLabel(text: "2.5%", value: 25),
  /// CustomLinearGaugeLabel(text: "3%", value: 30),
  /// ]
  /// ),
  /// ```
  ///
  ///
  const CustomLinearGaugeLabel({
    required this.text,
    required this.value,
  });

  ///
  /// `text` Sets the text of the  on [LinearGauge]
  ///
  /// ```dart
  /// const CustomLinearGaugeLabel(
  ///   text : "10$"
  /// ),
  /// ```
  final String? text;

  ///
  /// `value` Sets the position of the label  on [LinearGauge]
  ///
  /// ```dart
  /// const CustomLinearGaugeLabel(
  ///   value : 10
  /// ),
  /// ```
  final double? value;
}
