import 'package:admin_dashboard_app/common/constants/permissions_constants.dart';
import 'package:admin_dashboard_app/common/utils/has_role_permission/has_role_permission.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  late List<Map<String, dynamic>> adminFeatures;

  @override
  Widget build(BuildContext context) {
    adminFeatures = [
      {
        'url': '/one',
        'hasPermission': true,
        'icon': const Icon(Icons.dashboard),
        'label': 'Dashboard',
        'description': 'Checkout overall performance of your product.'
      },
      {
        'url': '/two',
        'hasPermission': canAccess(
            context: context, permissions: [PermissionsConstants.readProducts]),
        'icon': const Icon(Icons.shopping_bag),
        'label': 'E-commerce',
        'description': 'List products.'
      },
      {
        'url': '/four',
        'hasPermission': canAccess(
            context: context, permissions: [PermissionsConstants.readMail]),
        'icon': const Icon(Icons.inbox),
        'label': 'Inbox',
        'description': 'Checkout mails.'
      },
      {
        'url': '/four',
        'hasPermission': canAccess(
            context: context, permissions: [PermissionsConstants.readUser]),
        'icon': const Icon(Icons.people),
        'label': 'Users',
        'description': 'Users with admin dashboard rights.'
      },
      {
        'url': '/four',
        'hasPermission': canAccess(context: context, permissions: [
          PermissionsConstants.readRole,
          PermissionsConstants.readPermission
        ]),
        'icon': const Icon(Icons.security),
        'label': 'Roles And Permissions',
        'description': 'Assign roles and permissions.'
      },
      {
        'url': '/four',
        'hasPermission': canAccess(
            context: context,
            permissions: [PermissionsConstants.readPaymentGateway]),
        'icon': const Icon(Icons.payment),
        'label': 'Payment Gateways',
        'description': 'Payment gateway of app.'
      },
    ]
        .where(
          (Map<String, dynamic> item) => item['hasPermission'],
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
      ),
      body: ListView.builder(
        itemCount: adminFeatures.length,
        itemBuilder: (context, index) {
          final feature = adminFeatures[index];
          return Card(
            child: ListTile(
              leading: feature['icon'],
              title: Text(feature['label']),
              subtitle: Text(feature['description']),
              onTap: () {
                // Handle onTap event, e.g., navigate to a specific URL
                // Navigator.pushNamed(context, feature['url']);
              },
            ),
          );
        },
      ),
    );
  }
}
