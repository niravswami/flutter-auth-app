import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/errors/error_dialog.dart';
import '../../../../../common/utils/confirmation_dialog.dart';
import '../../../data/models/permission_model.dart';
import '../../bloc/admin_dashboard_permissions_bloc/admin_dashboard_permissions_bloc.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/roles_widgets/permission_create_update_dialog.dart';

class AdminPermissionsScreen extends StatefulWidget {
  const AdminPermissionsScreen({super.key});

  @override
  State<AdminPermissionsScreen> createState() => _AdminPermissionsScreenState();
}

class _AdminPermissionsScreenState extends State<AdminPermissionsScreen> {
  List<PermissionModel> permissionList = [];
  @override
  void initState() {
    _getPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Permissions"),
        actions: [
          TextButton.icon(
            onPressed: () {
              showCreatePermissionDialog(context: context);
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Permission"),
          ),
        ],
      ),
      body: BlocConsumer<AdminDashboardPermissionsBloc,
          AdminDashboardPermissionsState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showErrorDialog(context, state.errorMessage);
          }
          final statePermissionsList = state.permissions;
          if (statePermissionsList != null) {
            permissionList = statePermissionsList;
          }
          final permissionCreated = state.permissionCreated;
          if (permissionCreated != null) {
            permissionList = [permissionCreated, ...permissionList];
          }
          final permissionUpdated = state.permissionUpdated;
          if (permissionUpdated != null) {
            permissionList = [
              permissionUpdated,
              ...permissionList.where((item) => item.id != permissionUpdated.id)
            ];
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              _getPermissions();
            },
            child: _buildContent(state, permissionList),
          );
        },
      ),
    );
  }

  void _getPermissions() {
    context
        .read<AdminDashboardPermissionsBloc>()
        .add(GetAdminDashboardPermissions());
  }

  Widget _buildContent(
    AdminDashboardPermissionsState state,
    List<PermissionModel> dataList,
  ) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return dataList.isNotEmpty
        ? ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              final item = dataList[index];
              return _buildPermissionTile(context, item);
            },
          )
        : const Center(
            child: Text(
              "No Permission, Start creating new permission by pressing' Add Permission'",
            ),
          );
  }

  Widget _buildPopupMenuButton(
    BuildContext context,
    PermissionModel item,
  ) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        switch (value) {
          case "edit":
            showUpdatePermissionDialog(context: context, permissionData: item);
            break;
          case "delete":
            showPermissionDeleteConfirmationDialog(
              context: context,
              permission: item,
            );
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: "edit",
            child: Text("Edit"),
          ),
          const PopupMenuItem(
            value: "delete",
            child: Text("Delete"),
          ),
        ];
      },
    );
  }

  Widget _buildPermissionTile(
    BuildContext context,
    PermissionModel permission,
  ) {
    if (permission.roles != null && permission.roles!.isEmpty) {
      return Card(
        child: ListTile(
          title: Text(
            permission.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text("No permissions"),
          trailing: _buildPopupMenuButton(context, permission),
        ),
      );
    } else {
      return _buildRoleTileWithPermissions(context, permission);
    }
  }

  Widget _buildRoleTileWithPermissions(
    BuildContext context,
    PermissionModel permission,
  ) {
    final roles = permission.roles!;
    return Card(
      child: ExpansionTile(
        trailing: _buildPopupMenuButton(context, permission),
        title: Text(permission.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("show ${roles.length} roles"),
        children: [buildChips(roles)],
      ),
    );
  }
}
