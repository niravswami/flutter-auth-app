import 'package:fpdart/fpdart.dart';

import '../../../../common/errors/failure.dart';
import '../../data/models/permission_model.dart';

abstract interface class PermissionsAdminDashboardRepository {
  Future<Either<Failure, List<PermissionModel>>> getAdminDashboardPermissions();
  Future<Either<Failure, PermissionModel>> createPermissionAdminDashboard({
    required String permission,
  });
  Future<Either<Failure, PermissionModel>> deletePermissionAdminDashboard({
    required PermissionModel permissionData,
  });
  Future<Either<Failure, PermissionModel>> updatePermissionAdminDashboard({
    required PermissionModel permissionData,
    required String text,
  });
}
