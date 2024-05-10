import 'package:fpdart/fpdart.dart';

import '../../../../common/errors/error_exception_handler.dart';
import '../../../../common/errors/failure.dart';
import '../../domain/repositories/admin_dashboard_role_repository.dart';
import '../data_source/admin_dashboard_remote_data_source.dart';
import '../models/role_model.dart';

class AdminDashboardRoleRepositoryImpl implements AdminDashboardRoleRepository {
  final AdminDashboardRemoteDataSource adminDashboardRemoteDataSource;
  AdminDashboardRoleRepositoryImpl({
    required this.adminDashboardRemoteDataSource,
  });

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

  @override
  Future<Either<Failure, RoleModel>> createAdminDashboardRole({
    required String role,
  }) {
    return eitherErrorExceptionHandler(
      () async {
        final data = await adminDashboardRemoteDataSource
            .createAdminDashboardRoleReq(role: role);

        final RoleModel roleModel = RoleModel.fromJson(data['role']);
        return right(roleModel);
      },
    );
  }

  @override
  Future<Either<Failure, RoleModel>> updateAdminDashboardRole({
    required RoleModel roleData,
    required String newRoleName,
  }) {
    return eitherErrorExceptionHandler(
      () async {
        final data =
            await adminDashboardRemoteDataSource.updateAdminDashboardRoleReq(
          roleData: roleData,
          newRoleName: newRoleName,
        );

        final RoleModel roleModel = RoleModel.fromJson(data['role']);
        return right(roleModel);
      },
    );
  }

  @override
  Future<Either<Failure, RoleModel>> deleteAdminDashboardRole(
      {required RoleModel roleData}) {
    return eitherErrorExceptionHandler(() async {
      await adminDashboardRemoteDataSource.deleteAdminDashboardRoleReq(
          roleData: roleData);
      return right(roleData);
    });
  }

  @override
  Future<Either<Failure, RoleModel>> assignPermissionsToRole({
    required RoleModel roleData,
    required List<int> permissionIds,
  }) {
    return eitherErrorExceptionHandler(() async {
      final data =
          await adminDashboardRemoteDataSource.assignPermissionsToRoleReq(
        roleData: roleData,
        permissionIds: permissionIds,
      );

      final RoleModel roleModel = RoleModel.fromJson(data['role']);
      return right(roleModel);
    });
  }
}
