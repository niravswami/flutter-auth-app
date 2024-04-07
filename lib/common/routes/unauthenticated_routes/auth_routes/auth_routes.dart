part of 'auth_routes_imports.dart';

class AuthAppRoutes {
  GoRoute get routes => _routes;

  final _routes = GoRoute(
    path: AppPage.authWelcome.toPath,
    name: AppPage.authWelcome.toName,
    builder: (context, state) => const AuthWelcomeScreen(),
    routes: [
      GoRoute(
        path: AppPage.signUp.toPath,
        name: AppPage.signUp.toName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppPage.login.toPath,
        name: AppPage.login.toName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPage.forgotPassword.toPath,
        name: AppPage.forgotPassword.toName,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
  );
}
