part of 'init_dependencies_imports.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await RegisterSharedPref(serviceLocator: serviceLocator).registerSharedPref();

  _registerApiService();

  AuthDependenciesRegister(serviceLocator: serviceLocator).register();
}

void _registerApiService() async {
  final apiService = ApiService();
  serviceLocator.registerLazySingleton<ApiService>(() => apiService);
}
