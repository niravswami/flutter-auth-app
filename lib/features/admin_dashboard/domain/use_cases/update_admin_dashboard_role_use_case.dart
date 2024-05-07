// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin_dashboard_app/common/errors/failure.dart';

import 'package:fpdart/src/either.dart';

import '../../../../common/use_case/use_case.dart';
import '../../data/models/role_model.dart';
import '../repositories/admin_dashboard_role_repository.dart';

class UpdateAdminDashboardRoleUseCase
    implements UseCase<RoleModel, UpdateAdminDashboardRoleParams> {
  final AdminDashboardRoleRepository adminDashboardRoleRepository;

  UpdateAdminDashboardRoleUseCase({
    required this.adminDashboardRoleRepository,
  });

  @override
  Future<Either<Failure, RoleModel>> call(
    UpdateAdminDashboardRoleParams params,
  ) async {
    return await adminDashboardRoleRepository.updateAdminDashboardRole(
      roleData: params.roleData,
      newRoleName: params.newRoleName,
    );
  }
}

class UpdateAdminDashboardRoleParams {
  final RoleModel roleData;
  final String newRoleName;
  UpdateAdminDashboardRoleParams({
    required this.roleData,
    required this.newRoleName,
  });
}
