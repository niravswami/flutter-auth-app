import 'package:fpdart/fpdart.dart';

import '../../../../../common/errors/failure.dart';
import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/permission_model.dart';
import '../../repositories/permissions_admin_dashboard_repository.dart';

class GetAdminDashboardPermissionsUseCase
    implements UseCase<List<PermissionModel>, NoParams> {
  final PermissionsAdminDashboardRepository permissionsAdminDashboardRepository;

  GetAdminDashboardPermissionsUseCase({
    required this.permissionsAdminDashboardRepository,
  });

  @override
  Future<Either<Failure, List<PermissionModel>>> call(NoParams params) async {
    return await permissionsAdminDashboardRepository
        .getAdminDashboardPermissions();
  }
}
