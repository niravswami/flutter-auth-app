import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../constants/roles_constants.dart';

bool canAccess({
  required BuildContext context,
  List<String> permissions = const [],
  List<String> roles = const [],
}) {
  final authState = context.watch<AuthBloc>().state;
  if (authState is AuthUserLoggedIn) {
    if (authState.user.roles == null || authState.user.permissions == null) {
      return false;
    }

    if (authState.user.roles!.contains(RolesConstants.superAdmin)) return true;
    // Check if user roles contain any of the roles specified
    bool hasRole =
        roles.any((role) => authState.user.roles?.contains(role) ?? false);

    // Check if user permissions contain any of the permissions specified
    bool hasPermission = permissions.any((permission) =>
        authState.user.permissions?.contains(permission) ?? false);

    // Return true if the user has any of the specified roles or permissions
    return hasRole || hasPermission;
  } else {
    return false;
  }
}

bool hasRole({
  required BuildContext context,
  List<String> roles = const [],
}) {
  final authState = context.watch<AuthBloc>().state as AuthUserLoggedIn;

  if (authState.user.roles!.contains(RolesConstants.superAdmin)) return true;
  // Check if user roles contain any of the roles specified
  bool hasRole =
      roles.any((role) => authState.user.roles?.contains(role) ?? false);

  return hasRole;
}

bool hasPermission({
  required BuildContext context,
  List<String> permissions = const [],
}) {
  final authState = context.watch<AuthBloc>().state as AuthUserLoggedIn;

  if (authState.user.roles!.contains(RolesConstants.superAdmin)) return true;
  // Check if user permissions contain any of the permissions specified
  bool hasPermission = permissions.any((permission) =>
      authState.user.permissions?.contains(permission) ?? false);

  return hasPermission;
}
