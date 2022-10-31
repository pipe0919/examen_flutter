// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:ui';

class Adapt {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static final double _width = mediaQuery.size.width;
  static final double _height = mediaQuery.size.height;

  static var _ratio = init(1080);
  static init(int number) {
    int uihight = number > 0 ? number : 1080;
    MediaQueryData mediaQuery2 = MediaQueryData.fromWindow(window);
    _ratio = mediaQuery2.size.height / uihight;
  }

  static px(number) {
    if (!(_ratio is double || _ratio is int) || _ratio == 0.0) {
      Adapt.init(1080);
    }
    return number * _ratio;
  }

  static double wp(percentage) {
    double result = (percentage * _width) / 100;
    return result;
  }

  static double hp(percentage) {
    double result = (percentage * _height) / 100;
    return result;
  }
}
