part of 'admin_dashboard_roles_bloc.dart';

sealed class AdminDashboardRolesEvent extends Equatable {
  const AdminDashboardRolesEvent();

  @override
  List<Object> get props => [];
}

final class AdminDashboardGetRoles extends AdminDashboardRolesEvent {}
