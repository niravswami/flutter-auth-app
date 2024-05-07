import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/utils/input_formatters.dart';
import '../../../data/models/role_model.dart';
import '../../bloc/admin_dashboard_roles_bloc/admin_dashboard_roles_bloc.dart';

class RoleCreateUpdateDialog extends StatefulWidget {
  final String? initialRoleName;
  final String title;
  final String positiveButtonLabel;
  final RoleModel? roleData;
  // final void Function(String roleName) onSubmit;

  const RoleCreateUpdateDialog({
    super.key,
    this.initialRoleName,
    this.roleData,
    required this.title,
    required this.positiveButtonLabel,
    // required this.onSubmit,
  });

  @override
  State<RoleCreateUpdateDialog> createState() => _RoleCreateUpdateDialogState();
}

class _RoleCreateUpdateDialogState extends State<RoleCreateUpdateDialog> {
  late TextEditingController _roleNameController;

  @override
  void initState() {
    super.initState();

    if (widget.roleData != null) {
      _roleNameController = TextEditingController(text: widget.roleData!.name);
    } else {
      _roleNameController = TextEditingController(text: widget.initialRoleName);
    }
  }

  @override
  void dispose() {
    _roleNameController.dispose();
    super.dispose();
  }

  void onSubmit() {
    // Handle role submission here
    if (widget.roleData != null) {
      context.read<AdminDashboardRolesBloc>().add(
            AdminDashboardUpdateRole(
                roleData: widget.roleData!,
                newRoleName: _roleNameController.text.trim()),
          );
    } else {
      context.read<AdminDashboardRolesBloc>().add(
            AdminDashboardCreateRole(
              _roleNameController.text.trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminDashboardRolesBloc, AdminDashboardRolesState>(
      listener: (context, state) {
        if (state is AdminDashboardRoleCreateSuccess ||
            state is AdminDashboardRoleUpdateSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: Text(widget.title),
          content: TextField(
            textCapitalization: TextCapitalization.characters,
            controller: _roleNameController,
            inputFormatters: [
              UpperCaseTextFormatter(),
              SpaceToUnderscoreFormatter(),
              NoSpecialCharactersFormatter(),
            ],
            decoration: const InputDecoration(
              labelText: 'Role Name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (state is AdminDashboardRoleCreateLoading) {
                  return;
                }
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (state is AdminDashboardRoleCreateLoading) {
                  return;
                }
                final roleName = _roleNameController.text.trim();
                if (roleName.isNotEmpty) {
                  onSubmit();
                }
              },
              child: state is AdminDashboardRoleCreateLoading
                  ? const CircularProgressIndicator()
                  : Text(widget.positiveButtonLabel),
            ),
          ],
        );
      },
    );
  }
}

void showRoleCreateDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const RoleCreateUpdateDialog(
      title: 'Add Role',
      positiveButtonLabel: 'Add',
    ),
  );
}

void showRoleUpdateDialog(BuildContext context, RoleModel role) {
  showDialog(
    context: context,
    builder: (_) => RoleCreateUpdateDialog(
      title: 'Edit Role',
      positiveButtonLabel: 'Update',
      roleData: role,
    ),
  );
}
