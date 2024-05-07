import 'package:fpdart/fpdart.dart';

import '../../../../common/errors/failure.dart';
import '../../data/models/role_model.dart';

abstract interface class AdminDashboardRoleRepository {
  Future<Either<Failure, List<RoleModel>>> getAdminDashboardAllRoles();
  Future<Either<Failure, RoleModel>> createAdminDashboardRole({
    required String role,
  });
  Future<Either<Failure, RoleModel>> updateAdminDashboardRole({
    required RoleModel roleData,
    required String newRoleName,
  });
  Future<Either<Failure, RoleModel>> deleteAdminDashboardRole({
    required RoleModel roleData,
  });
}
