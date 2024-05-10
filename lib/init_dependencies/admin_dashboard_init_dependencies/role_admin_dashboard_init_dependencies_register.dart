import 'package:get_it/get_it.dart';

import '../../features/admin_dashboard/data/data_source/admin_dashboard_remote_data_source.dart';
import '../../features/admin_dashboard/data/impl_of_repository/admin_dashboard_role_repository_impl.dart';
import '../../features/admin_dashboard/domain/repositories/admin_dashboard_role_repository.dart';
import '../../features/admin_dashboard/domain/use_cases/role_use_cases/assign_permissions_to_role_use_case.dart';
import '../../features/admin_dashboard/domain/use_cases/role_use_cases/create_admin_dashboard_role_use_case.dart';
import '../../features/admin_dashboard/domain/use_cases/role_use_cases/delete_admin_dashboard_role_use_case.dart';
import '../../features/admin_dashboard/domain/use_cases/role_use_cases/get_admin_dashboard_all_roles_use_case.dart';
import '../../features/admin_dashboard/domain/use_cases/role_use_cases/update_admin_dashboard_role_use_case.dart';
import '../../features/admin_dashboard/presentation/bloc/admin_dashboard_roles_bloc/admin_dashboard_roles_bloc.dart';

class RoleAdminDashboardInitDependenciesRegister {
  final GetIt serviceLocator;

  RoleAdminDashboardInitDependenciesRegister({
    required this.serviceLocator,
  });

  void register() {
    serviceLocator
      ..registerFactory<AdminDashboardRemoteDataSource>(
        () => AdminDashboardRemoteDataSourceImpl(
          apiService: serviceLocator(),
        ),
      )
      ..registerFactory<AdminDashboardRoleRepository>(
        () => AdminDashboardRoleRepositoryImpl(
          adminDashboardRemoteDataSource: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => GetAdminDashboardAllRolesUseCase(
          adminDashboardRoleRepository: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => CreateAdminDashboardRoleUseCase(
          adminDashboardRoleRepository: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => UpdateAdminDashboardRoleUseCase(
          adminDashboardRoleRepository: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => DeleteAdminDashboardRoleUseCase(
          adminDashboardRoleRepository: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => AssignPermissionsToRoleUseCase(
          adminDashboardRoleRepository: serviceLocator(),
        ),
      )
      ..registerLazySingleton(
        () => AdminDashboardRolesBloc(
          getAdminDashboardAllRolesUseCase: serviceLocator(),
          createAdminDashboardRoleUseCase: serviceLocator(),
          updateAdminDashboardRoleUseCase: serviceLocator(),
          deleteAdminDashboardRoleUseCase: serviceLocator(),
          assignPermissionsToRoleUseCase: serviceLocator(),
        ),
      );
  }
}
