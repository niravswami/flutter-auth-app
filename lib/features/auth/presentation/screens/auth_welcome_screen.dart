import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/assets_constants.dart';
import '../../../../common/routes/routes_constants.dart';
import '../../../../common/utils/helpers/routing_helper_fn.dart';
import '../../../../common/utils/helpers/spacing_helper_fn.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
          horizontal: 40.r,
          vertical: 50.r,
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 30.sp,
                    ),
                  ),
                  SpacingHelperFn.verticalSpace(20.h),
                  Text(
                    "Automatic identity verification which enables you to verify your identity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                AssetsConstants.authWelcomeSvgPath,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
              ),
              const Spacer(),
              Column(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      RoutingHelperFn.pushToName(
                          context, AppPage.signUp.toName);
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 55.h),
                      side: BorderSide(color: colorScheme.primary, width: 2.w),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SpacingHelperFn.verticalSpace(20.h),
                  FilledButton(
                    onPressed: () {
                      RoutingHelperFn.pushToName(context, AppPage.login.toName);
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 55.h),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: colorScheme.surface,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
