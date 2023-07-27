<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

<img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/banner.png" alt="accessibility text">

# Gauges

A gauge, in science and engineering, is a device used to make measurements or in order to display certain dimensional information. A wide variety of tools exist which serve such functions, ranging from simple pieces of material against which sizes can be measured to complex pieces of machinery.Here in Flutter you can use this package to plot a machinery information effortlessly.

![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/GeekyAnts/GaugesFlutter/actions.yml?branch=main&label=Package%20Build&style=for-the-badge)
![Pub Points](https://img.shields.io/pub/points/geekyants_flutter_gauges?label=Pub%20Points&style=for-the-badge)
![Pub Popularity](https://img.shields.io/pub/popularity/geekyants_flutter_gauges?style=for-the-badge)
![Pub Likes](https://img.shields.io/pub/likes/geekyants_flutter_gauges?label=Pub%20Likes&style=for-the-badge)

## Demo Application

To fully explore the capabilities of our Linear Gauge, we recommend checking out our Demo Application which consists of Use Cases and Playgrounds for Linear Gauge
[DEMO APPLICATION](https://gauges-showcase.vercel.app/#/)

## Table of contents

- [Getting Started](#getting-started)
- [Linear Gauge](#linear-gauge)

  - [Orientation](#gauge-orientation)
  - [Ruler Style](#rulerStyle)
  - [Pointer](#pointer)
  - [Value Bar](#valuebar)
  - [Range Linear Gauge](#rangelineargauge)
  - [Custom Curve](#customCurve)
  - [Animation](#animation)
  - [Interactivity](#interactivity)

- [Radial Gauge](#radial-gauge)

  - [Position](#position)
  - [Needle Pointer](#needle-pointer)
  - [Shape Pointer](#shape-pointer)
  - [Radial Value Bar](#radial-value-bar)
  - [Interactivity](#interactivity-radial)

- [Demo Application](#demo-application)
- [Credits](#credits)

## Getting started

Run this command

```
$flutter pub add geekyants_flutter_gauges
```

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```dart
dependencies:
  geekyants_flutter_gauges: 1.0.1
```

## Usage

Import it inside your main.dart

```dart
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
```

Use it as below

```dart
class _MyGaugeExampleState extends State<MyGaugeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          rulers: const RulerStyle(
            rulerPosition: RulerPosition.bottom,
          ),
        ),
      ),
    );
  }
}
```

## Linear Gauge

### **Gauge Orientation**:

The linearGauge can be oriented vertically or horizontally. The orientation can be set using the **`Gaugeorientation`** property in the Linear Gauge. The possible values for the orientation property are:

- `GaugeOrientation.horizontal`: The gauge will be oriented horizontally, with the minimum value on the left and the maximum value on the right.

<p align="center"><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/default-horizontal.png" alt="accessibility text" height=300></p>

- `GaugeOrientation.vertical`: The gauge will be oriented vertically, with the minimum value at the bottom and the maximum value at the top.

<p align="center"><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/default-vertical.png" alt="accessibility text" height=700></p>

### **RulerStyle**:

The **RulerStyle** class allows you to customize the appearance of the ruler used in the **LinearGauge**. With properties such as `RulerPosition`, `showLabel`, `inverseRuler`, and many more, you can customize the ruler in various ways to suit your needs.

<img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/RULERSTYLE.png" alt="accessibility text">

### **Pointer**:

The `Pointer` is used to indicate a specific value on the gauge. The gauge can have multiple pointers with various shapes and values

### **ValueBar**

The `ValueBar` in the LinearGauge is the component that displays the actual value of the gauge. It has properties such as `color`, `offset`, and `thickness` that can be customized to fit your needs.

There are different customization options available for pointers and value bar.

<img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/valuebar.png" alt="accessibility text">

### **RangeLinearGauge**

The `RangeLinearGauge` class enables you to customize the ruler appearance in the `LinearGauge`. You can display multiple ranges by providing a list of `RangeLinearGauge` values, and customize the color, start, and end values to match your requirements.

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/range-1.png" alt="accessibility text"></p>
<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/range-2.png" alt="accessibility text"></p>

### **CustomCurve**

The `CustomCurve` class allows you to draw Bezier and Straight curves on the `LinearGauge`, providing a high degree of customization for visualizing data.

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/curve.png" atl="CustomCurve"></p>

### **Animations**

The `LinearGauge` class includes pre-made animations that can be applied to its pointers, value bars, or the gauge's overall visibility. These animations can help to make the gauge more visually engaging and dynamic.

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/animation.gif" alt="animations gif" height=140></p>

### **Interactivity**

The `Pointer` is interactive , it responds to user horizontal & vertical drag.

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/interactivity.gif" alt="animations gif"  height=140></p>

## **Radial Gauge**

A `Radial Gauge` is a graphical representation used to visualize and display a value within a circular format. It consists of several components, including a radial track, a needle pointer, and a value bar. The radial track represents the range or scale of values that the gauge can display, with the ability for users to set the start and end points of the track.

### **Position**:

#### **Angles**

The RadialGauge can be easily laid out at different angles around its center. You have the freedom to specify the starting and ending angles, defining the arc over which the gauge will be displayed. This feature is particularly useful when you want to display multiple gauges side by side or need to emphasize a specific range on the gauge.

Default **`startAngle`** : -30°

Default **`endAngle`**`: 210°

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/radial-angles.png" alt="radial-angels"  height=440></p>

#### **Radii Customization**

`radiusFactor` can be used to size the adjust the scaling factor of the radius and change the radius of the gauge accordingly.

#### **X and Y Coordinates**

To precisely position the RadialGauge on your canvas or user interface, you can set the x and y coordinates of its center. This way, you can easily integrate the gauge into your existing layout or place it at specific locations as per your application's design requirements.

By combining these layout options, you can create stunning and interactive radial gauges that effectively present data to your users, whether it's for monitoring, analytics, or any other visualization needs.

Default **`xCoordinate`** : 0.5

Default **`yCoordinate`**`: 0.5

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/radial-coordinates.gif" alt="radial coordinates"  height=440></p>

# Needle Pointer

The NeedlePointer is a powerful component that enables you to create and customize Needle Pointers for your gauges. With this widget, you have the flexibility to design multiple Needle Pointers and adjust their styles using the **`gaugeNeedle`** and **`plainneedle`** enums.

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/radial-needle.png" alt="radial-needle"  height=440></p>

# Shape Pointer

The RadialShapePointer allows you to add Shape Pointer to your Gauge.The shape can be customized using properties such as color, width and height.

> Currently, Only Circle Shape is supported

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/radial-pointer.png" alt="radial-pointer"  height=440></p>

# Radial Value Bar

The RadialValueBar is a crucial component used within the RadialGauge to visually represent a specific value on the gauge using a bar. This bar provides users with a clear and intuitive indication of the current value within the defined range of the radial track.

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/radial-valueBar.png" alt="radial-valuebar"  height=440></p>

# Interactivity Radial

In the Radial Gauge, the `NeedlePointer` and `RadialShapePointer` can be set to interactive, making them respond to user's horizontal and vertical drag.

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/shape-interactive.gif" alt="pointer-interactive gif"  height=440></p>

<p align='center'><img src="https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/example/screens/needle-interactive.gif" alt="needle-interactive gif"  height=440></p>

## License

[MIT License](https://raw.githubusercontent.com/GeekyAnts/GaugesFlutter/main/LICENSE) , Copyright © 2023 GeekyAnts. See LICENSE for more information.

## Contributors

<a href="https://github.com/GeekyAnts/GaugesFlutter/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=GeekyAnts/GaugesFlutter" />
</a>

## Credits

Made with ❤️ by <a href="https://geekyants.com/" ><img src="https://s3.ap-southeast-1.amazonaws.com/cdn.elitmus.com/sy0zfezmfdovlb4vaz6siv1l7g30" height="17"/></a>
