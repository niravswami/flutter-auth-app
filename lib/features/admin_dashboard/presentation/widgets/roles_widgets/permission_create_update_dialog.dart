// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/utils/input_formatters.dart';
import '../../../data/models/permission_model.dart';
import '../../bloc/admin_dashboard_permissions_bloc/admin_dashboard_permissions_bloc.dart';

class PermissionCreateUpdateDialog extends StatefulWidget {
  final String title;
  final String positiveButtonLabel;
  final PermissionModel? permissionData;
  final Function() onSubmit;

  const PermissionCreateUpdateDialog(
      {super.key,
      required this.title,
      required this.positiveButtonLabel,
      this.permissionData,
      required this.onSubmit});

  @override
  State<PermissionCreateUpdateDialog> createState() =>
      _PermissionCreateUpdateDialogState();
}

class _PermissionCreateUpdateDialogState
    extends State<PermissionCreateUpdateDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.permissionData != null) {
      _textEditingController.text = widget.permissionData!.name;
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onSubmit() {
    if (widget.permissionData != null) {
      context.read<AdminDashboardPermissionsBloc>().add(
          UpdateAdminDashboardPermission(
              permissionData: widget.permissionData!,
              text: _textEditingController.text.trim()));
    } else {
      context.read<AdminDashboardPermissionsBloc>().add(
          CreateAdminDashboardPermission(
              permission: _textEditingController.text.trim()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final permissionState =
        context.watch<AdminDashboardPermissionsBloc>().state;
    final permissionCreated = permissionState.permissionCreated;
    final permissionUpdated = permissionState.permissionUpdated;
    if (permissionCreated != null || permissionUpdated != null) {
      Navigator.of(context).pop();
    }
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        autofocus: true,
        controller: _textEditingController,
        inputFormatters: [
          LowerCaseTextFormatter(),
          SpaceToHyphenFormatter(),
          NoSpecialCharactersButAllowHyphenFormatter(),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (permissionState.isLoading) {
              return;
            }
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () {
            if (permissionState.isLoading) {
              return;
            }
            onSubmit();
          },
          child: permissionState.isLoading
              ? const CircularProgressIndicator()
              : Text(widget.positiveButtonLabel),
          // child: const CircularProgressIndicator(),
        ),
      ],
    );
  }
}

void showCreatePermissionDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => PermissionCreateUpdateDialog(
      positiveButtonLabel: "Add",
      title: "Add Permission",
      onSubmit: () {},
    ),
  );
}

void showUpdatePermissionDialog({
  required BuildContext context,
  required PermissionModel permissionData,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => PermissionCreateUpdateDialog(
      positiveButtonLabel: "Update",
      title: "Update Permission",
      permissionData: permissionData,
      onSubmit: () {},
    ),
  );
}
