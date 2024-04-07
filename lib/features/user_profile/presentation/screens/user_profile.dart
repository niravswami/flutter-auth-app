import 'package:flutter/material.dart';

import '../../../../common/routes/routes_constants.dart';
import '../../../../common/utils/helpers/routing_helper_fn.dart';
import '../../../../common/utils/logout_method/logout_method.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
