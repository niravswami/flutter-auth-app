import 'package:flutter_auth_app/common/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/role_model.dart';
import '../../repositories/admin_dashboard_role_repository.dart';

class AssignPermissionsToRoleUseCase
    implements UseCase<RoleModel, AssignPermissionsToRoleUseCaseParams> {
  final AdminDashboardRoleRepository adminDashboardRoleRepository;

  AssignPermissionsToRoleUseCase({
    required this.adminDashboardRoleRepository,
  });

  @override
  Future<Either<Failure, RoleModel>> call(
      AssignPermissionsToRoleUseCaseParams params) async {
    return await adminDashboardRoleRepository.assignPermissionsToRole(
      roleData: params.roleData,
      permissionIds: params.permissionIds,
    );
  }
}

class AssignPermissionsToRoleUseCaseParams {
  final RoleModel roleData;
  final List<int> permissionIds;

  AssignPermissionsToRoleUseCaseParams({
    required this.roleData,
    required this.permissionIds,
  });
}
