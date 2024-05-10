import 'package:fpdart/fpdart.dart';

import '../../../../../common/errors/failure.dart';
import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/role_model.dart';
import '../../repositories/admin_dashboard_role_repository.dart';

class DeleteAdminDashboardRoleUseCase
    implements UseCase<RoleModel, DeleteAdminDashboardRoleParams> {
  final AdminDashboardRoleRepository adminDashboardRoleRepository;

  DeleteAdminDashboardRoleUseCase({
    required this.adminDashboardRoleRepository,
  });

  @override
  Future<Either<Failure, RoleModel>> call(
      DeleteAdminDashboardRoleParams params) async {
    return await adminDashboardRoleRepository.deleteAdminDashboardRole(
      roleData: params.roleData,
    );
  }
}

class DeleteAdminDashboardRoleParams {
  final RoleModel roleData;
  DeleteAdminDashboardRoleParams({
    required this.roleData,
  });
}
