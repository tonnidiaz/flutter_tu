import "package:flutter/material.dart";
import "package:tu/tu.dart";

class TuTheme {
  static late TuTheme instance;
  late TuColors colors;
  late Styles styles;
  final bool dark;
  final BuildContext context;
  TuTheme({required this.colors, this.dark = true, required this.context}) {
    instance = this;
    styles = Styles(colors: colors);
  }

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: colors.bg,
        chipTheme: ChipThemeData(
            backgroundColor: colors.medium,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        platform: TargetPlatform.android,
        appBarTheme: AppBarTheme(
            //surfaceTintColor: Colors.transparent,
            shadowColor: Theme.of(context).shadowColor,
            centerTitle: false,
            toolbarHeight: appBarH,
            iconTheme: IconThemeData(color: colors.text0),
            actionsIconTheme: IconThemeData(color: colors.text0),
            titleTextStyle: GoogleFonts.roboto(
                fontSize: 20, fontWeight: FontWeight.w500, color: colors.text0),
            backgroundColor: colors.bg,
            elevation: 1,
            foregroundColor: colors.text2),
        colorScheme: ColorScheme.fromSeed(
            primary: colors.primary,
            secondary: colors.secondary,
            surfaceTint: colors.bg1,
            seedColor: colors.primary,
            brightness: dark ? Brightness.dark : Brightness.light),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colors.medium,
        ),
        tabBarTheme:
            TabBarTheme(labelColor: colors.text2, indicatorColor: Colors.red),
        popupMenuTheme: PopupMenuThemeData(
          color: colors.bg2,
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          TextTheme(
            bodyMedium: TextStyle(color: colors.text, fontSize: fontSizeBody),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                disabledBackgroundColor: colors.medium,
                disabledForegroundColor: Colors.white,
                foregroundColor: colors.text2)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colors.bg2,
            selectedItemColor: colors.primary,
            showUnselectedLabels: true,
            unselectedItemColor: colors.text2,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500)),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.only(right: 0, left: 14),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(),
          floatingLabelStyle:
              TextStyle(color: colors.text, fontSize: fontSizeBody),
        ),
        drawerTheme: DrawerThemeData(backgroundColor: colors.bg0),
        dialogTheme: DialogTheme(
            backgroundColor: colors.bg1,
            titleTextStyle: styles.h4(
              isLight: true,
            )),
        cardColor: colors.bg1,
        iconTheme: IconThemeData(size: iconSize, color: colors.text2));
  }
}
