import "package:flutter/material.dart";
import "package:tu/tu.dart";
import "./colors.dart";
import "package:google_fonts/google_fonts.dart";

class Styles {
  static TextStyle h1({Color? color, bool isLight = false}) {
    return GoogleFonts.roboto(
        fontSize: 30,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w800,
        color: color ?? TuColors.text());
  }

  static TextStyle h2({Color? color, bool isLight = false}) {
    return GoogleFonts.roboto(
        fontSize: 26,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w800,
        color: color ?? TuColors.text0());
  }

  static TextStyle h3({Color? color, bool isLight = false}) {
    return GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w700,
        color: color ?? TuColors.text());
  }

  static TextStyle label(
      {Color? color, bool isLight = false, bool isBold = false}) {
    return GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w700,
        color: color);
  }

  static TextStyle h4({Color? color, bool isLight = false, bool dark = true}) {
    return GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w600,
        color: color ?? TuColors.text(dark: dark));
  }

  static TextStyle h5({Color? color, bool isLight = false}) {
    return GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: isLight ? FontWeight.w500 : FontWeight.w600,
        color: color ?? TuColors.text0());
  }

  static TextStyle subtitle =
      GoogleFonts.inclusiveSans(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle title({Color? color, bool isLight = false}) =>
      GoogleFonts.inclusiveSans(
          fontSize: 16,
          fontWeight: isLight ? FontWeight.w400 : FontWeight.w600,
          color: color);
  static TextStyle h6 = GoogleFonts.inclusiveSans(fontSize: 14);
  static BorderRadius btnRadius = BorderRadius.circular(7);

  static TextStyle cardTitle = GoogleFonts.roboto(fontSize: 20);
}
