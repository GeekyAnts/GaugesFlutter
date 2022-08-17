import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'linear_gauge_painter.dart';

class LinearGauge extends StatefulWidget {
  ///
  /// [LinearGauge] is a visualization of measurement widget with a linear scale values. Linear
  /// Gauge as rich sets of config parameters which can be modified as per requirement
  ///
  /// `start` and `end` is responsible to paint the values as a label.
  ///
  ///
  ///
  /// ``` dart
  /// LinearGauge(
  ///   steps: 2,
  ///   start: 0,
  ///   end: 100,
  ///),
  /// ```
  ///
  const LinearGauge(
      {Key? key,
      this.color = const Color.fromARGB(255, 207, 207, 207),
      this.start = 0,
      this.end = 100,
      this.steps = 1,
      this.height = 4,
      this.showLinearGaugeContainer = true,
      this.gaugeOrientation = GaugeOrientation.horizontal,
      this.rulerPadding = const Padding(padding: EdgeInsets.all(0)),
      this.textStyle = const TextStyle(
        fontSize: 12.0,
        color: Color.fromARGB(255, 86, 86, 86),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
      this.primaryRulersWidth = 1.0,
      this.primaryRulersHeight = 15.0,
      this.secondaryRulersHeight = 1.0,
      this.secondaryRulersWidth = 1.0,
      this.labelTopMargin = 0.0,
      this.primaryRulerColor = Colors.black54,
      this.secondaryRulerColor = Colors.grey})
      : super(key: key);

  ///
  /// `color` Set the Color of the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   color: Colors.red,
  /// ),
  /// ```
  final Color? color;

  ///
  /// `start` Sets the starting label of the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   start : 0.0
  /// ),
  /// ```
  final double? start;

  ///
  /// `end` Sets the ending label of the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   end : 0.0
  /// ),
  /// ```
  ///
  final double? end;

  ///
  /// `steps` Sets the interval between label of the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   steps : 5.5
  /// ),
  /// ```
  ///
  final double? steps;

  ///
  /// `height` Sets the height of the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   steps : 5.5
  /// ),
  /// ```
  ///
  final double? height;

  ///
  /// `showLinearGaugeContainer`  controls the  [LinearGauge] Container render
  ///
  /// Below example renders the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   showLinearGaugeContainer : true
  /// ),
  /// ```
  ///
  /// Below example will not render the [LinearGauge] Container
  ///
  /// ```dart
  /// const LinearGauge(
  ///   showLinearGaugeContainer : false
  /// ),
  /// ```
  ///
  final bool? showLinearGaugeContainer;

  ///
  ///  `gaugeOrientation` sets the [LinearGauge] orientation to horizontal or vertical
  ///
  ///  default is to `GaugeOrientation.horizontal`
  ///
  /// ```dart
  /// const LinearGauge(
  ///   gaugeOrientation : GaugeOrientation.horizontal
  /// ),
  /// ```
  ///
  final GaugeOrientation? gaugeOrientation;

  ///
  /// `rulerPadding` set the padding around the ruler of [LinearGauge]
  ///
  ///  default is to `const Padding(padding: EdgeInsets.all(0))`
  ///
  /// ```dart
  /// const LinearGauge(
  ///  rulerPadding: Padding(padding: EdgeInsets.all(20.0)),
  /// ),
  /// ```
  ///
  final Padding? rulerPadding;

  ///
  /// `textStyle` sets the Label text style of [LinearGauge]
  ///
  ///  default is to
  /// ```dart
  /// const TextStyle(
  ///   fontSize: 12.0,
  ///   color: Colors.grey,
  ///  fontStyle: FontStyle.normal,
  ///   fontWeight: FontWeight.normal,
  /// ),
  ///   ```
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   textStyle: TextStyle(color: Colors.red, fontSize: 16.0),
  /// ),
  /// ```
  final TextStyle? textStyle;

  ///
  ///
  /// `primaryRulersWidth` set the width of the Rulers which are attached to the labels
  ///
  /// default is to `primaryRulersWidth =`1.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   primaryRulersWidth: 2,
  /// ),
  /// ```
  final double? primaryRulersWidth;

  ///
  ///
  /// `primaryRulersHeight` set the Height of the Rulers which are attached to the labels
  ///
  /// default is to `primaryRulersHeight =`10.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   primaryRulersHeight: 20,
  /// ),
  /// ```
  ///
  final double? primaryRulersHeight;

  ///
  ///
  /// `secondaryRulersHeight` set the Height of the Rulers which are in the between of  label Rulers
  ///
  /// default is to `secondaryRulersHeight =`1.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   secondaryRulersHeight: 20,
  /// ),
  /// ```
  ///
  final double? secondaryRulersHeight;

  ///
  ///
  /// `secondaryRulersWidth` set the width of the Rulers which are in the between of  label Rulers
  ///
  /// default is to `secondaryRulersHeight =`1.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   primaryRulersHeight: 20,
  /// ),
  /// ```
  ///
  final double? secondaryRulersWidth;

  ///
  ///
  /// `labelTopMargin` sets the margin from the  top of the label
  ///
  /// default is to `labelTopMargin =`0.0`
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   labelTopMargin: 5.0,
  /// ),
  /// ```
  ///
  final double? labelTopMargin;

  ///
  ///
  /// `primaryRulerColor` sets the color of the ruler which is attached to labels
  ///
  /// default is to `primaryRulerColor =Colors.grey
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   primaryRulerColor: Colors.green,
  /// ),
  /// ```
  ///
  final Color? primaryRulerColor;

  ///
  ///
  /// `secondaryRulerColor` sets the color of the ruler which are in the between of ruler attached to labels
  ///
  /// default is to `secondaryRulerColor =Colors.grey
  ///
  /// Example
  ///
  ///  ```dart
  /// child: const LinearGauge(
  ///   secondaryRulerColor: Colors.green,
  /// ),
  /// ```
  ///
  final Color? secondaryRulerColor;

  @override
  State<LinearGauge> createState() => _LinearGaugeState();
}

class _LinearGaugeState extends State<LinearGauge> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinearGaugePainter(
        color: widget.color!,
        start: widget.start!,
        end: widget.end!,
        height: widget.height!,
        steps: widget.steps!,
        showLinearGaugeContainer: widget.showLinearGaugeContainer!,
        gaugeOrientation: widget.gaugeOrientation!,
        rulerPadding: widget.rulerPadding!,
        textStyle: widget.textStyle!,
        primaryRulersWidth: widget.primaryRulersWidth!,
        primaryRulersHeight: widget.primaryRulersHeight!,
        secondaryRulersHeight: widget.secondaryRulersHeight!,
        secondaryRulerWidth: widget.secondaryRulersWidth!,
        labelTopMargin: widget.labelTopMargin!,
        primaryRulerColor: widget.primaryRulerColor!,
        secondaryRulerColor: widget.secondaryRulerColor!,
      ),
    );
  }
}
