import 'dart:math';
import 'package:flutter/material.dart';
import 'package:warehouse_erp/utils/utils.dart';

class UniqueColorGenerator {
  static Color getColor() {
    final Random random = Random();
    final Color clr = Color.fromARGB(
      170,
      random.nextInt(225) + 30,
      random.nextInt(255),
      random.nextInt(255),
    );
    return clr != Colors.white ? clr : Colors.orangeAccent;
  }

  /// [getDualColors] gives two colors back,
  /// first is for text, and second is for background
  static List<Color> getDualColors() {
    final randm = Random().nextInt(Pallete.colorCombi.length);
    final key = Pallete.colorCombi.entries.toList()[randm].key;
    final Color textColor = Pallete.colorCombi[key]?['text'] ?? Colors.black;
    final Color backgroundColor =
        Pallete.colorCombi[key]?['background'] ?? Colors.orangeAccent;
    return [textColor, backgroundColor];
  }
}
