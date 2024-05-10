import '../../../../../common/constants/api_constants.dart';
import '../../../../../common/errors/error_exception_handler.dart';
import '../../../../../common/services/api_services/api_service.dart';
import '../../models/permission_model.dart';

abstract interface class PermissionsAdminDashboardRemoteDataSource {
  Future<Map<String, dynamic>> getAdminDashboardPermissionsReq();
  Future<Map<String, dynamic>> createPermissionAdminDashboardReq({
    required String permission,
  });
  Future<Map<String, dynamic>> deletePermissionAdminDashboardReq({
    required PermissionModel permissionData,
  });
  Future<Map<String, dynamic>> updatePermissionAdminDashboardReq({
    required PermissionModel permissionData,
    required String text,
  });
}

class PermissionsAdminDashboardRemoteDataSourceImpl
    implements PermissionsAdminDashboardRemoteDataSource {
  final ApiService apiService;

  PermissionsAdminDashboardRemoteDataSourceImpl({
    required this.apiService,
  });

  @override
  Future<Map<String, dynamic>> getAdminDashboardPermissionsReq() {
    return errorExceptionHandler(() async {
      final response = await apiService
          .getReq(AuthApiEndpointConstants.getAdminDashboardPermissions);
      return response;
    });
  }

  @override
  Future<Map<String, dynamic>> createPermissionAdminDashboardReq({
    required String permission,
  }) {
    return errorExceptionHandler(() async {
      final response = await apiService
          .postReq(AuthApiEndpointConstants.createPermissionAdminDashboard, {
        "permission": permission,
      });
      return response;
    });
  }

  @override
  Future<Map<String, dynamic>> updatePermissionAdminDashboardReq({
    required PermissionModel permissionData,
    required String text,
  }) {
    return errorExceptionHandler(() async {
      final response = await apiService.patchReq(
          AuthApiEndpointConstants.updatePermissionAdminDashboard.replaceAll(
            ':permission_id',
            permissionData.id.toString(),
          ),
          {
            "permission": text,
          });
      return response;
    });
  }

  @override
  Future<Map<String, dynamic>> deletePermissionAdminDashboardReq({
    required PermissionModel permissionData,
  }) {
    return errorExceptionHandler(() async {
      final response = await apiService
          .deleteReq(AuthApiEndpointConstants.deletePermissionAdminDashboard, {
        "id": permissionData.id,
      });
      return response;
    });
  }
}
