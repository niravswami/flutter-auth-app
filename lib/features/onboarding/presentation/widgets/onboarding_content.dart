// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/utils/helpers/spacing_helper_fn.dart';

class OnboardingContent extends StatelessWidget {
  final String _title;
  final String _description;
  final String _svgPath;

  const OnboardingContent({
    super.key,
    required String title,
    required String description,
    required String svgPath,
  })  : _title = title,
        _description = description,
        _svgPath = svgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 40.r,
        right: 40.r,
        top: 30.r,
      ),
      child: Column(
        children: <Widget>[
          Text(_title, style: TextStyle(fontSize: 40.sp)),
          SizedBox(
            height: 250.h,
            child: SvgPicture.asset(
              _svgPath,
            ),
          ),
          SpacingHelperFn.verticalSpace(20.h),
          Text(
            _description,
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
