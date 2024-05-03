import 'package:fpdart/fpdart.dart';

import '../../../../common/errors/error_exception_handler.dart';
import '../../../../common/errors/failure.dart';
import '../../domain/repositories/admin_dashboard_role_repository.dart';
import '../data_source/admin_dashboard_remote_data_source.dart';
import '../models/role_model.dart';

class AdminDashboardRoleRepositoryImpl implements AdminDashboardRoleRepository {
  final AdminDashboardRemoteDataSource adminDashboardRemoteDataSource;
  AdminDashboardRoleRepositoryImpl(
      {required this.adminDashboardRemoteDataSource});

  @override
  Future<Either<Failure, List<RoleModel>>> getAdminDashboardAllRoles() {
    return eitherErrorExceptionHandler(
      () async {
        final data =
            await adminDashboardRemoteDataSource.getAdminDashboardRoles();

        final List<RoleModel> roles = [];
        for (var role in data['roles']) {
          roles.add(RoleModel.fromJson(role));
        }
        return right(roles);
      },
    );
  }
}
