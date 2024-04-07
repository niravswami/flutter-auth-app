import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../errors/error_dialog.dart';
import '../../routes/routes_constants.dart';
import '../helpers/routing_helper_fn.dart';
import '../loader_overlay.dart';

logoutMethod(BuildContext context) async {
  final authBloc = BlocProvider.of<AuthBloc>(context);

  // Variable to track whether logout process is complete
  bool isLogoutComplete = false;

  // Listener function to handle state changes emitted by AuthBloc
  void listener(AuthState state) {
    if (state is AuthLogoutProcessing) {
      // Handle logout processing state
      // For example, show a loading indicator
      showLoaderOverlay(context);
    } else if (state is AuthInitial) {
      // Handle logged out state
      // For example, navigate to login screen
      RoutingHelperFn.replaceToName(context, AppPage.login.toName);
      isLogoutComplete = true;
    } else if (state is AuthLogoutErrors) {
      // Handle logout errors
      // For example, display an error message
      RoutingHelperFn.popScreen(context);
      showErrorDialog(context, 'Logout failed: ${state.message}');
      isLogoutComplete = true;
    }
  }

  // Add listener to AuthBloc
  final StreamSubscription<AuthState> subscription =
      authBloc.stream.listen(listener);

  // Dispatch the logout event to the AuthBloc
  authBloc.add(AuthUserLogout());

  // Wait until logout process is complete
  while (!isLogoutComplete) {
    await Future.delayed(const Duration(seconds: 10));
  }

  // Cancel the subscription to avoid memory leaks
  subscription.cancel();
}
