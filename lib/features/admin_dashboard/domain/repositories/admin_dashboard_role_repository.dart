import 'package:fpdart/fpdart.dart';

import '../../../../common/errors/failure.dart';
import '../../data/models/role_model.dart';

abstract interface class AdminDashboardRoleRepository {
  Future<Either<Failure, List<RoleModel>>> getAdminDashboardAllRoles();
}
