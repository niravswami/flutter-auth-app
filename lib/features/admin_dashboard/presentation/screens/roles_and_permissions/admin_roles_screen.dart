import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/errors/error_dialog.dart';
import '../../../../../common/utils/confirmation_dialog.dart';
import '../../../../../common/utils/show_snackbar.dart';
import '../../../data/models/role_model.dart';
import '../../bloc/admin_dashboard_roles_bloc/admin_dashboard_roles_bloc.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/roles_widgets/assign_permissions_to_role_dialog.dart';
import '../../widgets/roles_widgets/role_create_update_dialog.dart';

class AdminRolesScreen extends StatefulWidget {
  const AdminRolesScreen({super.key});

  @override
  State<AdminRolesScreen> createState() => _AdminRolesScreenState();
}

class _AdminRolesScreenState extends State<AdminRolesScreen> {
  List<RoleModel> roleList = [];
  @override
  void initState() {
    super.initState();
    _getRoles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Roles"),
        actions: [
          TextButton.icon(
            onPressed: () {
              showRoleCreateDialog(context);
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Role"),
          ),
        ],
      ),
      body: BlocConsumer<AdminDashboardRolesBloc, AdminDashboardRolesState>(
        listener: (context, state) {
          if (state is AdminDashboardRolesErrors) {
            showErrorDialog(context, state.message);
          }
          if (state is AdminDashboardRolesSuccess) {
            roleList = state.roles;
          }
          if (state is AdminDashboardRoleCreateSuccess) {
            roleList = [state.role, ...roleList];
          }
          if (state is AdminDashboardRoleUpdateSuccess) {
            roleList = _filterAndUpdateRoleList(state.role);
          }
          if (state is AssignPermissionsToRoleSuccess) {
            roleList = _filterAndUpdateRoleList(state.role);
          }

          if (state is AdminDashboardRoleDeleteSuccess) {
            roleList =
                roleList.where((role) => role.id != state.role.id).toList();
            showSnackBar(context, '${state.role.name} has been removed.');
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              _getRoles();
            },
            child: _buildContent(state, roleList),
          );
        },
      ),
    );
  }

  void _getRoles() {
    context.read<AdminDashboardRolesBloc>().add(AdminDashboardGetRoles());
  }

  Widget _buildContent(
    AdminDashboardRolesState state,
    List<RoleModel> roleList,
  ) {
    if (state is AdminDashboardRolesLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return roleList.isNotEmpty
        ? ListView.builder(
            itemCount: roleList.length,
            itemBuilder: (context, index) {
              final role = roleList[index];
              return _buildRoleTile(context, role);
            },
          )
        : const Center(
            child: Text(
              "No Roles, Start creating new role by pressing' Add Role'",
            ),
          );
  }

  Widget _buildPopupMenuButton(
    BuildContext context,
    RoleModel role,
  ) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        switch (value) {
          case "edit":
            showRoleUpdateDialog(context, role);
            break;
          case "delete":
            showRoleDeleteConfirmationDialog(
                context: context,
                role: role,
                onDeletePressed: () {
                  context
                      .read<AdminDashboardRolesBloc>()
                      .add(AdminDashboardDeleteRole(roleData: role));
                });
            break;
          case "assign-permission":
            showAssignPermissionsToRoleDialog(context, [], [], role);

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
            value: "assign-permission",
            child: Text("Assign Permission"),
          ),
          const PopupMenuItem(
            value: "delete",
            child: Text("Delete"),
          ),
        ];
      },
    );
  }

  Widget _buildRoleTile(
    BuildContext context,
    RoleModel role,
  ) {
    if (role.permissions != null && role.permissions!.isEmpty) {
      return Card(
        child: ListTile(
          title: Text(role.name,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text("No permissions"),
          trailing: _buildPopupMenuButton(context, role),
        ),
      );
    } else {
      return _buildRoleTileWithPermissions(context, role);
    }
  }

  Widget _buildRoleTileWithPermissions(
    BuildContext context,
    RoleModel role,
  ) {
    final permissions = role.permissions!;
    return Card(
      child: ExpansionTile(
        trailing: _buildPopupMenuButton(context, role),
        title: Text(role.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("show ${permissions.length} permissions"),
        children: [buildChips(permissions)],
      ),
    );
  }

  List<RoleModel> _filterAndUpdateRoleList(RoleModel updatedRole) {
    return [
      updatedRole,
      ...roleList.where((role) => role.id != updatedRole.id)
    ];
  }
}
