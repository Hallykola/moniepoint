import 'package:flutter/material.dart';
import 'package:moniepointtest/theme/palette.dart';

class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    var theme = Theme.of(context);
    return ThemeData(
        bottomSheetTheme:
            const BottomSheetThemeData(elevation: 0, modalElevation: 0),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Palette.darkBottomNavBackground),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Palette.darkBlueBackground,
        ),
        scaffoldBackgroundColor: Palette.darkBlueBackground,
        brightness: Brightness.dark,
        primaryColorDark: Palette.darkBlueBackground,
        primaryColor: Palette.darkBlueBackground,
        //primarySwatch: MaterialColor(Palette.darkBlue.
        //value, const {100:Palette.darkBlue})
        appBarTheme: const AppBarTheme(
            elevation: 0, backgroundColor: Palette.darkBlueBackground));
  }
}
