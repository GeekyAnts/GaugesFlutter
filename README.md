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
# Gauges

A gauge, in science and engineering, is a device used to make measurements or in order to display certain dimensional information. A wide variety of tools exist which serve such functions, ranging from simple pieces of material against which sizes can be measured to complex pieces of machinery.

## Features

LinerGauge 

## Getting started

Run this command 

```

$flutter pub add gauges

```

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```
dependencies:
  gauges: ^0.0.1
```



## Usage

Import it inside your main.dart

```
import 'package:gauges/gauges.dart';

```

Use it as below

```dart
class _MyGaugeExampleState extends State<MyGaugeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const LinearGauge(
          ),
        ),
      ),
    );
  }
}
```





## Screens

<img src="https://github.com/hasnentai/GaugesFlutter/blob/stable/example/screens/screen-two.png" width="250" alt="accessibility text">




