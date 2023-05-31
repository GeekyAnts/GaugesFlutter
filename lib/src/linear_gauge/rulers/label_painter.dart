import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geekyants_flutter_gauges/src/linear_gauge/linear_gauge_painter.dart';
import '../../../geekyants_flutter_gauges.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import '../linear_gauge_label.dart';

class RenderRulerLabel extends RenderBox {
  RenderRulerLabel(
      {required GaugeOrientation gaugeOrientation,
      required double primaryRulersHeight,
      required Animation<double>? gaugeAnimation,
      required bool showLabel,
      required RulerPosition rulerPosition,
      required double labelOffset,
      required bool inversedRulers,
      required List<RangeLinearGauge> rangeLinearGauge,
      required double rulersOffset,
      required List<CustomRulerLabel> customLabel,
      required TextStyle textStyle,
      required double extendLinearGauge,
      required double start,
      required double end})
      : _gaugeOrientation = gaugeOrientation,
        _primaryRulersHeight = primaryRulersHeight,
        _gaugeAnimation = gaugeAnimation,
        _showLabel = showLabel,
        _rulerPosition = rulerPosition,
        _labelOffset = labelOffset,
        _inversedRulers = inversedRulers,
        _rulersOffset = rulersOffset,
        _rangeLinearGauge = rangeLinearGauge,
        _extendLinearGauge = extendLinearGauge,
        _start = start,
        _end = end,
        _isHorizontalOrientation =
            gaugeOrientation == GaugeOrientation.horizontal,
        _customLabels = customLabel,
        _textStyle = textStyle;

  LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();
  late bool _isHorizontalOrientation;
  late Size _startLabelSize, _endLabelSize;

  late double gaugeStart, gaugeEnd;
  late double yAxisForGaugeContainer = 0, xAxisForGaugeContainer = 0;

  ///
  /// Getter and Setter for the [_primaryRulersHeight] parameter.
  ///
  get getPrimaryRulersHeight => _primaryRulersHeight;

  double _primaryRulersHeight;

  set setPrimaryRulersHeight(primaryRulersHeight) {
    if (_primaryRulersHeight == primaryRulersHeight) return;

    _primaryRulersHeight = primaryRulersHeight;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_start] parameter.
  ///
  double get getStart => _start;
  double _start;
  set setStart(double start) {
    if (_start == start) return;
    _start = start;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_end] parameter.
  ///
  get getEnd => _end;
  double _end;
  set setEnd(end) {
    if (_end == end) return;
    _end = end;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_gaugeAnimation] parameter.
  ///
  Animation<double>? get getGaugeAnimation => _gaugeAnimation;
  Animation<double>? _gaugeAnimation;
  set setGaugeAnimation(Animation<double>? gaugeAnimation) {
    if (_gaugeAnimation == gaugeAnimation) return;
    _gaugeAnimation = gaugeAnimation;
    _removeAnimationListeners();
    _addAnimationListener();
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_gaugeOrientation] parameter.
  ///
  get getGaugeOrientation => _gaugeOrientation;
  GaugeOrientation _gaugeOrientation;

  set setGaugeOrientation(gaugeOrientation) {
    if (_gaugeOrientation == gaugeOrientation) return;

    _gaugeOrientation = gaugeOrientation;
    _isHorizontalOrientation = gaugeOrientation == GaugeOrientation.horizontal;

    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_textStyle] parameter.
  ///
  get getTextStyle => _textStyle;
  TextStyle _textStyle;
  set setTextStyle(textStyle) {
    if (_textStyle == textStyle) return;

    _textStyle = textStyle;
    markNeedsLayout();
  }

  bool get showLabel => _showLabel;
  bool _showLabel;
  set setShowLabel(bool val) {
    if (_showLabel == val) return;
    _showLabel = val;
    markNeedsPaint();
  }

  RulerPosition get rulerPosition => _rulerPosition;
  RulerPosition _rulerPosition;
  set setRulerPosition(RulerPosition val) {
    if (_rulerPosition == val) return;
    _rulerPosition = val;
    markNeedsLayout();
  }

  double get getLabelOffset => _labelOffset;
  double _labelOffset;
  set setLabelOffset(double val) {
    if (_labelOffset == val) return;
    _labelOffset = val;
    markNeedsLayout();
  }

  double get getExtendLinearGauge => _extendLinearGauge;
  double _extendLinearGauge;
  set setExtendLinearGauge(double val) {
    if (_extendLinearGauge == val) return;
    _extendLinearGauge = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_rulersOffset] parameter.
  ///

  double get getRulersOffset => _rulersOffset;
  double _rulersOffset;
  set setRulersOffset(double val) {
    if (_rulersOffset == val) return;
    _rulersOffset = val;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_inversedRulers] parameter.
  ///

  bool get getInversedRulers => _inversedRulers;
  bool _inversedRulers;
  set setInversedRulers(bool val) {
    if (_inversedRulers == val) return;
    _inversedRulers = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [rangeLinearGauge] parameter.
  ///
  List<RangeLinearGauge>? get rangeLinearGauge => _rangeLinearGauge;
  List<RangeLinearGauge>? _rangeLinearGauge = <RangeLinearGauge>[];
  set setRangeLinearGauge(List<RangeLinearGauge>? val) {
    if (_rangeLinearGauge == val) return;
    _rangeLinearGauge = val;
    markNeedsPaint();
  }

  List<CustomRulerLabel>? get getCustomLabels => _customLabels;
  List<CustomRulerLabel>? _customLabels = <CustomRulerLabel>[];
  set setCustomLabels(List<CustomRulerLabel>? val) {
    if (_customLabels == val) return;
    _customLabels = val;
    markNeedsPaint();
  }

  void _addAnimationListener() {
    if (_gaugeAnimation != null) {
      _gaugeAnimation!.addListener(markNeedsPaint);
    }
  }

  void _removeAnimationListeners() {
    if (_gaugeAnimation != null) {
      _gaugeAnimation!.removeListener(markNeedsPaint);
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _addAnimationListener();
  }

  @override
  void detach() {
    _removeAnimationListeners();
    super.detach();
  }

  Color setAnimatedColor(Color paintColor) {
    double animationValue = 1;
    if (_gaugeAnimation != null) {
      animationValue = _gaugeAnimation!.value;
    }

    return paintColor.withOpacity(animationValue * paintColor.opacity);
  }

  setCustomLabelStartEnd() {
    if (getCustomLabels!.isNotEmpty) {
      _start = getCustomLabels!.first.value!;
      _end = getCustomLabels!.last.value!;
    }
  }

  @override
  void performLayout() {
    LinearGaugeParentData parentDataRef = parentData as LinearGaugeParentData;
    _startLabelSize = parentDataRef.linearGaugeLabel.startLabelSize;
    _endLabelSize = parentDataRef.linearGaugeLabel.endLabelSize;
    gaugeStart = parentDataRef.gaugeStart;
    gaugeEnd = parentDataRef.gaugeEnd;
    Size axisActualSize;
    setCustomLabelStartEnd();

    double actualParentWidth;
    if (_isHorizontalOrientation) {
      if (!getInversedRulers) {
        actualParentWidth =
            (_endLabelSize.width + gaugeEnd) - getExtendLinearGauge * 2;
      } else {
        actualParentWidth =
            (_startLabelSize.width + gaugeEnd) - getExtendLinearGauge * 2;
      }
    } else {
      actualParentWidth =
          (_endLabelSize.height + gaugeEnd) - getExtendLinearGauge * 2;
    }

    double effectiveLabelHeight;

    if (_isHorizontalOrientation) {
      effectiveLabelHeight = _startLabelSize.height;
    } else {
      effectiveLabelHeight =
          math.max(_startLabelSize.width, _endLabelSize.width);
    }

    if (actualParentWidth > constraints.maxWidth) {
      actualParentWidth = constraints.maxWidth;
    }

    if (_isHorizontalOrientation) {
      axisActualSize = Size(actualParentWidth, effectiveLabelHeight);
    } else {
      axisActualSize = Size(effectiveLabelHeight, actualParentWidth);
    }

    size = axisActualSize;
  }

  void _drawLabels(
    Canvas canvas,
    String text,
    double? value,
    List<Offset> list,
  ) {
    final ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );

    // calculator method to get the text style based on the range
    Color getRangeColor(String text) {
      for (int i = 0; i < rangeLinearGauge!.length; i++) {
        if (value! >= rangeLinearGauge![i].start &&
            value <= rangeLinearGauge![i].end) {
          return rangeLinearGauge![i].color;
        }
      }
      // Return a default style if no range color is found
      return getTextStyle.color ?? Colors.black;
    }

    final ui.TextStyle labelTextStyle = ui.TextStyle(
      color: setAnimatedColor(getRangeColor(text)),
      fontSize: getTextStyle.fontSize,
      background: getTextStyle.background,
      decoration: getTextStyle.decoration,
      decorationColor: getTextStyle.decorationColor,
      decorationStyle: getTextStyle.decorationStyle,
      decorationThickness: getTextStyle.decorationThickness,
      fontFamily: getTextStyle.fontFamily,
      fontFamilyFallback: getTextStyle.fontFamilyFallback,
      fontFeatures: getTextStyle.fontFeatures,
      fontStyle: getTextStyle.fontStyle,
      fontVariations: getTextStyle.fontVariations,
      fontWeight: getTextStyle.fontWeight,
      foreground: getTextStyle.foreground,
      height: getTextStyle.height,
      leadingDistribution: getTextStyle.leadingDistribution,
      letterSpacing: getTextStyle.letterSpacing,
      locale: getTextStyle.locale,
      shadows: getTextStyle.shadows,
      textBaseline: getTextStyle.textBaseline,
      wordSpacing: getTextStyle.wordSpacing,
    );

    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(labelTextStyle)
          ..addText(text);
    final ui.Paragraph paragraph = paragraphBuilder.build();
    final Size labelSize =
        _linearGaugeLabel.getLabelSize(textStyle: getTextStyle, value: text);

    paragraph.layout(ui.ParagraphConstraints(width: labelSize.width));

    // offset for drawing the label on the canvas
    Offset labelPosition;

    switch (rulerPosition) {
      case RulerPosition.top:
        labelPosition = Offset(
          (list[0].dx - (labelSize.width / 2)),
          -(getPrimaryRulersHeight +
              getLabelOffset +
              getRulersOffset +
              labelSize.height -
              yAxisForGaugeContainer +
              2),
        );
        break;
      case RulerPosition.center:
        if (getGaugeOrientation == GaugeOrientation.horizontal) {
          double labelOffset = getLabelOffset;
          labelPosition = Offset(
            (list[0].dx - (labelSize.width / 2)),
            (list[0].dy / 2 +
                getPrimaryRulersHeight / 2 +
                labelOffset +
                yAxisForGaugeContainer),
          );
        } else {
          double labelOffset = getLabelOffset;
          labelPosition = Offset(
            (list[0].dx / 2 +
                getPrimaryRulersHeight / 2 +
                labelOffset +
                xAxisForGaugeContainer),
            (list[0].dy - (labelSize.height / 2)),
          );
        }
        break;
      case RulerPosition.bottom:
        double labelOffset = getLabelOffset;
        labelPosition = Offset(
          (list[0].dx - (labelSize.width / 2)),
          (list[0].dy +
              getPrimaryRulersHeight +
              labelOffset +
              getRulersOffset +
              yAxisForGaugeContainer),
        );
        break;
      case RulerPosition.right:
        double labelOffset = getLabelOffset;
        labelPosition = Offset(
          (list[0].dx +
              (getPrimaryRulersHeight +
                  labelOffset +
                  getRulersOffset +
                  xAxisForGaugeContainer)),
          (list[0].dy - (labelSize.height / 2)),
        );
        break;
      case RulerPosition.left:
        double labelOffset = getLabelOffset;
        labelPosition = Offset(
          -(getPrimaryRulersHeight +
              labelOffset +
              getRulersOffset +
              labelSize.width -
              xAxisForGaugeContainer),
          (list[0].dy - (labelSize.height / 2)),
        );
        break;
    }

    canvas.drawParagraph(
      paragraph,
      labelPosition,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    LinearGaugeParentData parentDataRef = parentData as LinearGaugeParentData;

    xAxisForGaugeContainer = parentDataRef.xAxisForGaugeContainer;
    yAxisForGaugeContainer = parentDataRef.yAxisForGaugeContainer;
    _linearGaugeLabel = parentDataRef.linearGaugeLabel;

    int count = 0;
    _linearGaugeLabel.getPrimaryRulersOffset.forEach((key, value) {
      _drawLabels(canvas, _linearGaugeLabel.getListOfLabel[count].text!,
          double.tryParse(key), value);
      count++;
    });
  }
}
