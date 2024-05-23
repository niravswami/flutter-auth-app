import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/main_bottom_tabs_options.dart';
import '../bottom_navbar/main_bottom_navbar.dart';

class MainBottomNavTabsWithScaffold extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainBottomNavTabsWithScaffold({
    required this.navigationShell,
    super.key,
  });

  @override
  State<MainBottomNavTabsWithScaffold> createState() =>
      _MainBottomNavTabsWithScaffoldState();
}

class _MainBottomNavTabsWithScaffoldState
    extends State<MainBottomNavTabsWithScaffold> {
  late List<Map<String, dynamic>> bottomNav;
  late List<Map<String, dynamic>> myMainBottomTabs;

  @override
  void initState() {
    super.initState();
    myMainBottomTabs = mainBottomTabs(context);
    bottomNav =
        myMainBottomTabs.where((item) => item['hasPermission']).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> navigationDestinations =
        bottomNav.map((pageObj) {
      return BottomNavigationBarItem(
        activeIcon: pageObj['selectedIcon'],
        icon: pageObj['icon'],
        label: pageObj['label'],
      );
    }).toList();

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: MainBottomNavbar(
        navigationShell: widget.navigationShell,
        navigationDestinations: navigationDestinations,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    if (index >= 0 && index < bottomNav.length) {
      final page = bottomNav[index];
      int trueIndex = myMainBottomTabs
          .indexWhere((element) => element['routeName'] == page['routeName']);

      widget.navigationShell.goBranch(
        trueIndex,
        initialLocation: trueIndex == widget.navigationShell.currentIndex,
      );
    }
  }
}
