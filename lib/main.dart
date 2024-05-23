import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/routes_imports.dart';
import 'common/utils/bloc_providers.dart';
import 'config/theme.dart';
import 'config/theme/cubit/app_theme_mode_cubit.dart';
import 'init_dependencies/init_dependencies_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: blocProviders(serviceLocator),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AppThemeModeCubit>().currentThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter(serviceLocator: serviceLocator);

    return ScreenUtilInit(
      designSize: const Size(390.0, 844.0),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return BlocBuilder<AppThemeModeCubit, AppThemeModeState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Auth App',
              theme: const MaterialTheme(TextTheme()).light(),
              darkTheme: const MaterialTheme(TextTheme()).dark(),
              // theme: const AppTheme().lightTheme,
              // darkTheme: const AppTheme().darkTheme,
              themeMode:
                  (state is AppLightMode) ? ThemeMode.light : ThemeMode.dark,
              routerConfig: appRouter.router,
            );
          },
        );
      },
    );
  }
}
