part of 'init_dependencies_imports.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Register rootNavigator and shellNavigator with GetIt
  NavigatorKeyDependenciesRegister(serviceLocator: serviceLocator).register();

  await RegisterSharedPref(serviceLocator: serviceLocator).registerSharedPref();

  serviceLocator.registerLazySingleton(() => BottomNavCubit());
  _registerApiService();

  AuthDependenciesRegister(serviceLocator: serviceLocator).register();
}

void _registerApiService() async {
  final apiService = ApiService();
  serviceLocator.registerLazySingleton<ApiService>(() => apiService);
}
