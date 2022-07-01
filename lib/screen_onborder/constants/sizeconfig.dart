import 'package:flutter/material.dart';

class SizeConfigOnborder {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defautSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Function Size Text == Size Image
double getProportionateScreenHeight(double inputHeight) {
  double? screenHeight = SizeConfigOnborder.screenHeight;
  return (inputHeight / 812.0) * screenHeight!;
}

// Function Size Text == Size Image
double getProportionateScreenWidth(double inputWidht) {
  double? screenWidth = SizeConfigOnborder.screenWidth;
  return (inputWidht / 375.0) * screenWidth!;
}
