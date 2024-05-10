import 'package:fpdart/fpdart.dart';

import '../../../../../common/errors/failure.dart';
import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/permission_model.dart';
import '../../repositories/permissions_admin_dashboard_repository.dart';

class UpdatePermissionUseCase
    implements UseCase<PermissionModel, UpdatePermissionUseCaseParams> {
  final PermissionsAdminDashboardRepository permissionsAdminDashboardRepository;

  UpdatePermissionUseCase({
    required this.permissionsAdminDashboardRepository,
  });

  @override
  Future<Either<Failure, PermissionModel>> call(
      UpdatePermissionUseCaseParams params) async {
    return await permissionsAdminDashboardRepository
        .updatePermissionAdminDashboard(
      permissionData: params.permissionData,
      text: params.text,
    );
  }
}

class UpdatePermissionUseCaseParams {
  final PermissionModel permissionData;
  final String text;

  UpdatePermissionUseCaseParams({
    required this.permissionData,
    required this.text,
  });
}
