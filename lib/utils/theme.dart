import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "index.dart";

var amber = const Color.fromRGBO(255, 193, 7, 1);
var black12 = Colors.black12;

ThemeData tuTheme({bool dark = true}) {
  return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: TuColors.bg(dark: dark),
      chipTheme: ChipThemeData(
          backgroundColor: TuColors.medium,
          side: BorderSide.none,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      platform: TargetPlatform.linux,
      appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
          toolbarHeight: appBarH,
          titleTextStyle: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: TuColors.text2(dark: dark)),
          backgroundColor: TuColors.bg1(dark: dark),
          elevation: 0.0,
          foregroundColor: TuColors.text2(dark: dark)),
      colorScheme: ColorScheme.fromSeed(
          primary: TuColors.primary,
          secondary: TuColors.secondary,
          surfaceTint: TuColors.bg1(),
          seedColor: TuColors.primary,
          brightness: dark ? Brightness.dark : Brightness.light),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: TuColors.medium,
      ),
      tabBarTheme: TabBarTheme(
          labelColor: TuColors.text2(dark: dark), indicatorColor: Colors.red),
      popupMenuTheme: PopupMenuThemeData(
        color: TuColors
            .bg2(), //shape: RoundedRectangleBorder(borderRadius: mFieldRadius),
      ),
      textTheme: GoogleFonts.robotoTextTheme(
        TextTheme(
          bodyMedium: TextStyle(color: TuColors.text(dark: dark), fontSize: 18),
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
          backgroundColor: TuColors.bg1(),
          selectedItemColor: TuColors.primary,
          showUnselectedLabels: true,
          unselectedItemColor: TuColors.text2(dark: dark),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500)),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.only(right: 0, left: 14),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(),
        floatingLabelStyle: TextStyle(color: TuColors.text(), fontSize: 18),
      ),
      drawerTheme: DrawerThemeData(backgroundColor: TuColors.bg0()),
      dialogTheme: DialogTheme(
          backgroundColor: TuColors.bg1(dark: dark),
          titleTextStyle: Styles.h4(isLight: true, dark: dark)),
      iconTheme: IconThemeData(size: iconSize, color: TuColors.text2()));
}
