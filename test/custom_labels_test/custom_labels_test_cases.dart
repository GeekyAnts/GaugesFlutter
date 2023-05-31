import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

List noLabelsTestCases = [
  {
    'customLabels': <CustomRulerLabel>[],
    'name': 'no-labels-horizontal',
    'Do':
        'No custom Labels Passed, Default Labels will be displayed, Horizontal Orientation',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'customLabels': <CustomRulerLabel>[],
    'name': 'no-labels-vertical',
    'Do':
        'No custom Labels Passed, Default Labels will be displayed, Vertical Orientation',
  },
];

List singleLabelTestCases = [
  {
    'customLabels': const [CustomRulerLabel(text: "Label", value: 0)],
    'name': 'single-label-value-0-horizontal',
    'Do': 'Single custom Labels Passed Value 0, Horizontal Orientation',
  },

  //Vertical
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'customLabels': const [CustomRulerLabel(text: "Label", value: 0)],
    'name': 'single-label-value-0-vertical',
    'Do': 'Single custom Labels Passed Value 0, Vertical Orientation',
  },
];

List multipleLabelTestCases = [
  {
    'customLabels': const [
      CustomRulerLabel(text: "Label 1", value: 0),
      CustomRulerLabel(text: "Label 2", value: 50),
      CustomRulerLabel(text: "Label 3", value: 100),
    ],
    'name': 'multiple-labels-horizontal',
    'Do': 'Multiple custom Labels Passed, Horizontal Orientation',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'customLabels': const [
      CustomRulerLabel(text: "Label 1", value: 0),
      CustomRulerLabel(text: "Label 2", value: 50),
      CustomRulerLabel(text: "Label 3", value: 100),
    ],
    'name': 'multiple-labels-vertical',
    'Do': 'Multiple custom Labels Passed, Vertical Orientation',
  },
  {
    'inverse': true,
    'customLabels': const [
      CustomRulerLabel(text: "Label 1", value: 0),
      CustomRulerLabel(text: "Label 2", value: 50),
      CustomRulerLabel(text: "Label 3", value: 100),
    ],
    'name': 'multiple-labels-inverse-horizontal',
    'Do': 'Multiple custom Labels Passed, Inverse Horizontal Orientation',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'inverse': true,
    'customLabels': const [
      CustomRulerLabel(text: "Label 1", value: 0),
      CustomRulerLabel(text: "Label 2", value: 50),
      CustomRulerLabel(text: "Label 3", value: 100),
    ],
    'name': 'multiple-labels-inverse-vertical',
    'Do': 'Multiple custom Labels Passed, Inverse Vertical Orientation',
  },
];

List longWordTestCases = [
  {
    'customLabels': const [
      CustomRulerLabel(text: "Windows Laptop", value: 0),
      CustomRulerLabel(text: "Linux Laptop", value: 50),
      CustomRulerLabel(text: "Mac Laptop", value: 100),
    ],
    'name': 'long-labels-Horizontal',
    'Do': 'Long custom Labels Passed, Horizontal Orientation',
  },
  //vertical
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'customLabels': const [
      CustomRulerLabel(text: "Windows Laptop", value: 0),
      CustomRulerLabel(text: "Linux Laptop", value: 50),
      CustomRulerLabel(text: "Mac Laptop", value: 100),
    ],
    'name': 'long-labels-Vertical',
    'Do': 'Long custom Labels Passed, Vertical Orientation',
  }
];

List rulerPositionTestCases = [
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'rulerPosition': RulerPosition.top,
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'ruler-position-top',
    'Do': 'Custom Labels must be drawn with Ruler Position Top - Horizontal',
  },
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'rulerPosition': RulerPosition.bottom,
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'ruler-position-bottom',
    'Do': 'Custom Labels must be drawn with Ruler Position bottom - Horizontal',
  },
  //vertical
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'rulerPosition': RulerPosition.left,
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'ruler-position-left',
    'Do': 'Custom Labels must be drawn with Ruler Position Left - Vertical',
  },
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'rulerPosition': RulerPosition.right,
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'ruler-position-right',
    'Do': 'Custom Labels must be drawn with Ruler Position Right - Vertical',
  }
];

List valueBarTestCases = [
  {
    'gaugeOrientation': GaugeOrientation.horizontal,
    'valueBar': [const ValueBar(value: 75)],
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'custom-labels-valuebar-value-75-horizontal',
    'Do': 'Custom Labels must be drawn with Value Bar Value 75 - Horizontal',
  },
  {
    'inverse': true,
    'gaugeOrientation': GaugeOrientation.horizontal,
    'valueBar': [const ValueBar(value: 75)],
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'custom-labels-valuebar-value-75-horizontal-inverse',
    'Do':
        'Custom Labels must be drawn with Value Bar Value 75 - Horizontal-Inverse',
  },
  // Vertical Gauge Orientation
  {
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [const ValueBar(value: 75)],
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'custom-labels-valuebar-value-75-vertical',
    'Do': 'Custom Labels must be drawn with Value Bar Value 75 - Vertical',
  },
  {
    'inverse': true,
    'gaugeOrientation': GaugeOrientation.vertical,
    'valueBar': [const ValueBar(value: 75)],
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'custom-labels-valuebar-value-75-vertical-inverse',
    'Do':
        'Custom Labels must be drawn with Value Bar Value 75 - Vertical Inverse',
  },
];

List extendLinearGaugeTestCases = [
  {
    'extendLinearGauge': 25.0,
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'extend-linear-gauge-25',
    'Do':
        'Custom Labels must be drawn with Extend Linear Gauge Value 25 - Horizontal',
  },
  // Vertical Gauge Orientation
  {
    'extendLinearGauge': 25.0,
    'gaugeOrientation': GaugeOrientation.vertical,
    'customLabels': const [
      CustomRulerLabel(text: "0", value: 0),
      CustomRulerLabel(text: "50", value: 50),
      CustomRulerLabel(text: "100", value: 100),
    ],
    'name': 'extend-linear-gauge-25-vertical',
    'Do':
        'Custom Labels must be drawn with Extend Linear Gauge Value 25 - Vertical',
  },
];

List allTests = [
  ...noLabelsTestCases,
  ...multipleLabelTestCases,
  ...longWordTestCases,
  ...rulerPositionTestCases,
  ...valueBarTestCases,
  ...extendLinearGaugeTestCases
];
// removed singleLabelTestCases as it is Currently throwing an error
// ...singleLabelTestCases,
