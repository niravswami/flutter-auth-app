import 'package:fpdart/fpdart.dart';

import '../../../../../common/errors/failure.dart';
import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/role_model.dart';
import '../../repositories/admin_dashboard_role_repository.dart';

class GetAdminDashboardAllRolesUseCase
    implements UseCase<List<RoleModel>, NoParams> {
  final AdminDashboardRoleRepository adminDashboardRoleRepository;

  GetAdminDashboardAllRolesUseCase(
      {required this.adminDashboardRoleRepository});

  @override
  Future<Either<Failure, List<RoleModel>>> call(params) async {
    return adminDashboardRoleRepository.getAdminDashboardAllRoles();
  }
}
