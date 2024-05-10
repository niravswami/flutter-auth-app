import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/errors/error_dialog.dart';
import '../../../../../common/utils/helpers/spacing_helper_fn.dart';
import '../../../data/models/permission_model.dart';
import '../../../data/models/role_model.dart';
import '../../bloc/admin_dashboard_permissions_bloc/admin_dashboard_permissions_bloc.dart';
import '../../bloc/admin_dashboard_roles_bloc/admin_dashboard_roles_bloc.dart';

class AssignPermissionsToRoleDialog extends StatefulWidget {
  final List<PermissionModel> allPermissions;
  final List<PermissionModel> initiallySelectedPermissions;
  final RoleModel role;

  const AssignPermissionsToRoleDialog({
    super.key,
    required this.allPermissions,
    required this.initiallySelectedPermissions,
    required this.role,
  });

  @override
  State<AssignPermissionsToRoleDialog> createState() =>
      _AssignPermissionsToRoleDialogState();
}

class _AssignPermissionsToRoleDialogState
    extends State<AssignPermissionsToRoleDialog> {
  late AdminDashboardPermissionsState permissionsState;
  List<int> selectedPermissionIds = [];
  bool isPermissionsEmpty = false;

  @override
  void initState() {
    super.initState();
    _getSelectedPermissionIds();
  }

  @override
  Widget build(BuildContext context) {
    permissionsState = context.watch<AdminDashboardPermissionsBloc>().state;

    isPermissionsEmpty = permissionsState.permissions == null ||
        (permissionsState.permissions != null &&
            permissionsState.permissions!.isEmpty);

    if (isPermissionsEmpty) {
      _getPermissions();
    }

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Role: ${widget.role.name}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SpacingHelperFn.verticalSpace(20),
            BlocConsumer<AdminDashboardRolesBloc, AdminDashboardRolesState>(
              listener: (context, state) {
                if (state is AdminDashboardRolesErrors) {
                  showErrorDialog(context, state.message);
                }
                if (state is AssignPermissionsToRoleSuccess) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (permissionsState.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: isPermissionsEmpty
                      ? const Center(
                          child: Text("No permission to assign"),
                        )
                      : ListView.builder(
                          itemCount: permissionsState.permissions != null
                              ? permissionsState.permissions!.length
                              : 0,
                          itemBuilder: (context, index) {
                            final permission =
                                permissionsState.permissions![index];
                            final isSelected =
                                selectedPermissionIds.contains(permission.id);
                            return CheckboxListTile(
                              title: Text(permission.name),
                              value: isSelected,
                              onChanged: (value) {
                                setState(
                                  () {
                                    if (value == true) {
                                      selectedPermissionIds.add(permission.id);
                                    } else {
                                      selectedPermissionIds
                                          .remove(permission.id);
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
                );
              },
            ),
            SpacingHelperFn.horizontalSpace(20),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: BlocConsumer<AdminDashboardRolesBloc,
                  AdminDashboardRolesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (permissionsState.isLoading ||
                              state is AssignPermissionsToRoleLoading) {
                            return;
                          }
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (permissionsState.isLoading ||
                              state is AssignPermissionsToRoleLoading) {
                            return;
                          }
                          context
                              .read<AdminDashboardRolesBloc>()
                              .add(AssignPermissionsToRole(
                                roleData: widget.role,
                                permissionIds: selectedPermissionIds,
                              ));
                        },
                        child: state is AssignPermissionsToRoleLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Assign',
                                style: TextStyle(fontSize: 16),
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getPermissions() {
    context
        .read<AdminDashboardPermissionsBloc>()
        .add(GetAdminDashboardPermissions());
  }

  void _getSelectedPermissionIds() {
    selectedPermissionIds = widget.role.permissions != null
        ? widget.role.permissions!
            .map(
              (p) => p.id,
            )
            .toList()
        : [];
  }
}

void showAssignPermissionsToRoleDialog(
    BuildContext context,
    List<PermissionModel> allPermissions,
    List<PermissionModel> initiallySelectedPermissions,
    RoleModel role) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AssignPermissionsToRoleDialog(
        allPermissions: allPermissions,
        initiallySelectedPermissions: initiallySelectedPermissions,
        role: role),
  );
}
