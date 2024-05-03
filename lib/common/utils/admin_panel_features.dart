import 'package:flutter/material.dart';

import '../constants/permissions_constants.dart';
import '../routes/routes_constants.dart';
import 'has_role_permission/has_role_permission.dart';

List<Map<String, dynamic>> listOfAdminPanelFeatures(BuildContext context) {
  return [
    {
      'path': AppPage.adminDashboard.toPath,
      'namedPath': AppPage.adminDashboard.toName,
      'fullPath': AppPage.adminDashboard.toFullPath,
      'hasPermission': true,
      'icon': const Icon(Icons.dashboard),
      'label': 'Admin Dashboard',
      'description': 'Checkout overall performance of your product.',
      'children': [],
    },
    {
      'path': AppPage.adminECommerce.toPath,
      'namedPath': AppPage.adminECommerce.toName,
      'fullPath': AppPage.adminECommerce.toFullPath,
      'hasPermission': canAccess(
          context: context, permissions: [PermissionsConstants.readProducts]),
      'icon': const Icon(Icons.shopping_bag),
      'label': 'E-commerce',
      'description': 'List products.',
      'children': [],
    },
    {
      'path': AppPage.adminInbox.toPath,
      'namedPath': AppPage.adminInbox.toName,
      'fullPath': AppPage.adminInbox.toFullPath,
      'hasPermission': canAccess(
          context: context, permissions: [PermissionsConstants.readMail]),
      'icon': const Icon(Icons.inbox),
      'label': 'Inbox',
      'description': 'Checkout mails.',
      'children': [],
    },
    {
      'path': AppPage.adminUsers.toPath,
      'namedPath': AppPage.adminUsers.toName,
      'fullPath': AppPage.adminUsers.toFullPath,
      'hasPermission': canAccess(
          context: context, permissions: [PermissionsConstants.readUser]),
      'icon': const Icon(Icons.people),
      'label': 'Users',
      'description': 'Users with admin dashboard rights.',
      'children': [],
    },
    {
      'path': AppPage.adminRolesAndPermissions.toPath,
      'namedPath': AppPage.adminRolesAndPermissions.toName,
      'fullPath': AppPage.adminRolesAndPermissions.toFullPath,
      'hasPermission': canAccess(context: context, permissions: [
        PermissionsConstants.readRole,
        PermissionsConstants.readPermission,
        PermissionsConstants.assignUserRole,
      ]),
      'icon': const Icon(Icons.security),
      'label': 'Roles And Permissions',
      'description': 'Assign roles and permissions.',
      'children': [
        {
          'path': AppPage.adminRoles.toPath,
          'namedPath': AppPage.adminRoles.toName,
          'fullPath': AppPage.adminRoles.toFullPath,
          'hasPermission': canAccess(context: context, permissions: [
            PermissionsConstants.readRole,
          ]),
          'icon': const Icon(Icons.dashboard),
          'label': 'Roles',
        },
        {
          'path': AppPage.adminPermissions.toPath,
          'namedPath': AppPage.adminPermissions.toName,
          'fullPath': AppPage.adminPermissions.toFullPath,
          'hasPermission': canAccess(context: context, permissions: [
            PermissionsConstants.readRole,
          ]),
          'icon': const Icon(Icons.dashboard),
          'label': 'Permissions',
        },
        {
          'path': AppPage.adminUserRoles.toPath,
          'namedPath': AppPage.adminUserRoles.toName,
          'fullPath': AppPage.adminUserRoles.toFullPath,
          'hasPermission': canAccess(context: context, permissions: [
            PermissionsConstants.assignUserRole,
          ]),
          'icon': const Icon(Icons.dashboard),
          'label': 'User Roles',
        }
      ],
    },
    {
      'path': AppPage.adminPaymentGateways.toPath,
      'namedPath': AppPage.adminPaymentGateways.toName,
      'fullPath': AppPage.adminPaymentGateways.toFullPath,
      'hasPermission': canAccess(
          context: context,
          permissions: [PermissionsConstants.readPaymentGateway]),
      'icon': const Icon(Icons.payment),
      'label': 'Payment Gateways',
      'description': 'Payment gateway of app.',
      'children': [],
    },
  ];
}
