import 'package:flutter/material.dart';

import '../theme_constants.dart';

class AppOutlinedButtonThemeData {
  static OutlinedButtonThemeData get outlineButtonThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.primaryLight),
        ),
      );
}
