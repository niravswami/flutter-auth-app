part of 'admin_dashboard_permissions_bloc.dart';

sealed class AdminDashboardPermissionsEvent extends Equatable {
  const AdminDashboardPermissionsEvent();

  @override
  List<Object> get props => [];
}

class GetAdminDashboardPermissions extends AdminDashboardPermissionsEvent {}

class CreateAdminDashboardPermission extends AdminDashboardPermissionsEvent {
  final String permission;
  const CreateAdminDashboardPermission({required this.permission});

  @override
  List<Object> get props => [permission];
}

class UpdateAdminDashboardPermission extends AdminDashboardPermissionsEvent {
  final PermissionModel permissionData;
  final String text;
  const UpdateAdminDashboardPermission({
    required this.permissionData,
    required this.text,
  });

  @override
  List<Object> get props => [permissionData, text];
}

class DeleteAdminDashboardPermission extends AdminDashboardPermissionsEvent {
  final PermissionModel permissionData;
  const DeleteAdminDashboardPermission({required this.permissionData});

  @override
  List<Object> get props => [permissionData];
}
