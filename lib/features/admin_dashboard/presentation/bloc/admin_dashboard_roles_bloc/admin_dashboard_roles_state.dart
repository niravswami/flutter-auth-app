part of 'admin_dashboard_roles_bloc.dart';

sealed class AdminDashboardRolesState extends Equatable {
  const AdminDashboardRolesState();

  @override
  List<Object> get props => [];
}

final class AdminDashboardRolesInitial extends AdminDashboardRolesState {}

final class AdminDashboardRolesLoading extends AdminDashboardRolesState {}

final class AdminDashboardRolesSuccess extends AdminDashboardRolesState {
  final List<RoleModel> roles;

  const AdminDashboardRolesSuccess({required this.roles});
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
