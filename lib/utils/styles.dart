import "package:flutter/material.dart";
import "package:tu/tu.dart";

const double fontSizeBody = 15;

class Styles {
  final bool dark;
  final TuColors colors;

  static final textStyle = isMobile ? GoogleFonts.nunito : GoogleFonts.ubuntu;
  static final textTheme =
      isMobile ? GoogleFonts.nunitoTextTheme : GoogleFonts.ubuntuTextTheme;

  Styles({this.dark = true, required this.colors});

  TextStyle h1({Color? color, bool isLight = false}) {
    return textStyle(
        fontSize: fontSizeBody + 10,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w800,
        color: color ?? colors.onSurface);
  }

  TextStyle h2({Color? color, bool isLight = false}) {
    return textStyle(
        fontSize: fontSizeBody + 6,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w800,
        color: color ?? colors.text0);
  }

  TextStyle h3({Color? color, bool isLight = false}) {
    return textStyle(
        fontSize: fontSizeBody + 4,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w700,
        color: color ?? colors.onSurface);
  }

  TextStyle label({Color? color, bool isLight = false, bool isBold = false}) {
    return textStyle(
        fontSize: fontSizeBody,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w700,
        color: color);
  }

  TextStyle h4({Color? color, bool isLight = false}) {
    return textStyle(
        fontSize: fontSizeBody + 2,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w600,
        color: color ?? (colors.onSurface));
  }

  TextStyle h5({Color? color, bool isLight = false}) {
    return textStyle(
        fontSize: 16,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w600,
        color: color ?? colors.onSurface);
  }

  TextStyle subtitle =
      GoogleFonts.inclusiveSans(fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle title({Color? color, bool isLight = false}) =>
      GoogleFonts.inclusiveSans(
          fontSize: 16,
          fontWeight: isLight ? FontWeight.w400 : FontWeight.w600,
          color: color);
  TextStyle h6 = GoogleFonts.inclusiveSans(fontSize: 14);
  BorderRadius btnRadius = BorderRadius.circular(7);

  TextStyle cardTitle = textStyle(fontSize: 20);
}
