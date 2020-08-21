import 'dart:math';

import 'package:flutter/material.dart';

class ColorTheme {
  final _random = new Random();

  var _bgColors = [
    Colors.blueAccent,
    Colors.cyanAccent,
    Colors.deepPurple,
    Colors.lightBlueAccent,
    Colors.yellowAccent,
    Colors.lightGreen,
    Colors.indigoAccent,
    Colors.deepOrangeAccent,
    Colors.brown,
  ];

  static ColorTheme _colorTheme;

  ColorTheme._internal();

  factory ColorTheme() {
    if (_colorTheme == null) _colorTheme = new ColorTheme._internal();

    return _colorTheme;
  }

  Color randomBgColor() {
    return _bgColors[_random.nextInt(_bgColors.length)];
  }
}
