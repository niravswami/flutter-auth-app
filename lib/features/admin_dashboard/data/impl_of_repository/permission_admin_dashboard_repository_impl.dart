import 'package:fpdart/fpdart.dart';

import '../../../../common/errors/error_exception_handler.dart';
import '../../../../common/errors/failure.dart';
import '../../domain/repositories/permissions_admin_dashboard_repository.dart';
import '../data_source/remote_data_sources/permission_remote_data_source.dart';
import '../models/permission_model.dart';

class PermissionsAdminDashboardRepositoryImpl
    implements PermissionsAdminDashboardRepository {
  final PermissionsAdminDashboardRemoteDataSource
      permissionsAdminDashboardRemoteDataSource;

  PermissionsAdminDashboardRepositoryImpl({
    required this.permissionsAdminDashboardRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<PermissionModel>>>
      getAdminDashboardPermissions() {
    return eitherErrorExceptionHandler(
      () async {
        final data = await permissionsAdminDashboardRemoteDataSource
            .getAdminDashboardPermissionsReq();

        final List<PermissionModel> permissions = [];
        for (var permission in data['permissions']) {
          permissions.add(PermissionModel.fromJson(permission));
        }
        return right(permissions);
      },
    );
  }

  @override
  Future<Either<Failure, PermissionModel>> createPermissionAdminDashboard({
    required String permission,
  }) {
    return eitherErrorExceptionHandler(
      () async {
        final data = await permissionsAdminDashboardRemoteDataSource
            .createPermissionAdminDashboardReq(permission: permission);
        final PermissionModel permissionModel =
            PermissionModel.fromJson(data['permission']);

        return right(permissionModel);
      },
    );
  }

  @override
  Future<Either<Failure, PermissionModel>> deletePermissionAdminDashboard({
    required PermissionModel permissionData,
  }) {
    return eitherErrorExceptionHandler(
      () async {
        await permissionsAdminDashboardRemoteDataSource
            .deletePermissionAdminDashboardReq(permissionData: permissionData);

        return right(permissionData);
      },
    );
  }

  @override
  Future<Either<Failure, PermissionModel>> updatePermissionAdminDashboard({
    required PermissionModel permissionData,
    required String text,
  }) {
    return eitherErrorExceptionHandler(
      () async {
        final data = await permissionsAdminDashboardRemoteDataSource
            .updatePermissionAdminDashboardReq(
          permissionData: permissionData,
          text: text,
        );

        final permission = PermissionModel.fromJson(data["permission"]);

        return right(permission);
      },
    );
  }
}
