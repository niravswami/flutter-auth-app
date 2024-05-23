import 'package:flutter/material.dart';

import '../routes/routes_constants.dart';

List<Map<String, dynamic>> mainBottomTabs(BuildContext context) {
  return [
    {
      'hasPermission': true,
      'selectedIcon': const Icon(
        Icons.home,
      ),
      'routeName': AppPage.home.toName,
      'icon': const Icon(Icons.home_outlined),
      'label': 'Home',
    },
    {
      'hasPermission': true,
      'selectedIcon': const Icon(
        Icons.person,
      ),
      'routeName': AppPage.profile.toName,
      'icon': const Icon(Icons.person_outline),
      'label': 'Profile',
    },
  ];
}
