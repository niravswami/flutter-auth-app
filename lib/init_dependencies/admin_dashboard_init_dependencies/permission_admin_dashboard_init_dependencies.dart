import 'package:get_it/get_it.dart';

import '../../features/admin_dashboard/data/data_source/remote_data_sources/permission_remote_data_source.dart';
import '../../features/admin_dashboard/data/impl_of_repository/permission_admin_dashboard_repository_impl.dart';
import '../../features/admin_dashboard/domain/repositories/permissions_admin_dashboard_repository.dart';
import '../../features/admin_dashboard/domain/use_cases/permission_use_cases/create_permission_use_case.dart';
import '../../features/admin_dashboard/domain/use_cases/permission_use_cases/delete_permission_use_case.dart';
import '../../features/admin_dashboard/domain/use_cases/permission_use_cases/get_permissions_use_case.dart';
import '../../features/admin_dashboard/domain/use_cases/permission_use_cases/update_permission_use_case.dart';
import '../../features/admin_dashboard/presentation/bloc/admin_dashboard_permissions_bloc/admin_dashboard_permissions_bloc.dart';

class PermissionAdminDashboardInitDependencies {
  final GetIt serviceLocator;

  PermissionAdminDashboardInitDependencies({
    required this.serviceLocator,
  });
  void register() {
    serviceLocator
      ..registerFactory<PermissionsAdminDashboardRemoteDataSource>(
        () => PermissionsAdminDashboardRemoteDataSourceImpl(
          apiService: serviceLocator(),
        ),
      )
      ..registerFactory<PermissionsAdminDashboardRepository>(
        () => PermissionsAdminDashboardRepositoryImpl(
          permissionsAdminDashboardRemoteDataSource: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => GetAdminDashboardPermissionsUseCase(
          permissionsAdminDashboardRepository: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => CreatePermissionUseCase(
          permissionsAdminDashboardRepository: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => UpdatePermissionUseCase(
          permissionsAdminDashboardRepository: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => DeletePermissionUseCase(
          permissionsAdminDashboardRepository: serviceLocator(),
        ),
      )
      ..registerLazySingleton(
        () => AdminDashboardPermissionsBloc(
          getAdminDashboardPermissionsUseCase: serviceLocator(),
          createPermissionUseCase: serviceLocator(),
          updatePermissionUseCase: serviceLocator(),
          deletePermissionUseCase: serviceLocator(),
        ),
      );
  }
}
