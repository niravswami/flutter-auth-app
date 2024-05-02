import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/user_profile/presentation/screens/user_profile.dart';
import '../../../../features/user_profile/presentation/screens/user_profile_settings_screen.dart';
import '../../routes_constants.dart';

class ProfileRouteBranches {
  late final List<StatefulShellBranch> _routes;

  ProfileRouteBranches() {
    _initializeRoutes();
  }
  List<StatefulShellBranch> get routes => _routes;

  void _initializeRoutes() {
    final GlobalKey<NavigatorState> navigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'profileNav');

    _routes = <StatefulShellBranch>[
      StatefulShellBranch(
        navigatorKey: navigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: AppPage.profile.toPath,
            name: AppPage.profile.toName,
            builder: (
              BuildContext context,
              GoRouterState state,
            ) =>
                UserProfileScreen(
              key: state.pageKey,
            ),
            routes: <RouteBase>[
              GoRoute(
                path: AppPage.profileSettings.toPath,
                name: AppPage.profileSettings.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    UserProfileSettingsScreen(
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
