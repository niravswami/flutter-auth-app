import 'package:flutter/material.dart';

import 'themeData/app_button_theme_data.dart';
import 'themeData/app_dark_theme_data.dart';
import 'themeData/app_light_theme_data.dart';

class AppTheme {
  const AppTheme();

  static final ThemeData _themData = ThemeData(
    useMaterial3: true,
    appBarTheme: _appBarTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    filledButtonTheme: AppButtonThemeData.filledButtonTheme,
    outlinedButtonTheme: AppButtonThemeData.outlineButtonThemeData,
    expansionTileTheme: const ExpansionTileThemeData(
      shape: Border(),
    ),
  );

  ThemeData get lightTheme {
    return AppLightThemeData(themeData: _themData).lightTheme;
  }

  ThemeData get darkTheme {
    return AppDarkThemeData(themeData: _themData).darkTheme;
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(centerTitle: false);
  }
}
