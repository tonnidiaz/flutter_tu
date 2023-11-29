import "package:flutter/material.dart";
import "package:tu/tu.dart";

const double fontSizeBody = 16;

class Styles {
  final bool dark;
  final TuColors colors;
  Styles({this.dark = true, required this.colors});

  TextStyle h1({Color? color, bool isLight = false}) {
    return GoogleFonts.poppins(
        fontSize: fontSizeBody + 10,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w800,
        color: color ?? colors.onBackground);
  }

  TextStyle h2({Color? color, bool isLight = false}) {
    return GoogleFonts.poppins(
        fontSize: fontSizeBody + 6,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w800,
        color: color ?? colors.text0);
  }

  TextStyle h3({Color? color, bool isLight = false}) {
    return GoogleFonts.poppins(
        fontSize: fontSizeBody + 4,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w700,
        color: color ?? colors.onBackground);
  }

  TextStyle label({Color? color, bool isLight = false, bool isBold = false}) {
    return GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w700,
        color: color);
  }

  TextStyle h4({Color? color, bool isLight = false}) {
    return GoogleFonts.poppins(
        fontSize: fontSizeBody + 2,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w600,
        color: color ?? (colors.onBackground));
  }

  TextStyle h5({Color? color, bool isLight = false}) {
    return GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w600,
        color: color ?? colors.onBackground);
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

  TextStyle cardTitle = GoogleFonts.poppins(fontSize: 20);
}
