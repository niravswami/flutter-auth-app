import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../init_dependencies/init_dependencies_imports.dart';
import '../constants/permissions_constants.dart';
import '../routes/routes_constants.dart';
import '../routes/shell_branches/admin_dashboard_branches/admin_dashboard_branches.dart';
import '../routes/shell_branches/home_branches/home_branches.dart';
import '../routes/shell_branches/profile_branches/profile_branches.dart';
import 'has_role_permission/has_role_permission.dart';

List<Map<String, dynamic>> mainBottomTabs(BuildContext context) {
  return [
    {
      'hasPermission': true,
      'selectedIcon': const Icon(
        Icons.home,
      ),
      'routeName': AppPage.home.toName,
      'icon': const Icon(Icons.home_outlined),
      'label': 'Home',
    },
    {
      'hasPermission': canAccess(context: context, permissions: [
        PermissionsConstants.readAdminDashboard,
      ]),
      'selectedIcon': const Icon(
        Icons.dashboard,
      ),
      'routeName': AppPage.adminDashboard.toName,
      'icon': const Icon(Icons.dashboard_outlined),
      'label': 'Admin Dashboard',
    },
    {
      'hasPermission': true,
      'selectedIcon': const Icon(
        Icons.person,
      ),
      'routeName': AppPage.profile.toName,
      'icon': const Icon(Icons.person_outline),
      'label': 'Profile',
    },
  ];
}

// List<StatefulShellBranch> mainBottomTabsShellRoutes(BuildContext context) {
//   final rin = [
//     {
//       'hasPermission': true,
//       'routeName': AppPage.home.toName,
//       'label': 'Home',
//       'route': HomeRouteBranches().routes
//     },
//     {
//       'hasPermission': canAccess(context: context, permissions: [
//         PermissionsConstants.readAdminDashboard,
//       ]),
//       'routeName': AppPage.adminDashboard.toName,
//       'label': 'Admin Dashboard',
//       'route':
//           AdminDashboardRouteBranches(serviceLocator: serviceLocator).routes,
//     },
//     {
//       'hasPermission': true,
//       'routeName': AppPage.profile.toName,
//       'label': 'Profile',
//       'route': ProfileRouteBranches().routes,
//     },
//   ];

//   return rin
//       .where(
//         (Map<String, dynamic> item) => item['hasPermission'],
//       )
//       .map((Map<String, dynamic> item) => item['route'])
//       .toList();
//   return <StatefulShellBranch>[
//     ...HomeRouteBranches().routes,
//     ...AdminDashboardRouteBranches(serviceLocator: serviceLocator).routes,
//     ...ProfileRouteBranches().routes,
//   ];
// }
