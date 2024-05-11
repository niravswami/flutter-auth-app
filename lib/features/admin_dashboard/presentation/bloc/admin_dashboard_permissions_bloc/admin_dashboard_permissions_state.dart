part of 'admin_dashboard_permissions_bloc.dart';

class AdminDashboardPermissionsState extends Equatable {
  final List<PermissionModel>? permissions;
  final int? statusCode;
  final String? errorMessage;
  final Map<String, dynamic>? errors;
  final bool isLoading;
  final PermissionModel? permissionCreated;
  final PermissionModel? permissionUpdated;
  final PermissionModel? permissionDeleted;

  const AdminDashboardPermissionsState({
    this.permissions,
    this.statusCode,
    this.errorMessage,
    this.errors,
    this.isLoading = false,
    this.permissionCreated,
    this.permissionUpdated,
    this.permissionDeleted,
  });

  factory AdminDashboardPermissionsState.initial() =>
      const AdminDashboardPermissionsState();

  factory AdminDashboardPermissionsState.loading(bool isLoading) =>
      AdminDashboardPermissionsState(
        isLoading: isLoading,
      );

  factory AdminDashboardPermissionsState.success(
          List<PermissionModel> permissions) =>
      AdminDashboardPermissionsState(
        permissions: permissions,
      );

  factory AdminDashboardPermissionsState.permissionCreated(
          PermissionModel permission) =>
      AdminDashboardPermissionsState(
        permissionCreated: permission,
      );

  factory AdminDashboardPermissionsState.permissionUpdated(
          PermissionModel permission) =>
      AdminDashboardPermissionsState(
        permissionUpdated: permission,
      );

  factory AdminDashboardPermissionsState.permissionDeleted(
          PermissionModel permission) =>
      AdminDashboardPermissionsState(
        permissionDeleted: permission,
      );

  factory AdminDashboardPermissionsState.error({
    int? statusCode,
    required String message,
    Map<String, dynamic>? errors,
  }) =>
      AdminDashboardPermissionsState(
        statusCode: statusCode,
        errorMessage: message,
        errors: errors,
      );

  @override
  List<Object?> get props => [
        permissions,
        statusCode,
        errorMessage,
        errors,
        permissionCreated,
        permissionUpdated,
        permissionDeleted,
        isLoading,
      ];
}

// sealed class AdminDashboardPermissionsState extends Equatable {
//   const AdminDashboardPermissionsState();

//   @override
//   List<Object> get props => [];
// }

// final class AdminDashboardPermissionsInitial
//     extends AdminDashboardPermissionsState {}

// final class AdminDashboardPermissionsLoading
//     extends AdminDashboardPermissionsState {}

// final class AdminDashboardPermissionsSuccess
//     extends AdminDashboardPermissionsState {
//   final List<PermissionModel> permissions;

//   const AdminDashboardPermissionsSuccess({
//     required this.permissions,
//   });
// }

// final class AdminDashboardPermissionsErrors
//     extends AdminDashboardPermissionsState {
//   final int? statusCode;
//   final String message;
//   final Map<String, dynamic>? errors;

//   const AdminDashboardPermissionsErrors({
//     this.statusCode,
//     required this.message,
//     this.errors,
//   });
// }
