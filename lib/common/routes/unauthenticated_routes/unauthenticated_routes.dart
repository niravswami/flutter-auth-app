import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/screens/email_verification_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../screens/splash_screen.dart';
import '../routes_constants.dart';
import 'auth_routes/auth_routes_imports.dart';

class UnauthenticatedAppRoutes {
  List<GoRoute> get routes => _routes;

  final List<GoRoute> _routes = [
    GoRoute(
      path: AppPage.splash.toPath,
      name: AppPage.splash.toName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppPage.onBoarding.toPath,
      name: AppPage.onBoarding.toName,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppPage.emailVerification.toPath,
      name: AppPage.emailVerification.toName,
      builder: (context, state) => const EmailVerificationScreen(),
    ),
    AuthAppRoutes().routes,
  ];
}
