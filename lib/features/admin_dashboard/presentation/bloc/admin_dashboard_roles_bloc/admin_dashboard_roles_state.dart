part of 'admin_dashboard_roles_bloc.dart';

sealed class AdminDashboardRolesState extends Equatable {
  const AdminDashboardRolesState();

  @override
  List<Object> get props => [];
}

final class AdminDashboardRolesInitial extends AdminDashboardRolesState {}

final class AdminDashboardRolesLoading extends AdminDashboardRolesState {}

final class AdminDashboardRoleCreateLoading extends AdminDashboardRolesState {}

final class AdminDashboardRoleCreateSuccess extends AdminDashboardRolesState {
  final RoleModel role;

  const AdminDashboardRoleCreateSuccess({
    required this.role,
  });
}

final class AdminDashboardRoleUpdateSuccess extends AdminDashboardRolesState {
  final RoleModel role;

  const AdminDashboardRoleUpdateSuccess({
    required this.role,
  });
}

final class AdminDashboardRolesSuccess extends AdminDashboardRolesState {
  final List<RoleModel> roles;

  const AdminDashboardRolesSuccess({
    required this.roles,
  });
}

final class AdminDashboardRolesErrors extends AdminDashboardRolesState {
  final int? statusCode;
  final String message;
  final Map<String, dynamic>? errors;

  const AdminDashboardRolesErrors({
    this.statusCode,
    required this.message,
    this.errors,
  });
}

final class AdminDashboardRoleDeleteLoading extends AdminDashboardRolesState {}

final class AdminDashboardRoleDeleteSuccess extends AdminDashboardRolesState {
  final RoleModel role;

  const AdminDashboardRoleDeleteSuccess({
    required this.role,
  });
}

final class AssignPermissionsToRoleLoading extends AdminDashboardRolesState {}

final class AssignPermissionsToRoleSuccess extends AdminDashboardRolesState {
  final RoleModel role;

  const AssignPermissionsToRoleSuccess({
    required this.role,
  });
}
