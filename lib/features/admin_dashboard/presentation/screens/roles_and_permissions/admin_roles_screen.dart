import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/permission_model.dart';
import '../../../data/models/role_model.dart';
import '../../bloc/admin_dashboard_roles_bloc/admin_dashboard_roles_bloc.dart';

class AdminRolesScreen extends StatefulWidget {
  const AdminRolesScreen({super.key});

  @override
  State<AdminRolesScreen> createState() => _AdminRolesScreenState();
}

class _AdminRolesScreenState extends State<AdminRolesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdminDashboardRolesBloc>().add(AdminDashboardGetRoles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Roles Gateways"),
      ),
      body: BlocBuilder<AdminDashboardRolesBloc, AdminDashboardRolesState>(
        builder: (context, state) {
          if (state is AdminDashboardRolesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AdminDashboardRolesSuccess) {
            return ListView.builder(
              itemCount: state.roles.length,
              itemBuilder: (context, index) {
                final role = state.roles[index];
                return _buildRoleTile(role);
              },
            );
          } else if (state is AdminDashboardRolesErrors) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text("No Roles"),
            );
          }
        },
      ),
    );
  }

  Widget _buildPopupMenuButton() {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {},
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: "1",
            child: Text("Edit"),
          ),
          const PopupMenuItem(
            value: "2",
            child: Text("Assign Permission"),
          ),
          const PopupMenuItem(
            value: "3",
            child: Text("Delete"),
          ),
        ];
      },
    );
  }

  Widget _buildRoleTile(RoleModel role) {
    if (role.permissions != null && role.permissions!.isEmpty) {
      return Card(
        child: ListTile(
          title: Text(role.name),
          subtitle: const Text("No permissions"),
          trailing: _buildPopupMenuButton(),
        ),
      );
    } else {
      return _buildRoleTileWithPermissions(role);
    }
  }

  Widget _buildPermissionsChips(List<PermissionModel> permissions) {
    final permissionChips = permissions.map((permission) {
      return Chip(
        label: Text(permission.name),
      );
    }).toList();

    return Wrap(
      spacing: 8, // Adjust spacing between chips
      children: permissionChips,
    );
  }

  Widget _buildRoleTileWithPermissions(RoleModel role) {
    final permissions = role.permissions!;
    return Card(
      child: ExpansionTile(
        trailing: _buildPopupMenuButton(),
        title: Text(role.name),
        subtitle: Text("show ${permissions.length} permissions"),
        children: [_buildPermissionsChips(permissions)],
      ),
    );
  }
}
