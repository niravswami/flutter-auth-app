// import 'package:flutter/material.dart';

part of 'theme_constants.dart';

// Define a custom theme for celebrations
class AppTheme {
  const AppTheme();

  static final ThemeData _themData = ThemeData(
    useMaterial3: true,
    appBarTheme: _appBarTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    filledButtonTheme: _filledButtonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonThemeData.outlineButtonThemeData,
  );

  ThemeData get themeDataLight {
    return _themData.copyWith(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
      colorScheme: _colorSchemeLight,
      textTheme: _textThemeLight,
      // inputDecorationTheme: _inputDecorationThemeLight,
      cardTheme: _cardThemeLight,
    );
  }

  ThemeData get themeDataDark {
    return _themData.copyWith(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
      cardColor: AppColors.cardColorDark,
      colorScheme: _colorSchemeDark,
      textTheme: _textThemeDark,
      inputDecorationTheme: _inputDecorationThemeDark,
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(centerTitle: false);
  }

  static ColorScheme get _colorSchemeLight {
    return ColorScheme(
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
      tertiary: AppColors.tertiaryLight,
      tertiaryContainer: AppColors.tertiaryContainerLight,
    );
  }

  static ColorScheme get _colorSchemeDark {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondaryDark,
      error: AppColors.errorDark,
      onError: AppColors.onErrorDark,
      background: AppColors.backgroundDark,
      onBackground: AppColors.onBackgroundDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      tertiary: AppColors.tertiaryDark,
      tertiaryContainer: AppColors.tertiaryContainerDark,
    );
  }

  static CardTheme get _cardThemeLight {
    return const CardTheme(surfaceTintColor: Colors.white);
  }

  static TextTheme get _textThemeLight {
    const textStyle = TextStyle(
      color: AppColors.onBackgroundLight,
    );
    return TextTheme(
      // displayLarge: TextStyle(
      //   fontSize: TextSizes.displayLarge,
      //   fontWeight: FontWeight.bold,
      //   color: AppColors.onBackgroundLight,
      // ),
      displayLarge: textStyle.copyWith(
        fontSize: TextSizes.displayLarge,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: textStyle.copyWith(
        fontSize: TextSizes.displayMedium,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: textStyle.copyWith(
        fontSize: TextSizes.displaySmall,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: textStyle.copyWith(
        fontSize: TextSizes.headlineLarge,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: textStyle.copyWith(
        fontSize: TextSizes.headlineMedium,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: textStyle.copyWith(
        fontSize: TextSizes.headlineSmall,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: textStyle.copyWith(fontSize: TextSizes.bodyLarge),
      bodyMedium: textStyle.copyWith(fontSize: TextSizes.bodyMedium),
      bodySmall: textStyle.copyWith(fontSize: TextSizes.bodySmall),
    );
  }

  static TextTheme get _textThemeDark {
    const textStyle = TextStyle(
      color: AppColors.onBackgroundDark,
    );
    return TextTheme(
      displayLarge: textStyle.copyWith(
        fontSize: TextSizes.displayLarge,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: textStyle.copyWith(
        fontSize: TextSizes.displayMedium,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: textStyle.copyWith(
        fontSize: TextSizes.displaySmall,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: textStyle.copyWith(
        fontSize: TextSizes.headlineLarge,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: textStyle.copyWith(
        fontSize: TextSizes.headlineMedium,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: textStyle.copyWith(
        fontSize: TextSizes.headlineSmall,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: textStyle.copyWith(fontSize: TextSizes.bodyLarge),
      bodyMedium: textStyle.copyWith(fontSize: TextSizes.bodyMedium),
      bodySmall: textStyle.copyWith(fontSize: TextSizes.bodySmall),
    );
  }

  static InputDecorationTheme get _inputDecorationThemeLight {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      labelStyle: const TextStyle(color: Colors.black87),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      // contentPadding: const EdgeInsets.symmetric(
      //   horizontal: 12.0,
      //   vertical: 12.0,
      // ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      // disabledBorder: _disabledBorder,
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.errorLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.errorLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      disabledBorder: _disabledBorder,
    );
  }

  static InputDecorationTheme get _inputDecorationThemeDark =>
      InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryDark),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorDark),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorDark),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: _disabledBorder,
      );

  static InputBorder get _disabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.2),
        ),
      );

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
