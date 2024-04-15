import 'package:go_router/go_router.dart';

import '../../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../screens/entry_point_screen/entry_point_screen.dart';
import '../routes_constants.dart';
import 'profile_routes/profile_routes.dart';

// final GlobalKey<NavigatorState> _entryPointShellNavigator =
//     serviceLocator.get<GlobalKey<NavigatorState>>(
//   instanceName:
//       NavigatorKeyDependenciesRegisterInstanceName.entryPointShellNavigator,
// );

class AuthenticatedAppRoutes {
  late final List<RouteBase> _routes;

  AuthenticatedAppRoutes() {
    _initializeRoutes();
  }

  List<RouteBase> get routes => _routes;

  void _initializeRoutes() {
    final List<RouteBase> _goRoutes = [
      GoRoute(
        path: AppPage.entryPoint.toPath,
        name: AppPage.entryPoint.toName,
        builder: (context, state) => EntryPointScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: AppPage.notifications.toPath,
        name: AppPage.notifications.toName,
        builder: (context, state) => const NotificationsScreen(),
      ),
      ProfileAppRoutes().routes
    ];

    // final List<RouteBase> _shellRoutes = [
    //   ShellRoute(
    //     navigatorKey: _entryPointShellNavigator,
    //     builder: (context, state, child) {
    //       return const NotificationsScreen();
    //     },
    //     routes: [
    //       GoRoute(
    //         path: '/abcd',
    //         name: 'ABCD',
    //         pageBuilder: (context, state) {
    //           return NotificationsScreen(
    //             key: state.pageKey,
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // ];

    _routes = [
      ..._goRoutes,
      // ..._shellRoutes,
    ];
  }
}

// class AuthenticatedAppRoutes {
//   List<GoRoute> get routes => _routes;

//   final List<GoRoute> _routes = [
//     GoRoute(
//       path: AppPage.entryPoint.toPath,
//       name: AppPage.entryPoint.toName,
//       builder: (context, state) => EntryPointScreen(
//         key: state.pageKey,
//       ),
//     ),
//     GoRoute(
//       path: AppPage.notifications.toPath,
//       name: AppPage.notifications.toName,
//       builder: (context, state) => const NotificationsScreen(),
//     ),
//     ProfileAppRoutes().routes
//   ];

//   // GoRouter get routes => _routes;

//   // final _routes = GoRouter(
//   //   initialLocation: AppPage.entryPoint.toPath,
//   //   routes: [
//   //     GoRoute(
//   //       path: AppPage.entryPoint.toPath,
//   //       name: AppPage.entryPoint.toName,
//   //       builder: (context, state) => const EntryPointScreen(),
//   //     ),
//   //     ProfileAppRoutes().routes
//   //   ],
//   //   errorBuilder: (context, state) =>
//   //       ErrorScreen(error: state.error.toString()),
//   // );
// }
