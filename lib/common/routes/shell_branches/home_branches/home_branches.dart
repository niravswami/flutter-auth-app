import 'package:admin_dashboard_app/features/home/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../../../features/user_profile/presentation/screens/user_profile_settings_screen.dart';
import '../../routes_constants.dart';

class HomeRouteBranches {
  // GoRoute get routes => _routes;

  // final _routes = GoRoute(
  //   path: AppPage.home.toPath,
  //   name: AppPage.home.toName,
  //   builder: (context, state) => const HomeScreen(),
  //   routes: [
  //     GoRoute(
  //       path: AppPage.notifications.toPath,
  //       name: AppPage.notifications.toName,
  //       builder: (context, state) => const NotificationsScreen(),
  //     ),
  //   ],
  // );

  late final List<StatefulShellBranch> _routes;

  HomeRouteBranches() {
    _initializeRoutes();
  }
  List<StatefulShellBranch> get routes => _routes;

  void _initializeRoutes() {
    final GlobalKey<NavigatorState> homeNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'homeNav');

    _routes = <StatefulShellBranch>[
      StatefulShellBranch(
        navigatorKey: homeNavigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: AppPage.home.toPath,
            name: AppPage.home.toName,
            builder: (
              BuildContext context,
              GoRouterState state,
            ) =>
                HomeScreen(
              key: state.pageKey,
            ),
            routes: <RouteBase>[
              GoRoute(
                path: AppPage.notifications.toPath,
                name: AppPage.notifications.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    NotificationsScreen(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
        ],
      )
    ];
  }
}
