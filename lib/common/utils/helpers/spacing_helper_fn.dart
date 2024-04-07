import 'package:flutter/material.dart';

class SpacingHelperFn {
  /// vertical spacing
  static SizedBox verticalSpace(double value) => SizedBox(
        height: value,
      );

  /// horizontal spacing
  static SizedBox horizontalSpace(double value) => SizedBox(
        width: value,
      );
}
