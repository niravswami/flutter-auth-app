part of 'admin_dashboard_roles_bloc.dart';

sealed class AdminDashboardRolesEvent extends Equatable {
  const AdminDashboardRolesEvent();

  @override
  List<Object> get props => [];
}

final class AdminDashboardGetRoles extends AdminDashboardRolesEvent {}

final class AdminDashboardCreateRole extends AdminDashboardRolesEvent {
  final String role;
  const AdminDashboardCreateRole(this.role);
}

final class AdminDashboardUpdateRole extends AdminDashboardRolesEvent {
  final RoleModel roleData;
  final String newRoleName;

  const AdminDashboardUpdateRole({
    required this.roleData,
    required this.newRoleName,
  });
}

final class AdminDashboardDeleteRole extends AdminDashboardRolesEvent {
  final RoleModel roleData;

  const AdminDashboardDeleteRole({
    required this.roleData,
  });
}
