import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/routes_imports.dart';
import 'common/utils/bloc_providers.dart';
import 'config/theme/themeData/app_outlined_button_theme_data.dart';
import 'init_dependencies/init_dependencies_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: blocProviders(serviceLocator),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter(serviceLocator: serviceLocator);
    return ScreenUtilInit(
      designSize: const Size(390.0, 844.0),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // theme: const AppTheme().themeDataLight,
          // darkTheme: const AppTheme().themeDataDark,
          // themeMode: ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.pink[400]!,
              onPrimary: Colors.white,
              secondary: Colors.teal[500]!,
              onSecondary: Colors.black87,
              error: Colors.red[700]!,
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.black54,
              surface: Colors.grey.shade100,
              onSurface: Colors.black87,
            ),
            appBarTheme: const AppBarTheme(centerTitle: false),
            outlinedButtonTheme:
                AppOutlinedButtonThemeData.outlineButtonThemeData,
            cardTheme: CardTheme(
              surfaceTintColor: Theme.of(context).colorScheme.background,
            ),
            popupMenuTheme: PopupMenuThemeData(
              surfaceTintColor: Theme.of(context).colorScheme.background,
            ),
            expansionTileTheme: const ExpansionTileThemeData(
              shape: Border(),
            ),
          ),
          routerConfig: appRouter.router,
        );
      },
    );
  }
}
