// Builds the "shell" for the app by building a Scaffold with a
import 'package:admin_dashboard_app/common/routes/routes_constants.dart';
import 'package:admin_dashboard_app/common/utils/helpers/routing_helper_fn.dart';
import 'package:admin_dashboard_app/common/utils/main_bottom_tabs_options.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';

import '../../constants/permissions_constants.dart';
import '../../utils/has_role_permission/has_role_permission.dart';

/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  ScaffoldWithNavBar({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  /// The children (branch Navigators) to display in a custom container
  /// ([AnimatedBranchContainer]).
  final List<Widget> children;
  late List<Map<String, dynamic>> pages;
  late List<Map<String, dynamic>> myMainBottomTabs;

  @override
  Widget build(BuildContext context) {
    myMainBottomTabs = mainBottomTabs(context);
    pages = myMainBottomTabs
        // [
        //   {
        //     'hasPermission': true,
        //     'selectedIcon': const Icon(
        //       Icons.home,
        //       // color: Colors.white,
        //     ),
        //     'routeName': AppPage.home.toName,
        //     'icon': const Icon(Icons.home_outlined),
        //     'label': 'Home',
        //   },
        //   {
        //     'hasPermission': canAccess(context: context, permissions: [
        //       PermissionsConstants.readAdminDashboard,
        //     ]),
        //     'selectedIcon': const Icon(
        //       Icons.dashboard,
        //       // color: Colors.white,
        //     ),
        //     'routeName': AppPage.adminDashboard.toName,
        //     'icon': const Icon(Icons.dashboard_outlined),
        //     'label': 'Admin Dashboard',
        //   },
        //   {
        //     'hasPermission': true,
        //     'selectedIcon': const Icon(
        //       Icons.person,
        //       // color: Colors.white,
        //     ),
        //     'routeName': AppPage.profile.toName,
        //     'icon': const Icon(Icons.person_outline),
        //     'label': 'Profile',
        //   },
        // ]
        .where(
          (Map<String, dynamic> item) => item['hasPermission'],
        )
        .toList();

    final List<BottomNavigationBarItem> navigationDestinations =
        pages.map((pageObj) {
      return BottomNavigationBarItem(
          activeIcon: pageObj['selectedIcon'],
          icon: pageObj['icon'],
          label: pageObj['label']);
    }).toList();
    return Scaffold(
      // body: navigationShell,
      body: AnimatedBranchContainer(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Here, the items of BottomNavigationBar are hard coded. In a real
        // world scenario, the items would most likely be generated from the
        // branches of the shell route, which can be fetched using
        // `navigationShell.route.branches`.
        items: navigationDestinations,

        currentIndex: navigationShell.currentIndex.clamp(
            0,
            navigationDestinations.length -
                1), // Ensure selectedIndex stays within the range
        onTap: (int index) => _onTap(context, index),
      ),
      // -----
      // bottomNavigationBar: BottomNavigationBar(
      //   // Here, the items of BottomNavigationBar are hard coded. In a real
      //   // world scenario, the items would most likely be generated from the
      //   // branches of the shell route, which can be fetched using
      //   // `navigationShell.route.branches`.
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.work), label: 'Admin Dashboard'),
      //     BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'Profile'),
      //   ],
      //   currentIndex: navigationShell.currentIndex,
      //   onTap: (int index) => _onTap(context, index),
      // ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // print(pages[index]);
    final page = pages[index];
    int trueIndex = myMainBottomTabs
        .indexWhere((element) => element['routeName'] == page['routeName']);

    navigationShell.goBranch(
      trueIndex,
      initialLocation: trueIndex == navigationShell.currentIndex,
    );
  }
}

/// Custom branch Navigator container that provides animated transitions
/// when switching branches.
class AnimatedBranchContainer extends StatelessWidget {
  /// Creates a AnimatedBranchContainer
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  /// The index (in [children]) of the branch Navigator to display.
  final int currentIndex;

  /// The children (branch Navigators) to display in this container.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: children.mapIndexed(
      (int index, Widget navigator) {
        return AnimatedSlide(
          offset: const Offset(0, 0),
          duration: const Duration(milliseconds: 100),
          child: AnimatedOpacity(
            opacity: index == currentIndex ? 1 : 0,
            duration: const Duration(milliseconds: 100),
            child: _branchNavigatorWrapper(index, navigator),
          ),
        );
      },
    ).toList());
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
}
