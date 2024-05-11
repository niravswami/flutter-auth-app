import 'package:flutter/material.dart';

import '../../../../common/utils/logout_method/logout_method.dart';

class UserProfileSettingsScreen extends StatelessWidget {
  const UserProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("User Profile Settings"),
            OutlinedButton(
              onPressed: () {
                logoutMethod(context);
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
