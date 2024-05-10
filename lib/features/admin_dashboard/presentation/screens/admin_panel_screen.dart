import 'package:flutter/material.dart';

import '../../../../common/utils/admin_panel_features.dart';
import '../../../../common/utils/helpers/filter_features_by_permissions_fn.dart';
import '../../../../common/utils/helpers/routing_helper_fn.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  late List<Map<String, dynamic>> adminPanelFeatures;

  List<Widget> _buildChildrenTiles(
      BuildContext context, List<dynamic> children) {
    if (children.isEmpty) {
      return []; // No children to display
    }

    return children.where((child) => child['hasPermission']).map((child) {
      return ListTile(
        leading: const Icon(
          Icons.remove,
          color: Colors.transparent,
        ),
        title: Text(child['label']),
        onTap: () {
          RoutingHelperFn.pushToName(context, child['namedPath']);
        },
      );
    }).toList();
  }

  Widget _buildFeatureTile(BuildContext context, Map<String, dynamic> feature) {
    List<Widget> childrenTiles =
        _buildChildrenTiles(context, feature['children']);

    if (childrenTiles.isEmpty) {
      return ListTile(
        leading: feature['icon'],
        title: Text(
          feature['label'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(feature['description']),
        onTap: () {
          RoutingHelperFn.pushToName(context, feature['namedPath']);
        },
      );
    }

    return ExpansionTile(
      leading: feature['icon'],
      title: Text(
        feature['label'],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(feature['description']),
      children: childrenTiles,
    );
  }

  @override
  Widget build(BuildContext context) {
    adminPanelFeatures =
        filterFeaturesByPermission(context, listOfAdminPanelFeatures(context));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
      ),
      body: ListView.builder(
        itemCount: adminPanelFeatures.length,
        itemBuilder: (context, index) {
          final feature = adminPanelFeatures[index];
          return Card(
            child: _buildFeatureTile(context, feature),
          );
        },
      ),
    );
  }
}
