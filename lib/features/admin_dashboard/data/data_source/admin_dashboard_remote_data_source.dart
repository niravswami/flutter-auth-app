import '../../../../common/constants/api_constants.dart';
import '../../../../common/errors/error_exception_handler.dart';
import '../../../../common/services/api_services/api_service.dart';

abstract interface class AdminDashboardRemoteDataSource {
  Future<Map<String, dynamic>> getAdminDashboardRoles();
}

class AdminDashboardRemoteDataSourceImpl
    extends AdminDashboardRemoteDataSource {
  final ApiService apiService;

  AdminDashboardRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Map<String, dynamic>> getAdminDashboardRoles() {
    return errorExceptionHandler(() async {
      final response = await apiService
          .getReq(AuthApiEndpointConstants.getAdminDashboardRoles);
      return response;
    });
  }
}
