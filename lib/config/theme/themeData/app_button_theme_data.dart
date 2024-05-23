import 'package:flutter/material.dart';

import '../theme_constants.dart';

class AppButtonThemeData {
  static OutlinedButtonThemeData get outlineButtonThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.primaryLight),
        ),
      );

  static FilledButtonThemeData get filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
