import 'dart:math';
import 'package:flutter/material.dart';

class UniqueColorGenerator {
  static Random random = Random();
  static Color getColor() {
    final Color clr = Color.fromARGB(
      30,
      random.nextInt(225) + 30,
      random.nextInt(255),
      random.nextInt(255),
    );
    return clr != Colors.white ? clr : Colors.orangeAccent;
  }
}
