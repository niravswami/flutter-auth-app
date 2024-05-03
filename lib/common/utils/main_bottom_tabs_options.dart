import 'package:flutter/material.dart';

import '../constants/permissions_constants.dart';
import '../routes/routes_constants.dart';
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
