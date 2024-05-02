part of 'routes_imports.dart';

class AppRouter {
  GoRouter get router => _goRouter;
  final GetIt serviceLocator;

  AppRouter({required this.serviceLocator}) {
    final GlobalKey<NavigatorState> rootNavigatorKey =
        serviceLocator.get<GlobalKey<NavigatorState>>(
            instanceName:
                NavigatorKeyDependenciesRegisterInstanceName.rootNavigator);
    final GlobalKey<NavigatorState> adminDashboardShellNavigatorKey =
        serviceLocator.get<GlobalKey<NavigatorState>>(
            instanceName: NavigatorKeyDependenciesRegisterInstanceName
                .adminDashboardShellNavigatorKey);

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

    _goRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: AppPage.splash.toPath,
      routes: <RouteBase>[
        ...UnauthenticatedAppRoutes().routes,
        MainShellRoute.route,
        // StatefulShellRoute(
        //   // StatefulShellRoute.indexedStack(
        //   // builder: (BuildContext context, GoRouterState state,
        //   //     StatefulNavigationShell navigationShell) {
        //   //   // Return the widget that implements the custom shell (in this case
        //   //   // using a BottomNavigationBar). The StatefulNavigationShell is passed
        //   //   // to be able access the state of the shell and to navigate to other
        //   //   // branches in a stateful way.
        //   //   return ScaffoldWithNavBar(navigationShell: navigationShell);
        //   // },
        //   builder: (
        //     BuildContext context,
        //     GoRouterState state,
        //     StatefulNavigationShell navigationShell,
        //   ) {
        //     // This nested StatefulShellRoute demonstrates the use of a
        //     // custom container for the branch Navigators. In this implementation,
        //     // no customization is done in the builder function (navigationShell
        //     // itself is simply used as the Widget for the route). Instead, the
        //     // navigatorContainerBuilder function below is provided to
        //     // customize the container for the branch Navigators.
        //     return navigationShell;
        //   },
        //   navigatorContainerBuilder: (
        //     BuildContext context,
        //     StatefulNavigationShell navigationShell,
        //     List<Widget> children,
        //   ) {
        //     final bool canAccessAdminDashboard =
        //         canAccess(context: context, permissions: [
        //       PermissionsConstants.readAdminDashboard,
        //     ]);
        //     // print(canAccessAdminDashboard);
        //     print(adminDashboardShellNavigatorKey);
        //     // final List<Widget> filteredChildren = children.where((child) {
        //     //   // Check if the child corresponds to the Admin Dashboard and user has access

        //     //   if (child.key == ValueKey(adminDashboardShellNavigatorKey) &&
        //     //       canAccessAdminDashboard) {
        //     //     return true; // Include the Admin Dashboard child
        //     //   } else {
        //     //     return false; // Exclude other children
        //     //   }
        //     // }).toList();

        //     // final List<Widget> filteredChildren = children.where((child) {
        //     //   // final String routeName = child.key.toString();
        //     //   final branches = navigationShell.route.branches;
        //     //   for (final branch in branches) {
        //     //     print('branch.navigatorKey');
        //     //     print(branch.navigatorKey);
        //     //     if (branch.navigatorKey == adminDashboardShellNavigatorKey) {
        //     //       print(true);
        //     //       return canAccessAdminDashboard;
        //     //     } else {
        //     //       print(false);
        //     //       return true;
        //     //     }
        //     //     // branch.navigatorKey.currentState?.popUntil((route) => route.isFirst);
        //     //   }
        //     //   //  navigationShell.map((page) => page['routeName'] == routeName);
        //     //   // return child;
        //     //   return false;
        //     // }).toList();

        //     //       final StatefulNavigationShell filteredNavigationShell =
        //     // StatefulNavigationShell(shellRouteContext:navigationShell.shellRouteContext, );

        //     print(navigationShell);

        //     return ScaffoldWithNavBar(
        //       navigationShell: navigationShell,
        //       children: children,
        //     );
        //   },
        //   branches: <StatefulShellBranch>[
        //     ...HomeRouteBranches().routes,
        //     ...AdminDashboardRouteBranches(serviceLocator: serviceLocator)
        //         .routes,
        //     ...ProfileRouteBranches().routes,

        //     // The route branch for the third tab of the bottom navigation bar.
        //   ],
        // ),
      ],
      redirect: goRouterRedirect,
    );
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