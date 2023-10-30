import 'package:flutter/material.dart';

class TuColors {
  static Color fieldBG({bool dark = true}) =>
      dark ? TuColors.bg1() : const Color.fromRGBO(134, 179, 172, 0.145);
  static Color primary = const Color.fromRGBO(101, 195, 200, 1);
  static Color primaryFade = const Color.fromRGBO(101, 195, 200, .5);
  static Color secondary = const Color.fromRGBO(56, 128, 255, 1);
  static Color text0 = const Color.fromRGBO(50, 50, 50, 1);
  static Color surface600 = const Color.fromRGBO(89, 89, 89, 1);
  static Color text({bool dark = true}) =>
      dark ? Colors.white70 : const Color.fromRGBO(0, 0, 0, 1);

  static Color text2({bool dark = true}) => dark
      ? const Color.fromRGBO(255, 255, 255, .8)
      : const Color.fromRGBO(15, 15, 15, 0.8);

  static Color text3({bool dark = true}) => dark
      ? const Color.fromRGBO(150, 150, 150, 1)
      : const Color.fromRGBO(15, 15, 15, 0.8);

  static Color note({bool dark = true}) =>
      const Color.fromRGBO(102, 102, 102, 1);
  static Color medium = Color.fromARGB(255, 111, 115, 117);
  static Color danger = const Color.fromRGBO(248, 114, 114, 1);
  static Color success = const Color.fromRGBO(45, 211, 111, 1);

  static Color titlebarBG = const Color.fromRGBO(66, 66, 66, 1);
  static Color bg({bool dark = true}) => dark
      ? const Color.fromRGBO(48, 48, 48, 1)
      : const Color.fromRGBO(239, 234, 230, 1);
  static Color bg0 = const Color.fromRGBO(46, 46, 46, 1);
  static Color bg1({bool dark = true}) => dark
      ? const Color.fromRGBO(56, 56, 56, 1)
      : const Color.fromRGBO(250, 247, 245, 1);
  static Color btnBG = const Color.fromRGBO(30, 30, 30, 1);
}
