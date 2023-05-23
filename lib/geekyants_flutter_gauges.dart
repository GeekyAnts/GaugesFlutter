/// The *Geekyants* FlutterGauges package in Flutter is a customizable widget that
/// displays a linear gauge. It can be customized with various features  to
/// visually indicate the progress of a task, the completion percentage of a
///  project, or any other numerical value that needs to be displayed on a
/// linear scale.
///
/// Start using the package by importing the library in your Dart code:
/// ```dart
/// import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';/// ```
///
/// ### Useful Links
/// * [ShowCase App](https://gauges-showcase.vercel.app/#/) - A showcase app for the package with UseCases and PlayGrounds.
/// * [More from GeekyAnts](https://github.com/GeekyAnts)

library gauges;

export './src/linear_gauge/linear_gauge.dart';
export './src/linear_gauge/pointers/linear_gauge_pointer.dart';
export './src/linear_gauge/pointers/linear_gauge_shape_pointer.dart';
export './src/linear_gauge/pointers/linear_gauge_widget_pointer.dart';

export './src/linear_gauge/pointers/linear_gauge_widget_pointer_painter.dart';
export './src/linear_gauge/pointers/linear_gauge_shape_pointer_painter.dart';
export './src/linear_gauge/linear_gauge_state.dart';
export './src/linear_gauge/styles/linear_gauge_ruler_style.dart';
export './src/linear_gauge/styles/linear_gauge_container_style.dart';
export './src/linear_gauge/range_linear_gauge/range_linear_gauge.dart';
export './src/linear_gauge/custom_label/custom_ruler_label.dart';
export './src/linear_gauge/value_bar/value_bar.dart';
export './src/linear_gauge/utils/enums.dart';
export './src/linear_gauge/curve/custom_curve.dart';
export './src/radial_gauge/radial_gauge.dart';
export './src/radial_gauge/radial_track.dart';
export 'src/radial_gauge/pointer/needle_pointer.dart';
export 'src/radial_gauge/valuebar/radial_value_bar.dart';
