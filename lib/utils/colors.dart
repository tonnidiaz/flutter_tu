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

  final Color _bgFieldDark = const Color.fromRGBO(40, 40, 40, 1);
  final Color _bgField = const Color.fromRGBO(234, 240, 239, 1);
  Color get bgField => dark ? _bgFieldDark : _bgField;

  final Color primary = const Color.fromRGBO(
      101, 195, 200, 1); //const Color.fromRGBO(220, 184, 255, 1);
  final Color onPrimary = Color.fromRGBO(255, 255, 255, 1);
  final Color primaryContainer = const Color.fromRGBO(
      25, 72, 75, 1); //const Color.fromRGBO(95, 43, 146, 1);
  final Color onPrimaryContainer = const Color.fromARGB(255, 105, 245, 255);

  final Color primaryFade = const Color.fromRGBO(38, 155, 161, .5);
  final Color secondary = const Color.fromRGBO(56, 128, 255, 1);
  final Color secondaryFade = const Color.fromRGBO(56, 128, 255, .3);
  final Color _text0Dark = const Color.fromRGBO(255, 255, 255, 0.9);
  final Color _text0 = const Color.fromRGBO(10, 10, 10, 1);
  Color get text0 => dark ? _text0Dark : _text0;
  final Color surface600 = const Color.fromRGBO(89, 89, 89, 1);
  final Color _textDark = const Color.fromRGBO(255, 255, 255, 0.702);
  final Color _text = const Color.fromRGBO(20, 20, 20, 1);

  /* Color get text => dark ? _textDark : _text;
  final Color _text2Dark = const Color.fromRGBO(255, 255, 255, .8);
  final Color _text2 = const Color.fromRGBO(30, 30, 30, 0.8);
  Color get text2 => dark ? _text2Dark : _text2;
  final Color _text3Dark = const Color.fromRGBO(150, 150, 150, 1);
  final Color _text3 = const Color.fromRGBO(15, 15, 15, 0.8);
  Color get text3 => dark ? _text3Dark : _text3; */
  final Color note = const Color.fromRGBO(102, 102, 102, 1);
  final Color medium = const Color.fromARGB(125, 111, 115, 117);
  final Color danger = Color.fromARGB(255, 255, 0, 0);
  final Color success = const Color.fromRGBO(45, 211, 111, 1);
  final Color _bgDark = const Color.fromRGBO(33, 33, 33, 1);
  final Color _bg = const Color.fromRGBO(239, 234, 230, 1);
  Color get bg => dark ? _bgDark : _bg;
  final Color _bg0Dark = const Color.fromRGBO(36, 36, 36, 1);
  final Color _bg0 = const Color.fromRGBO(250, 247, 245, 1);
  Color get bg0 => dark ? _bg0Dark : _bg0;

  final Color _bg2Dark = const Color.fromRGBO(50, 50, 50, 1);
  final Color _bg2 = const Color.fromRGBO(250, 247, 245, 1);
  Color get bg2 => dark ? _bg2Dark : _bg2;
  final Color btnBG = const Color.fromRGBO(30, 30, 30, 1);

  final Color _background = const Color.fromRGBO(240, 240, 240, 1);
  final Color _backgroundDark = const Color.fromRGBO(30, 30, 30, 1);
  Color get background => dark ? _backgroundDark : _background;

  final Color _onBackgroundDark = const Color.fromRGBO(207, 206, 206, 1);
  final Color _onBackground = const Color.fromRGBO(30, 30, 30, 1);
  Color get onBackground => dark ? _onBackgroundDark : _onBackground;

  final Color _surface = Colors.white;
  final Color _surfaceDark = const Color.fromRGBO(40, 40, 40, 1);
  Color get surface => dark ? _surfaceDark : _surface;

  final Color _onSurfaceDark = const Color.fromRGBO(240, 240, 240, 1);
  final Color _onSurface = const Color.fromRGBO(70, 70, 70, 1);
  Color get onSurface => onBackground; //dark ? _onSurfaceDark : _onSurface;

  final Color _bg1Dark = const Color.fromRGBO(56, 56, 56, 1);
  final Color _bg1 = const Color.fromRGBO(250, 247, 245, 1);
  Color get bg1 => surface;
}
