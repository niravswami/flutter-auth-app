import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NavigatorKeyDependenciesRegister {
  final GetIt serviceLocator;

  NavigatorKeyDependenciesRegister({
    required this.serviceLocator,
  });

  void register() {
    final GlobalKey<NavigatorState> rootNavigator =
        GlobalKey(debugLabel: 'root');
    final GlobalKey<NavigatorState> shellNavigator =
        GlobalKey(debugLabel: 'shell');

    serviceLocator.registerSingleton<GlobalKey<NavigatorState>>(
      rootNavigator,
      instanceName: NavigatorKeyDependenciesRegisterInstanceName.rootNavigator,
    );
    serviceLocator.registerSingleton<GlobalKey<NavigatorState>>(
      shellNavigator,
      instanceName:
          NavigatorKeyDependenciesRegisterInstanceName.entryPointShellNavigator,
    );
  }
}

class NavigatorKeyDependenciesRegisterInstanceName {
  static const rootNavigator = 'rootNavigator';
  static const entryPointShellNavigator = 'entryPointShellNavigator';
}
