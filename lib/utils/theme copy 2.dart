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
    Tu.appCtrl.darkMode = dark;
  }

  ThemeData theme0() {
    return ThemeData(
        useMaterial3: true,
        brightness: dark ? Brightness.dark : Brightness.light);
  }

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        dialogTheme: const DialogTheme(
            titleTextStyle: TextStyle(fontSize: fontSizeBody + 5)),
        chipTheme: ChipThemeData(
            backgroundColor: colors.medium,
            side: BorderSide.none,
            labelStyle: TextStyle(color: Colors.white),
            labelPadding: true
                ? const EdgeInsets.fromLTRB(5, -5, 5, -3)
                : const EdgeInsets.symmetric(horizontal: 5, vertical: -2),
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: -10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        platform: TargetPlatform.android,
        appBarTheme: AppBarTheme(
            shadowColor: Theme.of(context).shadowColor,
            centerTitle: false,
            toolbarHeight: appBarH,
            iconTheme: IconThemeData(color: colors.onSurface),
            actionsIconTheme: IconThemeData(color: colors.onSurface),
            titleTextStyle: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: colors.onSurface),
            backgroundColor: colors.background, //colors.surface,
            elevation: .0,
            foregroundColor: colors.onSurface),
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
        ),
        textTheme: Styles.textTheme(
          const TextTheme(
            bodyMedium: TextStyle(fontSize: fontSizeBody),
          ),
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
