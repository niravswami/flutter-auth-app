import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../features/admin_dashboard/presentation/screens/admin_dashboard_screen.dart';
import '../../../../../../features/admin_dashboard/presentation/screens/admin_e_commerce_screen.dart';
import '../../../../../../features/admin_dashboard/presentation/screens/admin_inbox_screen.dart';
import '../../../../../../features/admin_dashboard/presentation/screens/admin_panel_screen.dart';
import '../../../../../../features/admin_dashboard/presentation/screens/admin_payment_gateway_screen.dart';
import '../../../../../../features/admin_dashboard/presentation/screens/admin_roles_and_permissions_screen.dart';
import '../../../../../../features/admin_dashboard/presentation/screens/admin_users_screen.dart';
import '../../../../../../features/admin_dashboard/presentation/screens/roles_and_permissions/admin_permissions_screen.dart';
import '../../../../../../features/admin_dashboard/presentation/screens/roles_and_permissions/admin_roles_screen.dart';
import '../../../../../../features/admin_dashboard/presentation/screens/roles_and_permissions/admin_user_roles_screen.dart';
import '../../../../../../init_dependencies/navigator_key_dependencies_register.dart';
import '../../../../routes_constants.dart';

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
            path: AppPage.adminPanel.toPath,
            name: AppPage.adminPanel.toName,
            builder: (
              BuildContext context,
              GoRouterState state,
            ) =>
                AdminPanelScreen(
              key: state.pageKey,
            ),
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
              ),
              GoRoute(
                path: AppPage.adminECommerce.toPath,
                name: AppPage.adminECommerce.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    AdminECommerceScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: AppPage.adminInbox.toPath,
                name: AppPage.adminInbox.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    AdminInboxScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: AppPage.adminRolesAndPermissions.toPath,
                name: AppPage.adminRolesAndPermissions.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    AdminRolesAndPermissionsScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: AppPage.adminRoles.toPath,
                name: AppPage.adminRoles.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    AdminRolesScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: AppPage.adminPermissions.toPath,
                name: AppPage.adminPermissions.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    AdminPermissionsScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: AppPage.adminUserRoles.toPath,
                name: AppPage.adminUserRoles.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    AdminUserRolesScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: AppPage.adminUsers.toPath,
                name: AppPage.adminUsers.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    AdminUsersScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: AppPage.adminPaymentGateways.toPath,
                name: AppPage.adminPaymentGateways.toName,
                builder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    AdminPaymentGatewayScreen(
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
