import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

import '../../../usecase/showcase_app/data.dart';

class PointerPlayGround extends StatefulWidget {
  const PointerPlayGround({super.key});

  @override
  State<PointerPlayGround> createState() => _PointerPlayGroundState();
}

class _PointerPlayGroundState extends State<PointerPlayGround> {
  // Configurations
  PointerShape shape = PointerShape.triangle;
  double value = 0;
  PointerPosition position = PointerPosition.center;
  double height = 10;
  double width = 10;
  bool reverse = false;
  PointerAlignment alignment = PointerAlignment.center;
  GaugeOrientation orientation = GaugeOrientation.horizontal;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Flex(
      direction: screenWidth > 600 ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LinearGaugeView(
            value: value,
            height: height,
            width: width,
            shape: shape,
            position: position,
            alignment: alignment,
            orientation: orientation,
            reverse: reverse),
        Flexible(
          flex: 1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                child: Container(
                  color: backgroundColor,
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height,
                  width: 700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Gauge Orientation'),
                      buildOrientationHandler(),
                      const Divider(),
                      const Text('Inverse axis'),
                      inverseAxisHandler(),
                      const Divider(),
                      const Text('Value'),
                      buildValueHandler(),
                      const Divider(),
                      const Text('Pointer Shape'),
                      buildPointerWidgetHandler(),
                      const Divider(),
                      const Text('Pointer Position'),
                      buildPointerPositionHandler(),
                      const Divider(),
                      const Text('Pointer Alignment'),
                      buildPointerAlignmentHandler(),
                      const Divider(),
                      const Text('Pointer Height'),
                      buildPointerHeightHandler(),
                      const Text('Pointer Width'),
                      buildPointerWidthHandler(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  buildOrientationHandler() {
    return Row(
      children: [
        Radio<GaugeOrientation>(
          value: GaugeOrientation.horizontal,
          groupValue: orientation,
          onChanged: (GaugeOrientation? value) {
            setState(() {
              orientation = value!;
            });
          },
        ),
        const Text('Horizontal'),
        Radio<GaugeOrientation>(
          value: GaugeOrientation.vertical,
          groupValue: orientation,
          onChanged: (GaugeOrientation? value) {
            setState(() {
              orientation = value!;
            });
          },
        ),
        const Text('Vertical'),
      ],
    );
  }

  Widget inverseAxisHandler() {
    return GestureDetector(
      onTap: () {
        setState(() {
          reverse = !reverse;
        });
      },
      child: Row(
        children: <Widget>[
          Checkbox(
              activeColor: Colors.red,
              value: reverse,
              splashRadius: 15,
              onChanged: (bool? value) {
                setState(() {
                  if (value != null) {
                    reverse = value;
                  }
                });
              }),
          const Text('Inverse axis', style: TextStyle(fontSize: 14))
        ],
      ),
    );
  }

  Widget buildPointerWidgetHandler() {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0),
          child: const Text('Pointer Shape', style: TextStyle(fontSize: 14)),
        ),
        const Text(':'),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                  value: shape.toString(),
                  items: const [
                    DropdownMenuItem(
                      value: 'PointerShape.circle',
                      child: Text('circle'),
                    ),
                    DropdownMenuItem(
                      value: 'PointerShape.rectangle',
                      child: Text('rectangle'),
                    ),
                    DropdownMenuItem(
                      value: 'PointerShape.triangle',
                      child: Text('triangle'),
                    ),
                    DropdownMenuItem(
                      value: 'PointerShape.diamond',
                      child: Text('diamond'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      handleShapeChange(value);
                    });
                  })),
        )
      ],
    );
  }

  void handleShapeChange(String? value) {
    if (value != null) {
      if (value == 'PointerShape.circle') {
        shape = PointerShape.circle;
      }
      if (value == 'PointerShape.rectangle') {
        shape = PointerShape.rectangle;
      }
      if (value == 'PointerShape.triangle') {
        shape = PointerShape.triangle;
      }
      if (value == 'PointerShape.diamond') {
        shape = PointerShape.diamond;
      }
    }
  }

  buildPointerPositionHandler() {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0),
          child: const Text('Pointer Position', style: TextStyle(fontSize: 14)),
        ),
        const Text(':'),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                  value: position.toString(),
                  items: const [
                    DropdownMenuItem(
                      value: 'PointerPosition.center',
                      child: Text('center'),
                    ),
                    DropdownMenuItem(
                      value: 'PointerPosition.top',
                      child: Text('top'),
                    ),
                    DropdownMenuItem(
                      value: 'PointerPosition.bottom',
                      child: Text('bottom'),
                    ),
                    DropdownMenuItem(
                      value: 'PointerPosition.left',
                      child: Text('left'),
                    ),
                    DropdownMenuItem(
                      value: 'PointerPosition.right',
                      child: Text('right'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      handlePositionChange(value);
                    });
                  })),
        )
      ],
    );
  }

  void handlePositionChange(String? value) {
    if (orientation == GaugeOrientation.horizontal &&
        (position == PointerPosition.left ||
            position == PointerPosition.right)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          padding: EdgeInsets.all(8),
          content: Text(
            '⚠️ Invalid Pointer Position',
          ),
          backgroundColor: Colors.red,
          showCloseIcon: true,
        ),
      );
    }
    if (value != null) {
      if (value == 'PointerPosition.center') {
        position = PointerPosition.center;
      }
      if (value == 'PointerPosition.top') {
        position = PointerPosition.top;
      }
      if (value == 'PointerPosition.bottom') {
        position = PointerPosition.bottom;
      }
      if (value == 'PointerPosition.left') {
        position = PointerPosition.left;
      }
      if (value == 'PointerPosition.right') {
        position = PointerPosition.right;
      }
    }
  }

  buildPointerAlignmentHandler() {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0),
          child:
              const Text('Pointer Alignment', style: TextStyle(fontSize: 14)),
        ),
        const Text(':'),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                  value: alignment.toString(),
                  items: const [
                    DropdownMenuItem(
                      value: 'PointerAlignment.center',
                      child: Text('center'),
                    ),
                    DropdownMenuItem(
                      value: 'PointerAlignment.start',
                      child: Text('start'),
                    ),
                    DropdownMenuItem(
                      value: 'PointerAlignment.end',
                      child: Text('end'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      handleAlignmentChange(value);
                    });
                  })),
        )
      ],
    );
  }

  void handleAlignmentChange(String? value) {
    if (value != null) {
      if (value == 'PointerAlignment.center') {
        alignment = PointerAlignment.center;
      }
      if (value == 'PointerAlignment.start') {
        alignment = PointerAlignment.start;
      }
      if (value == 'PointerAlignment.end') {
        alignment = PointerAlignment.end;
      }
    }
  }

  buildValueHandler() {
    return Slider(
        min: 0,
        max: 100,
        value: value,
        onChanged: (double value) {
          setState(() {
            this.value = value;
          });
        });
  }

  buildPointerHeightHandler() {
    return Slider(
        min: 10,
        max: 100,
        value: height,
        onChanged: (double value) {
          setState(() {
            height = value;
          });
        });
  }

  buildPointerWidthHandler() {
    return Slider(
        min: 10,
        max: 100,
        value: width,
        onChanged: (double value) {
          setState(() {
            width = value;
          });
        });
  }
}

class LinearGaugeView extends StatelessWidget {
  const LinearGaugeView({
    super.key,
    required this.value,
    required this.height,
    required this.width,
    required this.shape,
    required this.position,
    required this.alignment,
    required this.orientation,
    required this.reverse,
  });

  final double value;
  final double height;
  final double width;
  final PointerShape shape;
  final PointerPosition position;
  final PointerAlignment alignment;
  final GaugeOrientation orientation;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: LinearGauge(
            pointers: [
              Pointer(
                  value: value,
                  height: height,
                  width: width,
                  shape: shape,
                  pointerPosition: position,
                  pointerAlignment: alignment),
            ],
            gaugeOrientation: orientation,
            rulers: RulerStyle(
              inverseRulers: reverse,
              rulerPosition: RulerPosition.center,
            ),
          ),
        ),
      ),
    );
  }
}
