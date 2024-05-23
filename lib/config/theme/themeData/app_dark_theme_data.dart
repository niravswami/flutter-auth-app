import 'package:flutter/material.dart';

import '../theme_constants.dart';

class AppDarkThemeData {
  late ThemeData themeData;

  AppDarkThemeData({
    required this.themeData,
  });

  ThemeData get darkTheme {
    return themeData.copyWith(
      colorScheme: _colorSchemeLight,
      popupMenuTheme: PopupMenuThemeData(
        surfaceTintColor: _colorSchemeLight.background,
      ),
      cardTheme: CardTheme(
        surfaceTintColor: _colorSchemeLight.surface,
      ),
    );
  }

  static ColorScheme get _colorSchemeLight {
    return ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.primaryDark,
      onSecondary: AppColors.onSecondaryDark,
      error: AppColors.errorDark,
      onError: AppColors.onErrorDark,
      background: AppColors.backgroundDark,
      onBackground: AppColors.onBackgroundDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
    );
  }
}
