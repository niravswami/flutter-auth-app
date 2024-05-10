class ApiConstants {
  ApiConstants._();
  // static const String baseUrl = "http://localhost:82/api";
  static const String baseUrl = "http://localhost/api";
}

class AuthApiEndpointConstants {
  AuthApiEndpointConstants._();

  // Auth
  static const String login = "/login";
  static const String register = "/register";
  static const String getUserDetail = "/get-user-detail";
  static const String logout = "/logout";

  // Roles and Permissions
  // Roles
  static const String getAdminDashboardRoles = '/admin-dashboard/roles';
  static const String createAdminDashboardRole = '/admin-dashboard/roles/store';
  static const String updateAdminDashboardRole =
      '/admin-dashboard/roles/:role_id/update';
  static const String deleteAdminDashboardRole =
      '/admin-dashboard/roles/delete';
  static const String assignPermissionsToRole =
      '/admin-dashboard/roles/:role_id/assign-permissions';

  // Permissions
  static const String getAdminDashboardPermissions =
      '/admin-dashboard/permissions';
  static const String createPermissionAdminDashboard =
      '/admin-dashboard/permissions/store';
  static const String updatePermissionAdminDashboard =
      '/admin-dashboard/permissions/:permission_id/update';
  static const String deletePermissionAdminDashboard =
      '/admin-dashboard/permissions/delete';
}
