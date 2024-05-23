import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/constants/assets_constants.dart';
import '../../../../common/routes/routes_constants.dart';
import '../../../../common/utils/helpers/routing_helper_fn.dart';
import '../widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return OnBoardingSlider(
      onFinish: () {
        RoutingHelperFn.replaceToPath(context, AppPage.authWelcome.toPath);
      },
      headerBackgroundColor: colorScheme.background,
      finishButtonText: 'Getting Started',
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
      controllerColor: colorScheme.primary,
      skipTextButton: const Text('Skip'),
      background: const [
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ],
      totalPage: 3,
      speed: 1.8,
      pageBodies: const [
        OnboardingContent(
          title: "Screen one",
          svgPath: AssetsConstants.dashboardSvgPath,
          description: "Here is the screen one description",
        ),
        OnboardingContent(
          title: "Screen Two",
          svgPath: AssetsConstants.pushNotificationSvgPath,
          description: "Here is the screen two description",
        ),
        OnboardingContent(
          title: "Screen Three",
          svgPath: AssetsConstants.onlinePaymentsSvgPath,
          description: "Here is the screen three description",
        ),
      ],
    );
  }
}
