import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../config/theme/cubit/app_theme_mode_cubit.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

List<BlocProvider> blocProviders(GetIt serviceLocator) {
  return [
    BlocProvider<AuthBloc>(
      create: (_) => serviceLocator<AuthBloc>(),
    ),
    BlocProvider<AppThemeModeCubit>(
      create: (_) => serviceLocator<AppThemeModeCubit>(),
    ),
  ];
}
