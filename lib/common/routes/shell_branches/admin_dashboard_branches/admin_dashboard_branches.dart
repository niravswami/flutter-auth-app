import 'package:admin_dashboard_app/features/admin_dashboard/presentation/screens/admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../init_dependencies/navigator_key_dependencies_register.dart';
import '../../routes_constants.dart';

class AdminDashboardRouteBranches {
  late final List<StatefulShellBranch> _routes;
  final GetIt serviceLocator;

  AdminDashboardRouteBranches({required this.serviceLocator}) {
    _initializeRoutes();
  }
  List<StatefulShellBranch> get routes => _routes;

  void _initializeRoutes() {
    // final GlobalKey<NavigatorState> navigatorKey =
    //     GlobalKey<NavigatorState>(debugLabel: 'adminDashboardNav');

    _routes = <StatefulShellBranch>[
      StatefulShellBranch(
        navigatorKey: serviceLocator.get<GlobalKey<NavigatorState>>(
            instanceName: NavigatorKeyDependenciesRegisterInstanceName
                .adminDashboardShellNavigatorKey),
        routes: <RouteBase>[
          GoRoute(
            path: AppPage.adminDashboard.toPath,
            name: AppPage.adminDashboard.toName,
            builder: (
              BuildContext context,
              GoRouterState state,
            ) =>
                AdminDashboardScreen(
              key: state.pageKey,
            ),
            // routes: <RouteBase>[
            //   GoRoute(
            //     path: AppPage.notifications.toPath,
            //     name: AppPage.notifications.toName,
            //     builder: (
            //       BuildContext context,
            //       GoRouterState state,
            //     ) =>
            //         NotificationsScreen(
            //       key: state.pageKey,
            //     ),
            //   ),
            // ],
          ),
        ],
      )
    ];
  }
}
