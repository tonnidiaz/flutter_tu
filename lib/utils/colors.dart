// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tu/tu.dart';

class TuColors {
  /* late bool dark;
  TuColors() {
    dark = TuTheme.instance.dark;
  } */
  final Color _bgCardDark = const Color.fromRGBO(56, 56, 56, 1);
  final Color _bgCard = const Color.fromRGBO(250, 247, 245, 1);

  Color get bgCard => dark ? _bgCardDark : _bgCard;

  final Color _colorDark = Colors.green;
  final Color _color = Colors.yellow;
  Color get color => dark ? _colorDark : _color;

  final Color _bgFieldDark = const Color.fromRGBO(39, 39, 39, 1);
  final Color _bgField = const Color.fromRGBO(234, 240, 239, 1);
  Color get bgField => dark ? _bgFieldDark : _bgField;

  final Color primary = const Color.fromRGBO(
      101, 195, 200, 1); //const Color.fromRGBO(220, 184, 255, 1);
  final Color onPrimary = const Color.fromARGB(255, 255, 255, 255);
  final Color primaryContainer = const Color.fromRGBO(
      31, 107, 112, 1); //const Color.fromRGBO(95, 43, 146, 1);
  final Color onPrimaryContainer = const Color.fromARGB(255, 216, 252, 255);

  final Color primaryFade = const Color.fromRGBO(101, 195, 200, .4);
  final Color secondary = const Color.fromRGBO(56, 128, 255, 1);
  final Color secondaryFade = const Color.fromRGBO(56, 128, 255, .3);
  final Color _text0Dark = const Color.fromRGBO(255, 255, 255, 0.9);
  final Color _text0 = const Color.fromRGBO(10, 10, 10, 1);
  Color get text0 => dark ? _text0Dark : _text0;
  final Color surface600 = const Color.fromRGBO(89, 89, 89, 1);
  final Color _textDark = const Color.fromRGBO(255, 255, 255, 0.702);
  final Color _text = const Color.fromRGBO(20, 20, 20, 1);
  final Color _text2Dark = const Color.fromRGBO(255, 255, 255, .8);
  final Color _text2 = const Color.fromRGBO(30, 30, 30, 0.8);
  Color get text2 => dark ? _text2Dark : _text2;
  Color get text => onBackground;
  /*
  final Color _text3Dark = const Color.fromRGBO(150, 150, 150, 1);
  final Color _text3 = const Color.fromRGBO(15, 15, 15, 0.8);
  Color get text3 => dark ? _text3Dark : _text3; */
  final Color note = const Color.fromARGB(255, 116, 116, 116);
  Color get medium => dark
      ? const Color.fromARGB(125, 111, 115, 117)
      : const Color.fromARGB(123, 56, 58, 59);
  final Color danger = const Color.fromRGBO(248, 114, 114, 1);
  final Color success = const Color.fromRGBO(45, 211, 111, 1);
  final Color _bgDark = const Color.fromRGBO(30, 30, 30, 1);
  final Color _bg = const Color.fromRGBO(245, 245, 250, 1);
  Color get bg => dark ? _bgDark : _bg;
  final Color _bg0Dark = const Color.fromRGBO(28, 28, 28, 1);
  final Color _bg0 = const Color.fromRGBO(250, 247, 245, 1);
  Color get bg0 => dark ? _bg0Dark : _bg0;

  final Color _bg2Dark = const Color.fromRGBO(38, 38, 38, 1);
  final Color _bg2 = const Color.fromRGBO(250, 247, 245, 1);
  Color get bg2 => dark ? _bg2Dark : _bg2;
  final Color btnBG = const Color.fromRGBO(30, 30, 30, 1);

  Color get background => bg;
  final Color _surface = Colors.white;
  final Color _surfaceDark = const Color.fromRGBO(35, 35, 35, 1);
  Color get surface => dark ? _surfaceDark : _surface;

  final Color _onBackgroundDark = const Color.fromRGBO(207, 206, 206, 1);
  final Color _onBackground = const Color.fromRGBO(30, 30, 30, 1);
  Color get onBackground => dark ? _onBackgroundDark : _onBackground;

  late final Color _onSurfaceDark =
      color_neutral_200; //const Color.fromRGBO(247, 247, 247, 1);
  final Color _onSurface = const Color.fromRGBO(70, 70, 70, 1);
  Color get onSurface => dark ? _onSurfaceDark : _onSurface;

  Color get bg1 => surface;

  // TailwindCss
  Color get color_neutral_800 =>
      dark ? const Color.fromRGBO(36, 36, 36, 1) : Colors.white30;
  Color get color_neutral_700 =>
      dark ? const Color.fromRGBO(64, 64, 64, 1) : Colors.white30;
  Color get color_neutral_600 =>
      dark ? const Color.fromRGBO(74, 74, 74, 1) : Colors.white30;
  Color get color_neutral_500 =>
      dark ? const Color.fromRGBO(84, 84, 84, 1) : Colors.white30;
  Color get color_neutral_400 =>
      dark ? const Color.fromARGB(255, 180, 180, 180) : Colors.black54;
  Color get color_neutral_300 =>
      dark ? const Color.fromRGBO(212, 212, 212, 1) : Colors.black54;
  Color get color_neutral_200 =>
      dark ? const Color.fromARGB(255, 219, 219, 219) : Colors.black54;
  Color color_blue_700 = const Color.fromRGBO(37, 99, 235, 1);

  late Color appBarBg = color_neutral_800;
}
