import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Color constants class
class AppColors {
  // Light theme colors
  static final Color primaryLight = Colors.pink[400]!;
  static const Color onPrimaryLight = Colors.white;
  static const Color primaryContainerLight = Colors.white;
  static const Color onPrimaryContainerLight = Colors.black;
  static final Color secondaryLight = Colors.teal[500]!;
  static const Color onSecondaryLight = Colors.black87;
  static const Color secondaryContainerLight = Colors.white;
  static final Color errorLight = Colors.red[700]!;
  static const Color onErrorLight = Colors.white;
  static const Color backgroundLight = Colors.white;
  static const Color onBackgroundLight = Colors.black54;
  static final Color surfaceLight = Colors.grey.shade100;
  static const Color onSurfaceLight = Colors.black87;
  static const Color tertiaryLight = Colors.grey;
  static const Color tertiaryContainerLight = Colors.white;

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
  static final Color surfaceDark = Colors.grey[600]!;
  static const Color onSurfaceDark = Colors.white;
  static final Color backgroundDark = Colors.grey[100]!;
  static const Color onBackgroundDark = Colors.white;

  static const Color scaffoldBackgroundColorDark = Colors.black;
  static const Color cardColorDark = Colors.grey;
  static const Color dividerColorDark = Colors.grey;
}

// Text size constants class
class TextSizes {
  static double displayLarge = 32.0.sp;
  static double displayMedium = 24.0.sp;
  static double displaySmall = 18.0.sp;
  static double headlineLarge = 24.0.sp;
  static double headlineMedium = 20.0.sp;
  static double headlineSmall = 18.0.sp;
  static double bodyLarge = 18.0.sp;
  static double bodyMedium = 16.0.sp;
  static double bodySmall = 14.0.sp;
}
