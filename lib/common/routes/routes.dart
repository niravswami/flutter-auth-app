part of 'routes_imports.dart';

class AppRouter {
  GoRouter get router => _goRouter;
  final GetIt serviceLocator;

  AppRouter({required this.serviceLocator}) {
    final GlobalKey<NavigatorState> rootNavigatorKey =
        serviceLocator.get<GlobalKey<NavigatorState>>(
            instanceName:
                NavigatorKeyDependenciesRegisterInstanceName.rootNavigator);

    _goRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: AppPage.splash.toPath,
      routes: <RouteBase>[
        ...UnauthenticatedAppRoutes().routes,
        MainShellRoute.route,
      ],
      redirect: goRouterRedirect,
      errorBuilder: (context, state) =>
          ErrorScreen(error: state.error.toString()),
    );

    // Initialize _goRouter after getting the listenable state
    // _goRouter = GoRouter(
    //   navigatorKey: rootNavigatorKey,
    //   debugLogDiagnostics: false,
    //   initialLocation: AppPage.splash.toPath,
    //   routes: [
    //     ...AuthenticatedAppRoutes().routes,
    //     ...UnauthenticatedAppRoutes().routes
    //   ],
    //   redirect: goRouterRedirect,
    //   // redirect: (context, state) {
    //   //   var authStatus = context.read<AuthBloc>().state;
    //   //   print('route redirect ');
    //   //   final loginLocation = state.namedLocation(AppPage.login.toName);
    //   //   final homeLocation = state.namedLocation(AppPage.home.toName);
    //   //   final emailVerificationLocation =
    //   //       state.namedLocation(AppPage.emailVerification.toName);
    //   //   // user is not logged in and route is protected on then redirect to login
    //   //   if (authStatus is AuthInitial &&
    //   //       !RouteConstants.unauthenticatedFullRouteList
    //   //           .contains(state.fullPath)) {
    //   //     return loginLocation;
    //   //   }
    //   //   // user is logged in,
    //   //   if (authStatus is AuthUserLoggedIn) {
    //   //     //redirect user to email verification required info screen if not verified user
    //   //     if (authStatus.user.emailVerifiedAt == null) {
    //   //       return emailVerificationLocation;
    //   //     }

    //   //     //redirect user to home if it tries to unauthenticated routes
    //   //     if (RouteConstants.unauthenticatedFullRouteList
    //   //         .concat([AppPage.emailVerification.toFullPath]).contains(
    //   //             state.fullPath)) {
    //   //       return homeLocation;
    //   //     }
    //   //   }
    //   //   return null;
    //   // },
    //   errorBuilder: (context, state) =>
    //       ErrorScreen(error: state.error.toString()),
    // );

    // final GlobalKey<NavigatorState> _sectionANavigatorKey =
    //     GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
  }

  late final GoRouter _goRouter;
}


// ==== redirect state ====
// flutter: state.fullPath
// flutter: /
// flutter: state.matchedLocation
// flutter: /
// flutter: state.name
// flutter: null
// flutter: state.topRoute
// flutter: GoRoute#af78f(name: "HOME", path: "/")
// flutter: state.uri
// flutter: /
// flutter: state.pageKey
// flutter: [<'topLevel'>]
// flutter: state.error
// flutter: null
// flutter: authStatus
// flutter: AuthInitial()