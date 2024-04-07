import 'package:flutter/material.dart';

import 'themeData/app_outlined_button_theme_data.dart';
part 'theme.dart';

const kPrimaryColor = Color(0xFFFFC61F);
const ksecondaryColor = Color(0xFFB5BFD0);
const kTextColor = Color(0xFF50505D);
const kTextLightColor = Color(0xFF6A727D);

// Color constants class
class AppColors {
  // Light theme colors
  static final Color primaryLight = Colors.pink[400]!;
  static const Color onPrimaryLight = Colors.white;
  static const Color primaryContainerLight = Colors.white;
  static const Color onPrimaryContainerLight = Colors.black;
  static final Color secondaryLight = Colors.amber[600]!;
  static const Color onSecondaryLight = Colors.black;
  static const Color secondaryContainerLight = Colors.white;
  static const Color tertiaryLight = Colors.grey;
  static const Color tertiaryContainerLight = Colors.white;
  static const Color errorLight = Colors.red;
  static const Color onErrorLight = Colors.white;
  static const Color surfaceLight = Colors.white;
  static const Color onSurfaceLight = Colors.black;
  static final Color backgroundLight = Colors.grey[200]!;
  static const Color onBackgroundLight = Colors.black;

  static final Color scaffoldBackgroundColorLight = Colors.grey[100]!;
  static const Color cardColorLight = Colors.white;
  static const Color dividerColorLight = Colors.grey;

  // Dark theme colors
  static final Color primaryDark = Colors.pink[400]!;
  static const Color onPrimaryDark = Colors.white;
  static final Color primaryContainerDark = Colors.pink[400]!;
  static const Color onPrimaryContainerDark = Colors.white;
  static final Color secondaryDark = Colors.amber[800]!;
  static const Color onSecondaryDark = Colors.white;
  static final Color secondaryContainerDark = Colors.amber[800]!;
  static final Color tertiaryDark = Colors.grey[800]!;
  static final Color tertiaryContainerDark = Colors.grey[800]!;
  static final Color errorDark = Colors.red[800]!;
  static const Color onErrorDark = Colors.white;
  static final Color surfaceDark = Colors.grey[900]!;
  static const Color onSurfaceDark = Colors.white;
  static const Color backgroundDark = Colors.black;
  static const Color onBackgroundDark = Colors.white;

  static const Color scaffoldBackgroundColorDark = Colors.black;
  static const Color cardColorDark = Colors.grey;
  static const Color dividerColorDark = Colors.grey;
}

// Text size constants class
class TextSizes {
  static const double displayLarge = 32.0;
  static const double displayMedium = 24.0;
  static const double displaySmall = 18.0;
  static const double headlineLarge = 24.0;
  static const double headlineMedium = 20.0;
  static const double headlineSmall = 18.0;
  static const double bodyLarge = 18.0;
  static const double bodyMedium = 16.0;
  static const double bodySmall = 14.0;
}
