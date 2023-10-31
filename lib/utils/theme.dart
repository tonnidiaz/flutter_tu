import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "index.dart";

var amber = const Color.fromRGBO(255, 193, 7, 1);
var black12 = Colors.black12;

ThemeData tuTheme({bool dark = true}) {
  return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: TuColors.bg(dark: dark),
      platform: TargetPlatform.linux,
      appBarTheme: AppBarTheme(
          centerTitle: false,
          toolbarHeight: appBarH,
          titleTextStyle: GoogleFonts.inclusiveSans(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: TuColors.text2(dark: dark)),
          backgroundColor: TuColors.bg1(dark: dark),
          elevation: 0.5,
          foregroundColor: TuColors.text2(dark: dark)),
      colorScheme: ColorScheme.fromSeed(
          primary: TuColors.primary,
          secondary: TuColors.secondary,
          seedColor: TuColors.primary,
          brightness: dark ? Brightness.dark : Brightness.light),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: TuColors.medium,
      ),
      tabBarTheme: TabBarTheme(
          labelColor: TuColors.text2(dark: dark), indicatorColor: Colors.red),
      popupMenuTheme: PopupMenuThemeData(
        color: TuColors.bg1(
            dark:
                dark), //shape: RoundedRectangleBorder(borderRadius: mFieldRadius),
      ),
      textTheme: GoogleFonts.inclusiveSansTextTheme(
        TextTheme(
          bodyMedium: TextStyle(color: TuColors.text(dark: dark), fontSize: 16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: TuColors.medium,
              disabledForegroundColor: Colors.white,
              foregroundColor: TuColors.text2(dark: dark)
              //disabledForegroundColor: Colors.white,
              )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: TuColors.primary,
          showUnselectedLabels: true,
          unselectedItemColor: TuColors.text2(dark: dark),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500)),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.only(right: 0, left: 14),
      ),
      inputDecorationTheme: const InputDecorationTheme(),
      dialogTheme: DialogTheme(
          backgroundColor: TuColors.bg1(dark: dark),
          titleTextStyle: Styles.h4(isLight: true, dark: dark)));
}
