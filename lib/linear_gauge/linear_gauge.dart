import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'linear_gauge_painter.dart';

class LinearGauge extends StatefulWidget {
  const LinearGauge(
      {Key? key,
      this.color = Colors.grey,
      this.start = 0,
      this.end = 100,
      this.steps = 10,
      this.height = 4,
      this.showLinearGaugeContainer = true,
      this.gaugeOrientation = GaugeOrientation.horizontal,
      this.rulerPadding = const Padding(padding: EdgeInsets.all(0)),
      this.textStyle = const TextStyle(
        fontSize: 12.0,
        color: Colors.grey,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
      this.primaryRulersWidth = 1.0,
      this.primaryRulersHeight = 10.0,
      this.secondaryRulersHeight = 1.0,
      this.secondaryRulersWidth = 1.0,
      this.labelTopMargin = 0.0,
      this.primaryRulerColor = Colors.grey,
      this.secondaryRulerColor = Colors.grey})
      : super(key: key);

  final Color? color;
  final double? start;
  final double? end;
  final double? steps;
  final double? height;
  final bool? showLinearGaugeContainer;
  final GaugeOrientation? gaugeOrientation;
  final Padding? rulerPadding;
  final TextStyle? textStyle;
  final double? primaryRulersWidth;
  final double? primaryRulersHeight;
  final double? secondaryRulersHeight;
  final double? secondaryRulersWidth;
  final double? labelTopMargin;
  final Color? primaryRulerColor;
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
