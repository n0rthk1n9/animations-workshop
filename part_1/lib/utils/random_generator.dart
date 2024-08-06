import 'dart:math';

import 'package:flutter/material.dart';

class RandomGenerator {
  static Color getColor() {
    final r = Random().nextInt(256);
    final g = Random().nextInt(256);
    final b = Random().nextInt(256);
    final opacity = Random().nextDouble();
    return Color.fromRGBO(r, g, b, opacity);
  }

  static Size getSize({maxSize = 250}) {
    final width = Random().nextInt(maxSize - 100) + 100;
    final height = Random().nextInt(maxSize - 100) + 100;
    return Size(width.toDouble(), height.toDouble());
  }
}
