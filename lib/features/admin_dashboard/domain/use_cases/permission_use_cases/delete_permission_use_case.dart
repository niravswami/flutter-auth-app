import 'package:fpdart/fpdart.dart';

import '../../../../../common/errors/failure.dart';
import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/permission_model.dart';
import '../../repositories/permissions_admin_dashboard_repository.dart';

class DeletePermissionUseCase
    implements UseCase<PermissionModel, DeletePermissionUseCaseParams> {
  final PermissionsAdminDashboardRepository permissionsAdminDashboardRepository;

  const DeletePermissionUseCase({
    required this.permissionsAdminDashboardRepository,
  });

  @override
  Future<Either<Failure, PermissionModel>> call(
      DeletePermissionUseCaseParams params) async {
    return await permissionsAdminDashboardRepository
        .deletePermissionAdminDashboard(permissionData: params.permissionData);
  }
}

class DeletePermissionUseCaseParams {
  final PermissionModel permissionData;
  DeletePermissionUseCaseParams({
    required this.permissionData,
  });
}
