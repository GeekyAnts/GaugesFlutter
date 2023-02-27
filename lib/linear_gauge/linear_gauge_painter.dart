import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:geekyants_flutter_gauges/linear_gauge/linear_gauge_label.dart';
// import 'package:geekyants_flutter_gauges/linear_gauge/pointers/linear_gauge_pointer.dart';

class RenderLinearGauge extends RenderBox {
  RenderLinearGauge({
    required LinearGaugeIndicator indicator,
    required double start,
    required double end,
    required double steps,
    required bool showLinearGaugeContainer,
    required GaugeOrientation gaugeOrientation,
    required TextStyle textStyle,
    required double primaryRulersWidth,
    required double primaryRulersHeight,
    required double secondaryRulersHeight,
    required double secondaryRulersWidth,
    required double labelTopMargin,
    required Color primaryRulerColor,
    required Color secondaryRulerColor,
    required LinearGaugeBoxDecoration linearGaugeBoxDecoration,
    required double secondaryRulerPerInterval,
    required Color linearGaugeContainerBgColor,
    required Color linearGaugeContainerValueColor,
    required double labelSize,
    required Color labelColor,
    required bool showLabel,
    required bool invertLabels,
    required bool showSecondaryRulers,
    required bool showPrimaryRulers,
    required double value,
  })  : assert(start < end, "Start should be grater then end"),
        _start = start,
        _end = end,
        _steps = steps,
        _showLinearGaugeContainer = showLinearGaugeContainer,
        _gaugeOrientation = gaugeOrientation,
        _textStyle = textStyle,
        _primaryRulerColor = primaryRulerColor,
        _primaryRulersWidth = primaryRulersWidth,
        _primaryRulersHeight = primaryRulersHeight,
        _secondaryRulerColor = secondaryRulerColor,
        _secondaryRulersHeight = secondaryRulersHeight,
        _secondaryRulersWidth = secondaryRulersWidth,
        _labelTopMargin = labelTopMargin,
        _linearGaugeBoxDecoration = linearGaugeBoxDecoration,
        _secondaryRulerPerInterval = secondaryRulerPerInterval,
        _linearGaugeContainerBgColor = linearGaugeBoxDecoration.backgroundColor,
        _linearGaugeContainerValueColor = linearGaugeContainerValueColor,
        _labelSize = labelSize,
        _labelColor = labelColor,
        _showLabel = showLabel,
        _invertLabels = invertLabels,
        _showSecondaryRulers = showSecondaryRulers,
        _showPrimaryRulers = showPrimaryRulers,
        _value = value,
        _indicator = indicator;

  //! X axis Vlaue
  ///
  double _valueInPixel = 0;

  ///

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
  /// Getter and Setter for the [_steps] parameter.
  ///
  get getSteps => _steps;
  double _steps;
  set setSteps(steps) {
    if (_steps == steps) return;

    _steps = steps;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_showLinearGaugeContainer] parameter.
  ///
  get getShowLinearGaugeContainer => _showLinearGaugeContainer;
  bool _showLinearGaugeContainer;
  set setShowLinearGaugeContainer(showLinearGaugeContainer) {
    if (_showLinearGaugeContainer == showLinearGaugeContainer) return;

    _showLinearGaugeContainer = showLinearGaugeContainer;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [gaugeOrientation] parameter.
  ///
  get getGaugeOrientation => _gaugeOrientation;
  GaugeOrientation _gaugeOrientation;

  set setGaugeOrientation(gaugeOrientation) {
    if (_gaugeOrientation == gaugeOrientation) return;

    _gaugeOrientation = gaugeOrientation;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [textStyle] parameter.
  ///
  get getTextStyle => _textStyle;
  TextStyle _textStyle;
  set setTextStyle(textStyle) {
    if (_textStyle == textStyle) return;

    _textStyle = textStyle;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulersWidth] parameter.
  ///
  get getPrimaryRulersWidth => _primaryRulersWidth;
  double _primaryRulersWidth;
  set setPrimaryRulersWidth(primaryRulersWidth) {
    if (_primaryRulersWidth == primaryRulersWidth) return;

    _primaryRulersWidth = primaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulersHeight] parameter.
  ///
  get getPrimaryRulersHeight => _primaryRulersHeight;

  double _primaryRulersHeight;

  set setPrimaryRulersHeight(primaryRulersHeight) {
    if (_primaryRulersHeight == primaryRulersHeight) return;

    _primaryRulersHeight = primaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulersHeight] parameter.
  ///
  get getSecondaryRulersHeight => _secondaryRulersHeight;

  double _secondaryRulersHeight;

  set setSecondaryRulersHeight(secondaryRulersHeight) {
    if (_secondaryRulersHeight == secondaryRulersHeight) return;

    _secondaryRulersHeight = secondaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulersWidth] parameter.
  ///

  get getSecondaryRulersWidth => _secondaryRulersWidth;
  double _secondaryRulersWidth;
  set setSecondaryRulersWidth(secondaryRulersWidth) {
    if (_secondaryRulersWidth == secondaryRulersWidth) return;

    _secondaryRulersWidth = secondaryRulersWidth;
    markNeedsPaint();
  }

  //! Linear Gauge Container
  get getLinearGaugeIndicator => _indicator;
  LinearGaugeIndicator _indicator = LinearGaugeIndicator(
    value: 10,
  );

  set setLinearGaugeIndicator(linearGaugeIndicator) {
    _indicator = linearGaugeIndicator;

    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [labelTopMargin] parameter.
  ///
  get getLabelTopMargin => _labelTopMargin;
  double _labelTopMargin;

  set setLabelTopMargin(labelTopMargin) {
    if (_labelTopMargin == labelTopMargin) return;

    _labelTopMargin = labelTopMargin;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [primaryRulerColor] parameter.
  ///
  Color get getPrimaryRulerColor => _primaryRulerColor;
  Color _primaryRulerColor;

  set setPrimaryRulerColor(primaryRulerColor) {
    if (_primaryRulerColor == primaryRulerColor) return;
    _primaryRulerColor = primaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulerColor] parameter.
  ///
  Color get getSecondaryRulerColor => _secondaryRulerColor;
  Color _secondaryRulerColor;

  set setSecondaryRulerColor(secondaryRulerColor) {
    if (_secondaryRulerColor == secondaryRulerColor) return;
    _secondaryRulerColor = secondaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [linearGaugeBoxDecoration] parameter.
  ///
  LinearGaugeBoxDecoration get getLinearGaugeBoxDecoration =>
      _linearGaugeBoxDecoration;

  LinearGaugeBoxDecoration _linearGaugeBoxDecoration;
  set setLinearGaugeBoxDecoration(linearGaugeBoxDecoration) {
    if (_linearGaugeBoxDecoration == linearGaugeBoxDecoration) return;
    _linearGaugeBoxDecoration = linearGaugeBoxDecoration;
    markNeedsPaint();
  }

  ///
  ///
  ///
  double get getSecondaryRulerPerInterval => _secondaryRulerPerInterval;
  double _secondaryRulerPerInterval;

  set setSecondaryRulerPerInterval(secondaryRulerPerInterval) {
    if (_secondaryRulerPerInterval == secondaryRulerPerInterval) {
      return;
    }
    _secondaryRulerPerInterval = secondaryRulerPerInterval;
    markNeedsPaint();
  }

  ///
  ///
  ///
  Color get getLinearGaugeContainerBgColor => _linearGaugeContainerBgColor;
  Color _linearGaugeContainerBgColor;
  set setLinearGaugeContainerBgColor(Color linearGaugeContainerBgColor) {
    if (_linearGaugeContainerBgColor == linearGaugeContainerBgColor) {
      return;
    }
    _linearGaugeContainerBgColor = linearGaugeContainerBgColor;
    markNeedsPaint();
  }

  Color get getLinearGaugeContainerValueColor =>
      _linearGaugeContainerValueColor;
  Color _linearGaugeContainerValueColor;
  set setLinearGaugeContainerValueColor(Color linearGaugeContainerValueColor) {
    if (_linearGaugeContainerValueColor == linearGaugeContainerValueColor) {
      return;
    }
    _linearGaugeContainerValueColor = linearGaugeContainerValueColor;
    markNeedsPaint();
  }

  double get getValue => _value;
  double _value;
  set setValue(double val) {
    if (_value == val) {
      return;
    }
    _value = val;
    markNeedsPaint();
  }

  double get getLabelSize => _labelSize;
  double _labelSize;
  set setLabelSize(double val) {
    if (_labelSize == val) return;
    _labelSize = val;
    markNeedsPaint();
  }

  Color get getLabelColor => _labelColor;
  Color _labelColor;
  set setLabelColor(Color val) {
    if (_labelColor == val) return;
    _labelColor = val;
    markNeedsPaint();
  }

  bool get showLabel => _showLabel;
  bool _showLabel;
  set setShowLabel(bool val) {
    if (_showLabel == val) return;
    _showLabel = val;
    markNeedsPaint();
  }

  bool get invertLabels => _invertLabels;
  bool _invertLabels;
  set setInvertLabels(bool val) {
    if (_invertLabels == val) return;
    _invertLabels = val;
    markNeedsPaint();
  }

  bool get showSecondaryRulers => _showSecondaryRulers;
  bool _showSecondaryRulers;
  set setShowSecondaryRulers(bool val) {
    if (_showSecondaryRulers == val) return;
    _showSecondaryRulers = val;
    markNeedsPaint();
  }

  bool get showPrimaryRulers => _showPrimaryRulers;
  bool _showPrimaryRulers;
  set setShowPrimaryRulers(bool val) {
    if (_showPrimaryRulers == val) return;
    _showPrimaryRulers = val;
    markNeedsPaint();
  }

  LinearGaugeLabel get getLinearGaugeLabel {
    return _linearGaugeLabel;
  }

  final Paint _linearGaugeContainerPaint = Paint();
  final Paint _primaryRulersPaint = Paint();
  final Paint _secondaryRulersPaint = Paint();
  final Paint _linearGaugeContainerValuePaint = Paint();
  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();

  late Size _startLabelSize, _endLabelSize;

  void _calculateRulerPoints() {
    double screenSize = 3 * size.width;
    final double count = math.max(screenSize / 100, 1.0);
    double interval = (getEnd - getStart) / (screenSize / 100);
    final List<double> intervalDivisions = <double>[10, 5, 2, 1];
    late double currentInterval;
    num v = math.pow(10, (math.log(interval) / math.log(10)).floor());

    for (final double intervalDivision in intervalDivisions) {
      currentInterval = v * intervalDivision;

      if (count < ((getEnd - getStart) / currentInterval)) {
        break;
      }
      interval = currentInterval;
    }

    _linearGaugeLabel.addLabels(
      distanceValueInRangeOfHundred: getSteps == 0.0 ? interval : getSteps,
      start: getStart,
      end: getEnd,
    );

    _startLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle, value: getStart);

    _endLabelSize =
        _linearGaugeLabel.getLabelSize(textStyle: getTextStyle, value: getEnd);

    _linearGaugeLabel.generateOffSetsForLabel(
        _startLabelSize,
        _endLabelSize,
        size,
        getEnd,
        getPrimaryRulersHeight,
        getLinearGaugeBoxDecoration.height,
        getLabelTopMargin);
  }

  void _drawLabels(Canvas canvas, String text, List<Offset> list) {
    final ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final String labelText = text;
    final double? value = double.tryParse(text);
    final ui.TextStyle labelTextStyle = ui.TextStyle(
      color: _labelColor,
      fontSize: _labelSize,
    );
    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(labelTextStyle)
          ..addText(labelText);
    final ui.Paragraph paragraph = paragraphBuilder.build();
    final Size labelSize =
        _linearGaugeLabel.getLabelSize(textStyle: getTextStyle, value: value);

    paragraph.layout(ui.ParagraphConstraints(width: labelSize.width));

    Offset labelOffsets;
    if (invertLabels) {
      labelOffsets = Offset(
        (list[0].dx - (labelSize.width / 2)),
        -(getPrimaryRulersHeight + labelSize.height - 2),
      );
    } else {
      labelOffsets = Offset(
        (list[0].dx - (labelSize.width / 2)),
        (list[0].dy + getPrimaryRulersHeight + getLabelTopMargin),
      );
    }
    canvas.drawParagraph(
      paragraph,
      labelOffsets,
    );
  }

  void _paintGaugeContainer(Canvas canvas, Size size) {
    Offset offset = const Offset(0, 0);
    late double end;
    late double start;

    if (showLabel) {
      end = size.width -
          ((_endLabelSize.width / 2) + (_startLabelSize.width / 2));
      start = (offset.dx + _startLabelSize.width / 2);
    } else {
      end = size.width;
      start = offset.dx;
    }

    late Rect gaugeContainer;
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      gaugeContainer = Rect.fromLTWH(
          start, offset.dy, end, getLinearGaugeBoxDecoration.height);
    }

    // get 50 % of total width;
    double removeStartPercentage = (getStart * 100) / getEnd;

    double totalWidth = end;
    double percentageInVal = (getValue * 100) / (getEnd);

    double totalValOnPixel = ((totalWidth * percentageInVal) / 100) -
        ((totalWidth * removeStartPercentage) / 100);

//!
    if (_indicator.getPointerValue == null) {
      _valueInPixel = totalValOnPixel;
    } else {
      double percentageInValPointer =
          (_indicator.getPointerValue * 100) / (getEnd);
      double totalValOnPixelPointer =
          ((totalWidth * percentageInValPointer) / 100) -
              ((totalWidth * removeStartPercentage) / 100);
      _valueInPixel = totalValOnPixelPointer;
    }

    if (getLinearGaugeBoxDecoration.borderRadius != null) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
            gaugeContainer,
            Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
          ),
          _linearGaugeContainerPaint);

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;
      gaugeContainer = Rect.fromLTWH(start, offset.dy, totalValOnPixel,
          getLinearGaugeBoxDecoration.height);
      if (getLinearGaugeBoxDecoration.linearGradient != null) {
        _linearGaugeContainerValuePaint.shader = getLinearGaugeBoxDecoration
            .linearGradient!
            .createShader(gaugeContainer);
      }
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
        ),
        _linearGaugeContainerValuePaint,
      );
    } else {
      canvas.drawRect(gaugeContainer, _linearGaugeContainerPaint);

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;
      gaugeContainer = Rect.fromLTWH(start, offset.dy, totalValOnPixel,
          getLinearGaugeBoxDecoration.height);
      if (getLinearGaugeBoxDecoration.linearGradient != null) {
        _linearGaugeContainerValuePaint.shader = getLinearGaugeBoxDecoration
            .linearGradient!
            .createShader(gaugeContainer);
      }
      canvas.drawRect(
        gaugeContainer,
        _linearGaugeContainerValuePaint,
      );
    }
  }

  void _drawPrimaryRulers(Canvas canvas) {
    _setPrimaryRulersPaint();
    _linearGaugeLabel.getPrimaryRulersOffset.forEach((key, value) {
      double y;
      double x;
      if (invertLabels) {
        //in case of invert labels
        //y co-ordinate will be simply inverted on negative side by adding -ve sign
        //no need to adjust y co-ordinate by adding the height of gauge container
        y = -value[1].dy;
        x = value[1].dx;
      } else {
        //in case of non-invert labels
        //there is need to adjust y co-ordinate by adding the height of gauge container
        //bcz line will start drawing from behind of gauge container
        y = value[1].dy + getLinearGaugeBoxDecoration.height;
        x = value[1].dx;
      }

      Offset a = Offset(x, y);

      canvas.drawLine(value[0], a, _primaryRulersPaint);
      if (showLabel) {
        _drawLabels(canvas, key, value);
      }
    });
  }

  void _drawSecondaryRulers(Canvas canvas) {
    _linearGaugeLabel.generateSecondaryRulers(
        getSecondaryRulerPerInterval,
        canvas,
        _secondaryRulersPaint,
        getSecondaryRulersHeight + getLinearGaugeBoxDecoration.height,
        invertLabels,
        getLinearGaugeBoxDecoration.height);
  }

  void _setPrimaryRulersPaint() {
    _primaryRulersPaint.color = getPrimaryRulerColor;
    _primaryRulersPaint.strokeWidth = getPrimaryRulersWidth;
  }

  void _setSecondaryRulersPaint() {
    _secondaryRulersPaint.color = getSecondaryRulerColor;
    _secondaryRulersPaint.strokeWidth = getSecondaryRulersWidth;
  }

  void _setLinearGaugeContainerPaint() {
    _linearGaugeContainerPaint.color = getLinearGaugeContainerBgColor;
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = constraints.maxWidth;
    //final desiredHeight = constraints.maxHeight;
    final desiredSize = Size(desiredWidth, 50);
    return constraints.constrain(desiredSize);
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    _setLinearGaugeContainerPaint();
    _setSecondaryRulersPaint();

    _calculateRulerPoints();
    if (showPrimaryRulers) {
      _drawPrimaryRulers(canvas);
    }

    if (showSecondaryRulers) {
      _drawSecondaryRulers(canvas);
    }

//!    // print(getLinearGaugeIndicator.value);
    double value = getLinearGaugeIndicator.value ?? _valueInPixel;

    if (getShowLinearGaugeContainer) {
      _paintGaugeContainer(
        canvas,
        size,
      );
    }

    var firstOffset = Offset(_valueInPixel, 0.0);
    if (_indicator.getPointerValue == null) {
      _indicator.setPointerValue = value;
    }
    var firstOff =
        _linearGaugeLabel.getPrimaryRulersOffset["0"]![0] + firstOffset;

    // getLinearGaugeIndicator.drawCirclePointer(canvas, value, offset,
    //     _indicator.height, _indicator.width, _indicator.color);
    getLinearGaugeIndicator.drawCirclePointer(canvas, value, firstOff,
        _indicator.height, _indicator.width, _indicator.color);

    getLinearGaugeIndicator.drawTrianglePointer(canvas, firstOff,
        _indicator.height, _indicator.width, value, _indicator.color);

    canvas.restore();
  }
}
