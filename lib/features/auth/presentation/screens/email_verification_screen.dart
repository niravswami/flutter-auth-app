import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/assets_constants.dart';
import '../../../../common/utils/helpers/spacing_helper_fn.dart';
import '../../../../common/utils/logout_method/logout_method.dart';
import '../widgets/auth_screen_layout.dart';
import '../widgets/auth_screen_title.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AuthScreenLayout(
      actions: [
        TextButton(
          onPressed: () {
            logoutMethod(context);
          },
          child: const Text(
            "Logout",
            style: TextStyle(),
          ),
        ),
        SpacingHelperFn.horizontalSpace(10.h),
      ],
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: AuthScreenTitle(
              title: "Email Verification",
              subText:
                  "Before getting started, please verify your email by clicking link we sent to your email address. Click on refresh once you verified. If you don't receive the eamil, We'll gladly send you another.",
              subTextAlign: TextAlign.center,
            ),
          ),
          SpacingHelperFn.verticalSpace(50.h),
          SvgPicture.asset(
            AssetsConstants.mailSentSvgPath,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
          ),
          SpacingHelperFn.verticalSpace(50.h),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colorScheme.primary, width: 2.w),
            ),
            child: Text(
              "Resend Verification Email",
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Refresh",
              style: TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
