import 'package:get_it/get_it.dart';

import '../features/auth/data/data_source/auth_remote_data_source.dart';
import '../features/auth/data/impl_of_repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/use_cases/get_user_detail_use_case.dart';
import '../features/auth/domain/use_cases/login_use_case.dart';
import '../features/auth/domain/use_cases/logout_use_case.dart';
import '../features/auth/domain/use_cases/sign_up_use_case.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

class AuthDependenciesRegister {
  final GetIt serviceLocator;

  AuthDependenciesRegister({
    required this.serviceLocator,
  });

  void register() {
    serviceLocator
      ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(
          apiService: serviceLocator(),
        ),
      )
      ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(
          authRemoteDataSource: serviceLocator(),
          sharedPreferences: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => LoginUseCase(
          serviceLocator(),
        ),
      )
      ..registerFactory(
        () => SignUpUseCase(
          authRepository: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => GetUserDetailUseCase(
          authRepository: serviceLocator(),
        ),
      )
      ..registerFactory(
        () => LogoutUseCase(
          authRepository: serviceLocator(),
        ),
      )
      ..registerLazySingleton(
        () => AuthBloc(
          loginUseCase: serviceLocator(),
          signUpUseCase: serviceLocator(),
          getUserDetailUseCase: serviceLocator(),
          logoutUseCase: serviceLocator(),
        ),
      );
  }
}
