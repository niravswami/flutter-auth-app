import 'package:fpdart/fpdart.dart';

import '../../../../common/errors/failure.dart';
import '../../../../common/use_case/use_case.dart';
import '../../data/models/role_model.dart';
import '../repositories/admin_dashboard_role_repository.dart';

class CreateAdminDashboardRoleUseCase
    implements UseCase<RoleModel, CreateAdminDashboardRoleParams> {
  final AdminDashboardRoleRepository adminDashboardRoleRepository;

  CreateAdminDashboardRoleUseCase({required this.adminDashboardRoleRepository});

  @override
  Future<Either<Failure, RoleModel>> call(params) async {
    return adminDashboardRoleRepository.createAdminDashboardRole(
        role: params.role);
  }
}

class CreateAdminDashboardRoleParams {
  final String role;

  CreateAdminDashboardRoleParams({
    required this.role,
  });
}
