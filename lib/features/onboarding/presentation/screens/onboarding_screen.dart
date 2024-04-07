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
          title: "Admin Dashboard",
          svgPath: AssetsConstants.dashboardSvgPath,
          description:
              "Only Admin Dashboard mobile app you ever need with easy to use UX/UI design.",
        ),
        OnboardingContent(
          title: "Real-time Notification",
          svgPath: AssetsConstants.pushNotificationSvgPath,
          description:
              "Broadcast and receive realtime events in your Laravel apps using Laravel Channels. Hosted WebSockets for fully-featured interactive apps.",
        ),
        OnboardingContent(
          title: "Payment Gateway",
          svgPath: AssetsConstants.onlinePaymentsSvgPath,
          description:
              "Experience seamless and secure transactions on our platform. Enjoy the convenience of multiple payment options and track your transaction history effortlessly.",
        ),
      ],
    );
    // return Scaffold(
    //   body: SafeArea(
    //     child: Stack(
    //       children: [
    //         Positioned(
    //           right: 0,
    //           top: 19,
    //           child: TextButton(
    //             onPressed: () {},
    //             child: Text(
    //               "Skip",
    //               style: textTheme.bodyMedium!
    //                   .copyWith(color: colorScheme.primary),
    //             ),
    //           ),
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             SapcingHelperFn.verticalSpace(30),
    //             Text(
    //               "Admin Dashboard",
    //               style: textTheme.displayMedium!.copyWith(
    //                 color: Colors.black87,
    //               ),
    //             ),
    //             Expanded(
    //               child: PageView(
    //                 controller: _pageViewController,
    //                 onPageChanged: _handlePageViewChanged,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 30),
    //                     child: Column(
    //                       children: [
    //                         SvgPicture.asset(
    //                           "assets/images/svg/dashboard.svg",
    //                           height: 250,
    //                         ),
    //                         Text(
    //                           "Empower your business with our cutting-edge admin dashboard featuring seamless Roles and Permissions management, Real-time notifications, and secure Payment Gateway integration",
    //                           style: textTheme.bodyMedium!.copyWith(
    //                             color: Colors.black87,
    //                           ),
    //                           textAlign: TextAlign.justify,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Center(
    //                     child: Text('Second Page'),
    //                   ),
    //                   Center(
    //                     child: Text('Third Page'),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Row(
    //               mainAxisSize: MainAxisSize.max,
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 TextButton(
    //                   onPressed: () {},
    //                   child: Text("Prev"),
    //                 ),
    //                 OutlinedButton(
    //                   onPressed: () {},
    //                   child: Text("skip"),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
