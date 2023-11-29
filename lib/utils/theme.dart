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
        //scaffoldBackgroundColor: colors.bg,
        dialogTheme: const DialogTheme(
            titleTextStyle: TextStyle(fontSize: fontSizeBody + 5)),
        chipTheme: ChipThemeData(
            backgroundColor: colors.medium,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        platform: TargetPlatform.android,
        bottomSheetTheme: BottomSheetThemeData(
            shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius)),
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
            backgroundColor: colors.surface,
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
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(fontSize: fontSizeBody),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                disabledBackgroundColor: colors.medium,
                disabledForegroundColor: Colors.white,
                foregroundColor: colors.onSurface)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colors.surface,
            /*   selectedIconTheme:
                const IconThemeData(color: Color.fromRGBO(207, 206, 206, 1)), */
            selectedItemColor: colors.onBackground,
            showUnselectedLabels: true,
            unselectedItemColor: colors.onBackground,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500)),
        inputDecorationTheme: InputDecorationTheme(
          // hintStyle: const TextStyle(),
          floatingLabelStyle:
              TextStyle(color: colors.onBackground, fontSize: fontSizeBody),
        ),
        drawerTheme: const DrawerThemeData(shape: RoundedRectangleBorder()),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.only(right: 0, left: 14),
        ),
        iconTheme: IconThemeData(size: iconSize, color: colors.onBackground));
  }
}
