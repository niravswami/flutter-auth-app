import 'package:flutter/material.dart';

import '../theme_constants.dart';

class AppLightThemeData {
  late ThemeData themeData;

  AppLightThemeData({
    required this.themeData,
  });

  ThemeData get lightTheme {
    return themeData.copyWith(
      colorScheme: _colorSchemeLight,
      popupMenuTheme: PopupMenuThemeData(
        surfaceTintColor: _colorSchemeLight.background,
      ),
      cardTheme: CardTheme(
        surfaceTintColor: _colorSchemeLight.background,
      ),
    );
  }

  static ColorScheme get _colorSchemeLight {
    return ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
      error: AppColors.errorLight,
      onError: AppColors.onErrorLight,
      background: AppColors.backgroundLight,
      onBackground: AppColors.onBackgroundLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
    );
  }
}
