import 'package:flutter/material.dart';
import 'package:tu/tu.dart';

extension TuDurationExt on Duration {
  String format() {
    return toString().split('.').first.padLeft(8, "0");
  }
}

extension E on dynamic {
  /// Returns true is object is not null
  bool get isNotNull => this != null;
  bool get isNullTu => this == null;

  TuTheme get theme => TuTheme.instance;
  TuColors get colors => TuTheme.instance.colors;
  Styles get styles => TuTheme.instance.styles;
  bool get dark => Tu.appCtrl.darkMode;

  Text h3(String txt, {bool isLight = false, Color? color}) => Text(
        txt,
        style: styles.h3(isLight: isLight, color: color),
      );
  Text h4(String txt, {bool isLight = false, Color? color}) => Text(
        txt,
        style: styles.h4(isLight: isLight, color: color),
      );
}

extension Ex on String {
  /// Converts camelCase to Pascal Case
  String toWords() => replaceAllMapped(RegExp(r"^([a-z])|[A-Z]"),
      (Match m) => m[1] == null ? " ${m[0]}" : m[1]!.toUpperCase());
}
