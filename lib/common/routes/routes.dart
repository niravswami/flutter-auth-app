part of 'routes_imports.dart';

class AppRouter {
  GoRouter get router => _goRouter;
  final GetIt serviceLocator;

  AppRouter({required this.serviceLocator}) {
    final GlobalKey<NavigatorState> rootNavigatorKey =
        serviceLocator.get<GlobalKey<NavigatorState>>(
            instanceName:
                NavigatorKeyDependenciesRegisterInstanceName.rootNavigator);

    _goRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: AppPage.splash.toPath,
      routes: <RouteBase>[
        ...UnauthenticatedAppRoutes().routes,
        MainShellRoute.route,
      ],
      redirect: goRouterRedirect,
      errorBuilder: (context, state) =>
          ErrorScreen(error: state.error.toString()),
    );
  }

  late final GoRouter _goRouter;
}
