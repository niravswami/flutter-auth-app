import '../../../../common/constants/api_constants.dart';
import '../../../../common/errors/error_exception_handler.dart';
import '../../../../common/services/api_services/api_service.dart';
import '../models/role_model.dart';

abstract interface class AdminDashboardRemoteDataSource {
  // ROLES
  Future<Map<String, dynamic>> getAdminDashboardRoles();
  Future<Map<String, dynamic>> createAdminDashboardRoleReq({
    required String role,
  });
  Future<Map<String, dynamic>> updateAdminDashboardRoleReq({
    required RoleModel roleData,
    required String newRoleName,
  });
  Future<Map<String, dynamic>> deleteAdminDashboardRoleReq({
    required RoleModel roleData,
  });
  Future<Map<String, dynamic>> assignPermissionsToRoleReq({
    required RoleModel roleData,
    required List<int> permissionIds,
  });
}

class AdminDashboardRemoteDataSourceImpl
    extends AdminDashboardRemoteDataSource {
  final ApiService apiService;

  AdminDashboardRemoteDataSourceImpl({required this.apiService});
// ROLES
  @override
  Future<Map<String, dynamic>> getAdminDashboardRoles() {
    return errorExceptionHandler(() async {
      final response = await apiService
          .getReq(AuthApiEndpointConstants.getAdminDashboardRoles);
      return response;
    });
  }

  @override
  Future<Map<String, dynamic>> createAdminDashboardRoleReq({
    required String role,
  }) {
    return errorExceptionHandler(() async {
      final response = await apiService
          .postReq(AuthApiEndpointConstants.createAdminDashboardRole, {
        "role": role,
      });
      return response;
    });
  }

  @override
  Future<Map<String, dynamic>> updateAdminDashboardRoleReq({
    required RoleModel roleData,
    required String newRoleName,
  }) {
    return errorExceptionHandler(() async {
      final response = await apiService.patchReq(
        AuthApiEndpointConstants.updateAdminDashboardRole.replaceAll(
          ':role_id',
          roleData.id.toString(),
        ),
        {
          "role": newRoleName,
        },
      );
      return response;
    });
  }

  @override
  Future<Map<String, dynamic>> deleteAdminDashboardRoleReq(
      {required RoleModel roleData}) {
    return errorExceptionHandler(() async {
      final response = await apiService.deleteReq(
        AuthApiEndpointConstants.deleteAdminDashboardRole,
        {
          "id": roleData.id,
        },
      );
      return response;
    });
  }

  @override
  Future<Map<String, dynamic>> assignPermissionsToRoleReq({
    required RoleModel roleData,
    required List<int> permissionIds,
  }) {
    return errorExceptionHandler(() async {
      final response = await apiService.postReq(
          AuthApiEndpointConstants.assignPermissionsToRole.replaceAll(
            ':role_id',
            roleData.id.toString(),
          ),
          {
            "permissionIds": permissionIds,
          });
      return response;
    });
  }
}
