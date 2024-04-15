import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/routes/routes_constants.dart';
import '../../../../common/utils/helpers/routing_helper_fn.dart';
import '../../../../common/utils/logout_method/logout_method.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  static final serviceLocator = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    final authState = serviceLocator<AuthBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              RoutingHelperFn.pushToName(
                  context, AppPage.profileSettings.toName);
            },
            icon: const Icon(Icons.settings_outlined),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("User Profile"),
            if (authState
                is AuthUserLoggedIn) // Check if authState is AuthUserLoggedIn
              Text("User Name: ${authState.user.name}"), // Access user name
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                logoutMethod(context);
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
