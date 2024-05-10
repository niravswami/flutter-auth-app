import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/admin_dashboard/presentation/bloc/admin_dashboard_permissions_bloc/admin_dashboard_permissions_bloc.dart';
import '../../features/admin_dashboard/presentation/bloc/admin_dashboard_roles_bloc/admin_dashboard_roles_bloc.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../routes/cubit/bottom_nav_cubit/bottom_nav_cubit.dart';

List<BlocProvider> blocProviders(GetIt serviceLocator) {
  return [
    BlocProvider<AuthBloc>(
      create: (_) => serviceLocator<AuthBloc>(),
    ),
    BlocProvider<BottomNavCubit>(
      create: (_) => serviceLocator<BottomNavCubit>(),
    ),
    BlocProvider<AdminDashboardRolesBloc>(
      create: (_) => serviceLocator<AdminDashboardRolesBloc>(),
    ),
    BlocProvider<AdminDashboardPermissionsBloc>(
      create: (_) => serviceLocator<AdminDashboardPermissionsBloc>(),
    ),
  ];
}
