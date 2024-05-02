// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/main_bottom_tabs_options.dart';
import '../bottom_navbar/main_bottom_navbar.dart';

class MainBottomNavTabsWithScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  late List<Map<String, dynamic>> bottomNav;
  late List<Map<String, dynamic>> myMainBottomTabs;

  MainBottomNavTabsWithScaffold({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithMainNavBar'));

  @override
  Widget build(BuildContext context) {
    myMainBottomTabs = mainBottomTabs(context);
    bottomNav = myMainBottomTabs
        .where(
          (Map<String, dynamic> item) => item['hasPermission'],
        )
        .toList();

    final List<BottomNavigationBarItem> navigationDestinations =
        bottomNav.map((pageObj) {
      return BottomNavigationBarItem(
          activeIcon: pageObj['selectedIcon'],
          icon: pageObj['icon'],
          label: pageObj['label']);
    }).toList();

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: MainBottomNavbar(
        navigationShell: navigationShell,
        navigationDestinations: navigationDestinations,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    final page = bottomNav[index];
    int trueIndex = myMainBottomTabs
        .indexWhere((element) => element['routeName'] == page['routeName']);

    navigationShell.goBranch(
      trueIndex,
      initialLocation: trueIndex == navigationShell.currentIndex,
    );
  }
}
