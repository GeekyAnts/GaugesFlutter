// using import as ui because of TextStyle getting imported from two files.
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'dart:math' as math;

import 'package:gauges/linear_gauge/linear_gauge_label.dart';

class LinearGauge extends StatefulWidget {
  /// Creates a `LinearGauge` widget which display values on gauge
  /// `LinearGauge` got many properties which can be use to change the default behavior
  /// such as start, end, and ruler which are  customizable
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: LinearGauge());
  ///}
  /// ```
  const LinearGauge(
      {Key? key,
      double? start,
      double? end,
      Color? rulerColor,
      double? steps,
      GaugeOrientation? gaugeOrientation,
      double? extendedPaddingOnRuler,
      bool? showRulers,
      bool? showLabels,
      double? topPaddingForRulers,
      double? topPaddingForLabel,
      bool? showGaugeContainer,
      double? vitalRulerWidth,
      TextStyle? textStyle})
      : steps = steps ?? 5,
        rulerColor = rulerColor ?? Colors.black,
        gaugeOrientation = gaugeOrientation ?? GaugeOrientation.horizontal,
        end = end ?? 100,
        start = start ?? 0,
        extendedPaddingOnRuler = extendedPaddingOnRuler ?? 0,
        showRulers = showRulers ?? true,
        topPaddingForRulers = topPaddingForRulers ?? 0,
        topPaddingForLabel = topPaddingForLabel ?? 0,
        showGaugeContainer = showGaugeContainer ?? true,
        vitalRulerWidth = vitalRulerWidth ?? 1.0,
        showLabels = showLabels ?? true,
        textStyle = textStyle ??
            const TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
        super(key: key);

  /// The `start` contained by the container.
  final double? start;

  final double? end;
  final double? steps;
  final Color? rulerColor;
  final GaugeOrientation? gaugeOrientation;
  final double? extendedPaddingOnRuler;
  final bool? showRulers;
  final double? topPaddingForRulers;
  final double? topPaddingForLabel;
  final bool? showGaugeContainer;
  final double? vitalRulerWidth;
  final bool? showLabels;
  final TextStyle? textStyle;

  @override
  State<LinearGauge> createState() => _LinearGaugeState();
}

class _LinearGaugeState extends State<LinearGauge> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomPaint(
        painter: GaugePainter(
          end: widget.end!,
          start: widget.start!,
          steps: widget.steps!,
          rulerColor: widget.rulerColor!,
          gaugeOrientation: widget.gaugeOrientation!,
          extendedPaddingOnRuler: widget.extendedPaddingOnRuler!,
          showRulers: widget.showRulers!,
          topPaddingForRulers: widget.topPaddingForRulers!,
          topPaddingForLabel: widget.topPaddingForLabel!,
          showGaugeContainer: widget.showGaugeContainer!,
          vitalRulerWidth: widget.vitalRulerWidth!,
          showLabels: widget.showLabels!,
          textStyle: widget.textStyle!,
        ),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  ///
  ///
  final double start;

  ///
  ///
  final double end;

  ///
  ///
  ///
  final double steps;

  ///
  ///
  final Color rulerColor;

  ///
  ///
  final GaugeOrientation gaugeOrientation;

  ///
  ///
  ///
  final bool showRulers;

  //
  //
  final bool showLabels;

  //
  //
  final double extendedPaddingOnRuler;

  ///
  ///
  final double topPaddingForRulers;

  ///
  ///
  final double topPaddingForLabel;

  ///
  ///
  final bool showGaugeContainer;

  ///
  ///
  final double vitalRulerWidth;

  ///
  ///
  final Map<double?, String?> _labelMap = <double?, String?>{};

  late Size _size;

  late Rect _gaugeContainer = Rect.zero;

  final TextStyle textStyle;

  late double _gaugeContainerHeight = 6.0;
  late double _gaugeContainerWidth;

  // Using to know till which offset the drawGaugeContainer should be drawn
  late Offset lastOffset;

  late double axisOffset;

  final List<LinearGaugeLabel> _listLinerGaugeLabel = [];

  final TextPainter _textPainter =
      TextPainter(textDirection: TextDirection.ltr);

  late Size _rulerActualSize, _minLabelSize, _maxLabelSize;
  late double _singleRulerTop, _labelTop;

  final Paint _rulerPaint = Paint();

  // ignore: prefer_typing_uninitialized_variables
  double _parentWidgetHeight = 0.0;
  double _parentWidgetWidth = 0.0;

  double _parentWidgetSize = 0.0;

  double _maxLabelHeight = 0;
  double _maxLabelWidth = 0;

  double maximumLabels = 3;

  final Path _path = Path();

  final Paint _gaugeContainerPaint = Paint();

  GaugePainter({
    required this.start,
    required this.end,
    required this.steps,
    required this.rulerColor,
    required this.gaugeOrientation,
    required this.extendedPaddingOnRuler,
    required this.showRulers,
    required this.showLabels,
    required this.topPaddingForRulers,
    required this.topPaddingForLabel,
    required this.showGaugeContainer,
    required this.vitalRulerWidth,
    required this.textStyle,
  });

  void setUpConstraints(Size size) {
    _parentWidgetHeight = size.height;
    _parentWidgetWidth = size.width;
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      _parentWidgetSize = _parentWidgetWidth;
    } else {
      _parentWidgetSize = _gaugeContainerHeight;
    }

    final double heightOfRuler = getHeightOfRuler();

    calculateRulerElementPositions();

    if (gaugeOrientation == GaugeOrientation.horizontal) {
      _rulerActualSize = Size(_parentWidgetSize, heightOfRuler);
    } else {
      _rulerActualSize = Size(heightOfRuler, _parentWidgetSize);
    }

    _size = size;
  }

  double getEffectiveLabelSize() {
    _maxLabelHeight = 0;
    _maxLabelWidth = 0;

    if (showLabels) {
      for (final LinearGaugeLabel element in _listLinerGaugeLabel) {
        final Size labelSize = _labelSize(element.value);
        _maxLabelHeight = math.max(_maxLabelHeight, labelSize.height);
        _maxLabelWidth = math.max(_maxLabelWidth, labelSize.width);
      }

      return (gaugeOrientation == GaugeOrientation.horizontal
              ? _maxLabelHeight
              : _maxLabelWidth) +
          topPaddingForLabel;
    }

    return 0;
  }

  void calculateRulerElementPositions() {
    final double singleRulerMarginSize = showRulers ? topPaddingForRulers : 0;
    final double labelMarginSize = showLabels ? topPaddingForLabel : 0;
    final double singleRulerSize = getTickSize() - singleRulerMarginSize;
    final double axisSize = getAxisLineThickness();
    axisOffset = 0;
    _singleRulerTop = showRulers ? axisSize + singleRulerMarginSize : 0;
    _labelTop = showLabels ? (axisSize + singleRulerSize + labelMarginSize) : 0;
  }

  double get trivialTickLength => _trivialTickLength;
  // Needs to be Configured
  double _trivialTickLength = 5;

  set trivialTickLength(double value) {
    if (value == _trivialTickLength) {
      return;
    }
    _trivialTickLength = value;
  }

  double get trivialTickThickness => _trivialTickThickness;
  // TODO ::  Needs to be Configure
  double _trivialTickThickness = 1;

  /// Sets the majorTickThickness for [RenderLinearAxis].
  set trivialTickThickness(double value) {
    if (value == _trivialTickThickness) {
      return;
    }

    _trivialTickThickness = value;
  }

  double get vitalTickLength => _vitalTickLength;
  // Needs to be Configured
  double _vitalTickLength = 10;

  set vitalTickLength(double value) {
    if (value == _vitalTickLength) {
      return;
    }
    _vitalTickLength = value;
  }

  double get thickness => _gaugeContainerHeight;
  // Needs to be Configured

  set thickness(double value) {
    if (value == _gaugeContainerHeight) {
      return;
    }
    _gaugeContainerHeight = value;
  }

  /// Gets the borderWidth assigned to [RenderLinearAxis].
  double get borderWidth => _borderWidth;
  double _borderWidth = 0.0;

  /// Sets the borderWidth for [RenderLinearAxis]..
  set borderWidth(double value) {
    if (value == _borderWidth) {
      return;
    }
    _borderWidth = value;
  }

  double getTickSize() => showRulers
      ? (math.max(vitalTickLength, trivialTickLength) + topPaddingForRulers)
      : 0;

  double getLabelSize() {
    _maxLabelHeight = 0;
    _maxLabelWidth = 0;

    if (showRulers) {
      for (final LinearGaugeLabel element in _listLinerGaugeLabel) {
        final Size labelSize = _labelSize(element.value);
        _maxLabelHeight = math.max(_maxLabelHeight, labelSize.height);
        _maxLabelWidth = math.max(_maxLabelWidth, labelSize.width);
      }

      return (gaugeOrientation == GaugeOrientation.horizontal
              ? _maxLabelHeight
              : _maxLabelWidth) +
          topPaddingForLabel;
    }

    return 0;
  }

  double getAxisLineThickness() => showGaugeContainer ? thickness : 0;

  double getHeightOfRuler() {
    late double heightOfRulerWidget;
    final double singleRulerMarginSize = showRulers ? topPaddingForRulers : 0;
    final double labelSize = getLabelSize();
    final double singleRulerSize = getTickSize() - singleRulerMarginSize;
    final double axisSize = getAxisLineThickness();
    heightOfRulerWidget = axisSize + singleRulerSize + labelSize;

    if (singleRulerMarginSize > labelSize) {
      heightOfRulerWidget += singleRulerMarginSize - labelSize;
    }
    return heightOfRulerWidget;
  }

  double calculateInterval(Size size) {
    /// Indicates the distance from start point to end point which can never
    /// be negative, Therefore we are using `abs()` to get the number regardless
    /// of its sign
    final double distance = (end - start).abs();

    /// Edge case where we might get a value in less then 0
    /// Therefore we are using `math.max(value,1.0)`
    /// if value is less then 1 so we always get max as 1
    final double gaugeLengthInQuotient =
        GaugeOrientation.horizontal == gaugeOrientation
            ? math.max((size.width * maximumLabels) / 100, 1.0)
            : math.max((maximumLabels * size.height) / 100, 1.0);

    /// Getting the distance where we can have the labels set on gauge
    double distanceBetweenTwoLabels = distance / gaugeLengthInQuotient;

    /// Min number of interval we can have on the gauge
    /// This  source for the bellow formula is internet
    final num minInterval = math.pow(
        10, (math.log(distanceBetweenTwoLabels) / math.log(10)).floor());

    final List<double> listOfDivision = [10, 5, 2, 1];

    for (final double div in listOfDivision) {
      final double thisInterval = minInterval * div;
      if (gaugeLengthInQuotient < (distance / thisInterval)) {
        break;
      }

      distanceBetweenTwoLabels = thisInterval;
    }

    return distanceBetweenTwoLabels;
  }

  void _generateVisibleLabels(Size size) {
    _listLinerGaugeLabel.clear();
    double interval = calculateInterval(size);
    for (double i = start; i <= end; i += interval) {
      final LinearGaugeLabel linearGaugeLabel =
          LinearGaugeLabel(text: i.toString(), value: i);
      _listLinerGaugeLabel.add(linearGaugeLabel);
    }
    print(_listLinerGaugeLabel);
    _minLabelSize = _labelSize(start);
    _maxLabelSize = _labelSize(end);
    _labelMap.clear();
    for (final LinearGaugeLabel element in _listLinerGaugeLabel) {
      _labelMap[element.value] = element.text;
    }
  }

  void generateLabels(Size size) {
    final double actualParentWidth = size.width;
    final double actualParentHeight = size.height;

    /// Creates the axis labels.
    _generateVisibleLabels(Size(actualParentWidth, actualParentHeight));

    _minLabelSize = _labelSize(start);
    _maxLabelSize = _labelSize(end);
  }

  Size _labelSize(double? value) {
    final String? label = _labelMap[value];
    final TextSpan textSpan = TextSpan(
      text: label,
      style: const TextStyle(
          fontSize: 12.0,
          fontStyle: FontStyle.normal,
          color: Colors.black,
          fontWeight: FontWeight.normal),
    );

    _textPainter.text = textSpan;
    _textPainter.layout();

    return Size(_textPainter.width, _textPainter.height);
  }

  double convertLabelValueToFactor(double value,
      {bool isTickPositionCalculation = false}) {
    if (value > end) {
      value = end;
    } else if (value < start) {
      value = start;
    }

    double factor;

    factor = (value - start) / (end - start);

    if (gaugeOrientation == GaugeOrientation.horizontal) {
      factor = factor;
    } else {
      factor = 1 - factor;
    }

    return factor;
  }

  double? _gettrivialTickGap(int index) {
    double endValuePosition;
    if (_listLinerGaugeLabel.length - 1 == index) {
      return null;
    } else {
      endValuePosition = convertLabelValueToPixel(
          _listLinerGaugeLabel[index + 1].value!,
          isTickPositionCalculation: true);
    }

    final double width = (endValuePosition -
                convertLabelValueToPixel(_listLinerGaugeLabel[index].value!,
                    isTickPositionCalculation: true))
            .abs() /
        (steps + 1);

    return width * (false ? -1 : 1);
  }

  double? _getTrivialTickValueGap(int index) {
    if (_listLinerGaugeLabel.length - 1 == index) {
      return null;
    } else {
      return (_listLinerGaugeLabel[index + 1].value! -
              _listLinerGaugeLabel[index].value!) /
          steps;
    }
  }

  void drawTrivialTicks(double trivialTickLeftPosition, double top,
      int majorTickIndex, Canvas canvas) {
    final double? trivialTickGap = _gettrivialTickGap(majorTickIndex);

    /// will be used when we are using different color for different page
    final double? valueGap = _getTrivialTickValueGap(majorTickIndex);
    if (trivialTickGap != null) {
      for (int trivialTickIndex = 1;
          trivialTickIndex <= steps;
          trivialTickIndex++) {
        if (gaugeOrientation == GaugeOrientation.horizontal) {
          trivialTickLeftPosition += trivialTickGap;
        } else {
          top += trivialTickGap;
        }

        _rulerPaint.strokeWidth = trivialTickThickness;

        var v = trivialTickLeftPosition +
            (!(gaugeOrientation == GaugeOrientation.horizontal)
                ? trivialTickLength
                : 0);

        _drawSingleRuler(
            Offset(trivialTickLeftPosition, top),
            Offset(
                v,
                top +
                    (gaugeOrientation == GaugeOrientation.horizontal
                        ? trivialTickLength
                        : 0)),
            canvas,
            false);
      }
    }
  }

  /// Returns the pixel position based on value.
  double convertLabelValueToPixel(double value,
      {bool isTickPositionCalculation = false}) {
    final double factor = convertLabelValueToFactor(value,
        isTickPositionCalculation: isTickPositionCalculation);

    double? labelStartPadding = _getStartPadding();
    double? labelEndPadding = _getEndPadding();

    if (extendedPaddingOnRuler > 0) {
      if (extendedPaddingOnRuler >= labelStartPadding) {
        labelStartPadding = extendedPaddingOnRuler;
      }

      if (extendedPaddingOnRuler >= labelEndPadding) {
        labelEndPadding = extendedPaddingOnRuler;
      }
    }

    return factor *
        ((gaugeOrientation == GaugeOrientation.horizontal
                ? _rulerActualSize.width
                : _rulerActualSize.height) -
            (labelStartPadding + labelEndPadding));
  }

  double _getStartPadding() {
    // show labels
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      return _minLabelSize.width / 2;
    } else {
      // Needs to have logic which can be used for vertical;
      return 0;
    }
  }

  double _getEndPadding() {
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      return _maxLabelSize.width / 2;
    } else {
      return 0;
    }
  }

  void _drawSingleRuler(Offset majorTickStartOffset, Offset majorTickEndOffset,
      Canvas canvas, bool isMajorTick) {
    canvas.drawLine(majorTickStartOffset, majorTickEndOffset, _rulerPaint);
  }

  void drawRulersAndLabels(Canvas canvas, Size size) {
    final double vitalTickLeftPosition =
        math.max(_getStartPadding(), extendedPaddingOnRuler);
    Offset rulerStartPoint, rulerEndPoint;
    for (int index = 0; index < _listLinerGaugeLabel.length; index++) {
      _rulerPaint.shader = null;
      //  TODO :  Should set the range colors for labels
      _rulerPaint.strokeWidth = vitalRulerWidth;
      final double valueToPixel = convertLabelValueToPixel(
              _listLinerGaugeLabel[index].value!,
              isTickPositionCalculation: true) +
          vitalTickLeftPosition;

      rulerStartPoint = Offset(valueToPixel, _singleRulerTop);
      rulerEndPoint = Offset(valueToPixel, _singleRulerTop + vitalTickLength);

      if (gaugeOrientation == GaugeOrientation.vertical) {
        rulerStartPoint = Offset(rulerStartPoint.dy, rulerStartPoint.dx);
        rulerEndPoint = Offset(rulerEndPoint.dy, rulerEndPoint.dx);
      }

      if (showRulers) {
        _drawSingleRuler(Offset(rulerStartPoint.dx, rulerStartPoint.dy),
            Offset(rulerEndPoint.dx, rulerEndPoint.dy), canvas, true);
        drawTrivialTicks(rulerStartPoint.dx, rulerStartPoint.dy, index, canvas);
      }

      if (showLabels) {
        _drawLabels(canvas, index, rulerStartPoint.dx, rulerStartPoint.dy);
      }
    }
  }

  ui.TextStyle _getTextStyle(
      {double textScaleFactor = 1.0, required TextStyle style, Color? color}) {
    double animationValue = 1;

    if (color != null) {
      color = color.withOpacity(animationValue * color.opacity);
    }

    return ui.TextStyle(
      color: color,
      decoration: style.decoration,
      decorationColor: style.decorationColor,
      decorationStyle: style.decorationStyle,
      decorationThickness: style.decorationThickness,
      fontWeight: style.fontWeight,
      fontStyle: style.fontStyle,
      textBaseline: style.textBaseline,
      fontFamily: style.fontFamily,
      fontFamilyFallback: style.fontFamilyFallback,
      fontSize:
          style.fontSize == null ? null : style.fontSize! * textScaleFactor,
      letterSpacing: style.letterSpacing,
      wordSpacing: style.wordSpacing,
      height: style.height,
      locale: style.locale,
      foreground: style.foreground,
      background: style.background ??
          (style.backgroundColor != null
              ? (Paint()..color = style.backgroundColor!)
              : null),
      shadows: style.shadows,
      fontFeatures: style.fontFeatures,
    );
  }

  void _drawLabels(Canvas canvas, int majorTickIndex,
      double majorTickLeftPosition, double top) {
    final ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
        textDirection: TextDirection.ltr, textAlign: TextAlign.left);
    final String labelText =
        _labelMap[_listLinerGaugeLabel[majorTickIndex].value]!;
    final double value = _listLinerGaugeLabel[majorTickIndex].value!;
    final ui.TextStyle labelTextStyle =
        _getTextStyle(style: textStyle, color: textStyle.color);
    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(labelTextStyle)
          ..addText(labelText);
    final ui.Paragraph paragraph = paragraphBuilder.build();
    final Size labelSize = _labelSize(value);
    paragraph.layout(ui.ParagraphConstraints(width: labelSize.width));

    Offset labelOffset;

    if (gaugeOrientation == GaugeOrientation.horizontal) {
      final double labelLeftPosition =
          majorTickLeftPosition - (labelSize.width / 2);
      labelOffset = Offset(labelLeftPosition, _labelTop);
    } else {
      final double labelLeftPosition = top - (labelSize.height / 2);

      if (_labelTop == 0 && _maxLabelWidth > labelSize.width) {
        labelOffset =
            Offset(_maxLabelWidth - labelSize.width, labelLeftPosition);
      } else {
        labelOffset = Offset(_labelTop, labelLeftPosition);
      }
    }

    canvas.drawParagraph(paragraph, labelOffset);
  }

  void _drawAxisLine(Canvas canvas, Offset offset) {
    double startLabelPadding = _getStartPadding();
    double endLabelPadding = _getEndPadding();

    if (startLabelPadding > extendedPaddingOnRuler) {
      startLabelPadding = startLabelPadding - extendedPaddingOnRuler;
    } else {
      startLabelPadding = 0;
    }

    if (endLabelPadding > extendedPaddingOnRuler) {
      endLabelPadding = endLabelPadding - extendedPaddingOnRuler;
    } else {
      endLabelPadding = 0;
    }

    if (gaugeOrientation == GaugeOrientation.horizontal) {
      _gaugeContainer = Rect.fromLTWH(
          offset.dx + startLabelPadding,
          offset.dy + axisOffset,
          _size.width - (startLabelPadding + endLabelPadding),
          thickness);
    } else {
      _gaugeContainer = Rect.fromLTWH(
          offset.dx + axisOffset,
          offset.dy + startLabelPadding,
          thickness,
          _size.height - (startLabelPadding + endLabelPadding));
    }

    _gaugeContainer = Rect.fromLTWH(
        _gaugeContainer.left + borderWidth / 2,
        _gaugeContainer.top + borderWidth / 2,
        _gaugeContainer.width - borderWidth,
        _gaugeContainer.height - borderWidth);

    if (showRulers) {
      _gaugeContainerPaint.style = PaintingStyle.fill;
      _gaugeContainerPaint.color = Colors.grey;

      _path.reset();
      _path.addRect(_gaugeContainer);

      canvas.drawPath(_path, _rulerPaint);

      if (borderWidth > 0) {
        _gaugeContainerPaint.shader = null;
        _gaugeContainerPaint.style = PaintingStyle.stroke;
        _gaugeContainerPaint.strokeWidth = borderWidth;
        _gaugeContainerPaint.color = Colors.black;
        canvas.drawPath(_path, _gaugeContainerPaint);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    _gaugeContainerWidth = size.width;
    _rulerPaint.color = Colors.black;

    setUpConstraints(size);
    if (gaugeOrientation == GaugeOrientation.horizontal) {
      generateLabels(size);
      //canvas.drawRect(rect, _rulerPaint);
      drawRulersAndLabels(canvas, size);
      _drawAxisLine(canvas, const Offset(0.0, 0.0));
    }
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) {
    return false;
  }
}
