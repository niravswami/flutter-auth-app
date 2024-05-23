import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import 'routes_constants.dart';

FutureOr<String?> goRouterRedirect(BuildContext context, GoRouterState state) {
  var authStatus = context.read<AuthBloc>().state;
  final loginLocation = state.namedLocation(AppPage.login.toName);
  final homeLocation = state.namedLocation(AppPage.home.toName);
  final emailVerificationLocation =
      state.namedLocation(AppPage.emailVerification.toName);
  // user is not logged in and route is protected on then redirect to login
  if (authStatus is AuthInitial &&
      !RouteConstants.unauthenticatedFullRouteList.contains(state.fullPath)) {
    return loginLocation;
  }
  // user is logged in,
  if (authStatus is AuthUserLoggedIn) {
    //redirect user to email verification required info screen if not verified user
    if (authStatus.user.emailVerifiedAt == null) {
      return emailVerificationLocation;
    }

    //redirect user to home if it tries to unauthenticated routes
    if (RouteConstants.unauthenticatedFullRouteList.concat(
        [AppPage.emailVerification.toFullPath]).contains(state.fullPath)) {
      return homeLocation;
    }
  }
  return null;
}
