import 'package:admin_dashboard_app/common/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/permission_model.dart';
import '../../repositories/permissions_admin_dashboard_repository.dart';

class CreatePermissionUseCase
    implements UseCase<PermissionModel, CreatePermissionUseCaseParams> {
  final PermissionsAdminDashboardRepository permissionsAdminDashboardRepository;

  CreatePermissionUseCase({
    required this.permissionsAdminDashboardRepository,
  });

  @override
  Future<Either<Failure, PermissionModel>> call(
      CreatePermissionUseCaseParams params) async {
    return await permissionsAdminDashboardRepository
        .createPermissionAdminDashboard(permission: params.permission);
  }
}

class CreatePermissionUseCaseParams {
  final String permission;

  CreatePermissionUseCaseParams({
    required this.permission,
  });
}
