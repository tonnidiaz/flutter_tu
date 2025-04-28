import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:tu/tu.dart";

class TuTheme {
  static late TuTheme instance;
  late TuColors colors;
  late Styles styles;
  final bool dark;
  final bool? useMaterial3;
  final BuildContext context;
  TuTheme(
      {required this.colors,
      this.dark = true,
      required this.context,
      this.useMaterial3}) {
    instance = this;
    styles = Styles(colors: colors);
    Tu.appCtrl.darkMode = dark;
  }

  ThemeData theme() {
    return ThemeData(
        useMaterial3: useMaterial3,
        dialogTheme: const DialogTheme(
            titleTextStyle: TextStyle(fontSize: fontSizeBody + 5)),
        chipTheme: ChipThemeData(
            backgroundColor: colors.medium,
            side: BorderSide.none,
            labelStyle: const TextStyle(color: Colors.white),
            labelPadding: true
                ? const EdgeInsets.fromLTRB(5, -5, 5, -3)
                : const EdgeInsets.symmetric(horizontal: 5, vertical: -2),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: -10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        platform: TargetPlatform.android,
        appBarTheme: AppBarTheme(
            shadowColor: Theme.of(context).shadowColor,
            centerTitle: false,
            toolbarHeight: appBarH,
            iconTheme: IconThemeData(color: colors.onSurface),
            actionsIconTheme: IconThemeData(color: colors.onSurface),
            titleTextStyle: TextStyle(
                fontSize: appBarTextSize,
                fontWeight: FontWeight.w400,
                color: colors.onSurface,
                fontFamily: "Arial"),
            backgroundColor: colors.color_neutral_800, //colors.surface,
            elevation: 0,
            foregroundColor: colors.color_neutral_400),
        colorScheme: ColorScheme.fromSeed(
            primary: colors.primary,
            onPrimary: colors.onPrimary,
            secondary: colors.secondary,
            secondaryContainer: colors.secondary,
            surfaceTint: colors.surface,
            seedColor: colors.primary,
            background: colors.background,
            onBackground: colors.onBackground,
            onPrimaryContainer: colors.onPrimaryContainer,
            primaryContainer: colors.primaryContainer,

            /// For cards and buttons i think
            surface: colors.surface,
            onSurface: colors.onSurface,
            error: colors.danger,
            onError: Colors.white,
            brightness: dark ? Brightness.dark : Brightness.light),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colors.medium,
        ),
        tabBarTheme: TabBarTheme(
            labelColor: colors.onSurface, indicatorColor: Colors.red),
        popupMenuTheme: PopupMenuThemeData(
            color: colors.bg2,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(0))),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        )),
        menuBarTheme: const MenuBarThemeData(
            style: MenuStyle(
          elevation: MaterialStatePropertyAll(0),
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
        )),
        menuTheme: const MenuBarThemeData(
          style: MenuStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
          ),
        ),
        menuButtonTheme: MenuButtonThemeData(
            style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.fromLTRB(10, 10, 10, 10)),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: const MaterialStatePropertyAll(Size(1, 1)),
                textStyle: MaterialStatePropertyAll(
                    TextStyle(fontSize: appBarTextSize)))),
        textTheme: const TextTheme(
          labelLarge: TextStyle(fontSize: fontSizeBody, fontFamily: "Arial"),
          bodyMedium: TextStyle(fontSize: fontSizeBody, fontFamily: "Arial"),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                disabledBackgroundColor: colors.medium,
                disabledForegroundColor: Colors.white,
                foregroundColor: dark ? colors.onSurface : Colors.white)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colors.surface,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            /*  selectedIconTheme:
                const IconThemeData(weight: 900, fill: 1, grade: 1),
            unselectedIconTheme: const IconThemeData(
              weight: 100,
              fill: 0,
            ), */
            selectedItemColor: dark ? Colors.white : Colors.black,
            showUnselectedLabels: true,
            unselectedItemColor: colors.onBackground,
            selectedLabelStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w600, fontSize: fontSizeBody + .7),
            unselectedLabelStyle:
                GoogleFonts.roboto(fontSize: fontSizeBody - .7)),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: colors.bg2,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.color_neutral_700),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.color_neutral_500),
              borderRadius: BorderRadius.circular(8)),

          // hintStyle: const TextStyle(),
          floatingLabelStyle:
              TextStyle(color: colors.onBackground, fontSize: fontSizeBody),
        ),
        drawerTheme: const DrawerThemeData(shape: RoundedRectangleBorder()),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.only(right: 0, left: 14),
        ),
        tooltipTheme: TooltipThemeData(
            textStyle: styles.subtitle,
            decoration: BoxDecoration(
                color: colors.bgCard, borderRadius: BorderRadius.circular(4))),
        iconTheme: IconThemeData(size: iconSize, color: colors.onBackground));
  }
}
