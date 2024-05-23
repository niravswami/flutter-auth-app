import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/scaffold_with_nav_bar/main_bottom_nav_tabs_with_scaffold.dart';
import 'shell_branches/home_branches/home_branches.dart';
import 'shell_branches/profile_branches/profile_branches.dart';

class MainShellRoute {
  static StatefulShellRoute get route => StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return MainBottomNavTabsWithScaffold(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          ...HomeRouteBranches().routes,
          ...ProfileRouteBranches().routes,
        ],
      );
}
