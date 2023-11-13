import 'package:flutter/material.dart';
import 'package:tu/tu.dart';

bool theme1 = false;

class TuColors {
  static Color fieldBG({bool? dark}) => dark ?? Tu.appCtrl.darkMode.value
      ? TuColors.bg1()
      : const Color.fromRGBO(
          234, 240, 239, 1); //const Color.fromRGBO(134, 179, 172, 0.145);
  static Color primary = theme1
      ? const Color.fromRGBO(255, 152, 0, 1)
      : const Color.fromRGBO(101, 195, 200, 1);
  static Color primaryFade = theme1
      ? const Color.fromRGBO(255, 152, 0, .5)
      : const Color.fromRGBO(101, 195, 200, .5);
  static Color secondary = const Color.fromRGBO(56, 128, 255, 1);
  static Color secondaryFade = const Color.fromRGBO(56, 128, 255, .3);
  static Color text0 = const Color.fromRGBO(50, 50, 50, 1);
  static Color surface600 = const Color.fromRGBO(89, 89, 89, 1);
  static Color text({bool? dark}) => dark ?? Tu.appCtrl.darkMode.value
      ? const Color.fromRGBO(255, 255, 255, 0.702)
      : const Color.fromRGBO(0, 0, 0, 1);

  static Color text2({bool? dark}) => dark ?? Tu.appCtrl.darkMode.value
      ? const Color.fromRGBO(255, 255, 255, .8)
      : const Color.fromRGBO(15, 15, 15, 0.8);

  static Color text3({bool? dark}) => dark ?? Tu.appCtrl.darkMode.value
      ? const Color.fromRGBO(150, 150, 150, 1)
      : const Color.fromRGBO(15, 15, 15, 0.8);

  static Color note({bool? dark}) => const Color.fromRGBO(102, 102, 102, 1);
  static Color medium = Color.fromARGB(125, 111, 115, 117);
  static Color danger = const Color.fromRGBO(248, 114, 114, 1);
  static Color success = const Color.fromRGBO(45, 211, 111, 1);

  static Color titlebarBG = const Color.fromRGBO(66, 66, 66, 1);
  static Color bg({bool? dark}) => dark ?? Tu.appCtrl.darkMode.value
      ? const Color.fromRGBO(48, 48, 48, 1)
      : const Color.fromRGBO(239, 234, 230, 1);
  static Color bg0({bool? dark}) => dark ?? Tu.appCtrl.darkMode.value
      ? const Color.fromRGBO(36, 36, 36, 1)
      : const Color.fromRGBO(250, 247, 245, 1);
  static Color bg1({bool? dark}) => dark ?? Tu.appCtrl.darkMode.value
      ? const Color.fromRGBO(56, 56, 56, 1)
      : const Color.fromRGBO(250, 247, 245, 1);

  static Color bg2({bool? dark}) => dark ?? Tu.appCtrl.darkMode.value
      ? const Color.fromRGBO(66, 66, 66, 1)
      : const Color.fromRGBO(250, 247, 245, 1);
  static Color btnBG = const Color.fromRGBO(30, 30, 30, 1);
}
