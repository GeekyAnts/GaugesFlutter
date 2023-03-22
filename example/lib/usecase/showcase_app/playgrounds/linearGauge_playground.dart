import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class LinearGaugePlayGround extends StatefulWidget {
  const LinearGaugePlayGround({super.key});

  @override
  State<LinearGaugePlayGround> createState() => _LinearGaugePlayGroundState();
}

class _LinearGaugePlayGroundState extends State<LinearGaugePlayGround> {
  // Configurations
  GaugeOrientation orientation = GaugeOrientation.horizontal;
  double _valueBarOffset = 0;
  PointerShape shape = PointerShape.triangle;
  bool isHorizontal = true;
  double value = 0;
  bool reverse = false;

  ValueBarPosition _valueBarPosition = ValueBarPosition.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Container(
                margin: const EdgeInsets.only(left: 30),
                // color: Colors.red,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 1,
                child: Center(
                  child: LinearGauge(
                      pointers: [
                        Pointer(value: 50, shape: shape)
                      ],
                      valueBar: [
                        ValueBar(
                            value: 75,
                            position: _valueBarPosition,
                            offset: _valueBarOffset),
                      ],
                      gaugeOrientation: isHorizontal
                          ? GaugeOrientation.horizontal
                          : GaugeOrientation.vertical,
                      rulers: RulerStyle(
                          rulerPosition: RulerPosition.center,
                          inverseRulers: reverse)),
                )),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Pointers"),
                    // Inverse Axis
                    GestureDetector(
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
                          const Text('Inverse axis',
                              style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),
                    // Horizontal Orientation
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          reverse = !reverse;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                            child: Checkbox(
                                activeColor: Colors.red,
                                value: isHorizontal,
                                splashRadius: 15,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value != null) {
                                      isHorizontal = value;
                                    }
                                  });
                                }),
                          ),
                          const Text('Horizontal Orientation',
                              style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),

                    // Value Bar
                    buildValueBar(),

                    //  Bar Offset
                    buildBarOffset(),

                    // Pointer Shape
                    buildPointerShapes(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildValueBar() {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0),
          child:
              const Text('ValueBar position', style: TextStyle(fontSize: 14)),
        ),
        const Text(':'),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                  value: _valueBarPosition.toString(),
                  items: const [
                    DropdownMenuItem(
                      value: 'ValueBarPosition.top',
                      child: Text('top'),
                    ),
                    DropdownMenuItem(
                      value: 'ValueBarPosition.bottom',
                      child: Text('bottom'),
                    ),
                    DropdownMenuItem(
                      value: 'ValueBarPosition.center',
                      child: Text('center'),
                    ),
                  ],
                  onChanged: (String? value) {
                    handleValueBarPositionChange(value);
                  })),
        )
      ],
    );
  }

  void handleValueBarPositionChange(String? value) {
    return setState(() {
      if (value != null) {
        if (value == 'ValueBarPosition.top') {
          _valueBarPosition = ValueBarPosition.top;
        }
        if (value == 'ValueBarPosition.bottom') {
          _valueBarPosition = ValueBarPosition.bottom;
        }
        if (value == 'ValueBarPosition.center') {
          _valueBarPosition = ValueBarPosition.center;
        }
      }
    });
  }

  Row buildPointerShapes() {
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
                    });
                  })),
        )
      ],
    );
  }

  Row buildBarOffset() {
    return Row(
      children: <Widget>[
        Container(
            width: 150,
            margin: const EdgeInsets.only(left: 5),
            child: const Text(
              'Bar offset',
              style: TextStyle(fontSize: 14),
            )),
        Container(
          transform: Matrix4.translationValues(-8, 0, 0),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                _valueBarOffset += 1;
              });
            },
          ),
        ),
        const Text(':'),
        Container(
          transform: Matrix4.translationValues(-8, 0, 0),
          child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                _valueBarOffset -= 1;
              });
            },
          ),
        )
      ],
    );
  }
}
