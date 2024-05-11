import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/admin_dashboard/data/models/permission_model.dart';
import '../../features/admin_dashboard/data/models/role_model.dart';
import '../../features/admin_dashboard/presentation/bloc/admin_dashboard_permissions_bloc/admin_dashboard_permissions_bloc.dart';
import '../../features/admin_dashboard/presentation/bloc/admin_dashboard_roles_bloc/admin_dashboard_roles_bloc.dart';

void showRoleDeleteConfirmationDialog({
  required BuildContext context,
  required RoleModel role,
  bool isProcessing = false,
  required Function onDeletePressed,
  // required AdminDashboardRolesState state,
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) =>
        BlocConsumer<AdminDashboardRolesBloc, AdminDashboardRolesState>(
      listener: (context, state) {
        if (state is AdminDashboardRoleDeleteSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: const Text("Delete Role"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Are you sure you want to delete ${role.name} role?',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (state is AdminDashboardRoleDeleteLoading) {
                        return;
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (state is AdminDashboardRoleDeleteLoading) {
                        return;
                      }
                      onDeletePressed();
                    },
                    child: state is AdminDashboardRoleDeleteLoading
                        ? const CircularProgressIndicator()
                        : const Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}

void showPermissionDeleteConfirmationDialog({
  required BuildContext context,
  required PermissionModel permission,
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => BlocConsumer<
        AdminDashboardPermissionsBloc, AdminDashboardPermissionsState>(
      listener: (context, state) {
        if (state.permissionDeleted != null) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: const Text("Delete Permission"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Are you sure you want to delete ${permission.name} permission?',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (state.isLoading) {
                        return;
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (state.isLoading) {
                        return;
                      }
                      context.read<AdminDashboardPermissionsBloc>().add(
                          DeleteAdminDashboardPermission(
                              permissionData: permission));
                    },
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}

void showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String text,
  required String actionBtnText,
  bool? isRequesting,
  Function()? onCancel,
  required Function() onSubmit,
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  if (onCancel != null) {
                    onCancel();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Cancel'),
              ),
              OutlinedButton(
                onPressed: () {
                  if (isRequesting != null) {}

                  onSubmit();
                },
                child: Text(actionBtnText),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
