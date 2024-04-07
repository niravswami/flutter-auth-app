// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/helpers/spacing_helper_fn.dart';

class AuthScreenTitle extends StatelessWidget {
  final String _title;
  final String _subText;
  final TextStyle? _titleTextStyle;
  final TextStyle? _subTextStyle;
  final TextAlign? _titleTextAlign;
  final TextAlign? _subTextAlign;

  const AuthScreenTitle({
    super.key,
    required String title,
    required String subText,
    TextStyle? subTextStyle,
    TextStyle? titleTextStyle,
    TextAlign? titleTextAlign,
    TextAlign? subTextAlign,
  })  : _title = title,
        _subText = subText,
        _titleTextStyle = titleTextStyle,
        _subTextStyle = subTextStyle,
        _titleTextAlign = titleTextAlign,
        _subTextAlign = subTextAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _title,
          textAlign: _titleTextAlign,
          style: TextStyle(
            fontSize: 30.sp,
          ).merge(_titleTextStyle),
        ),
        SpacingHelperFn.verticalSpace(10.h),
        Text(
          _subText,
          textAlign: _subTextAlign,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.grey[700],
          ).merge(_subTextStyle),
        ),
      ],
    );
  }
}
