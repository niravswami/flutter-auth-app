import 'package:admin_dashboard_app/common/constants/permissions_constants.dart';
import 'package:admin_dashboard_app/common/utils/has_role_permission/has_role_permission.dart';
import 'package:flutter/material.dart';

import '../../../features/admin_dashboard/presentation/screens/admin_dashboard.dart';
import '../../../features/home/presentation/screens/home_screen/home_screen.dart';
import '../../../features/user_profile/presentation/screens/user_profile.dart';
import '../../components/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class EntryPointScreen extends StatefulWidget {
  const EntryPointScreen({super.key});

  @override
  State<EntryPointScreen> createState() => _EntryPointScreenState();
}

class _EntryPointScreenState extends State<EntryPointScreen> {
  int currentPageIndex = 0;
  late Widget currentPage;
  late List<Map<String, dynamic>> pages = [];

  @override
  void initState() {
    currentPage = const HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    pages = [
      {
        'screen': const HomeScreen(),
        'hasPermission': true,
        'selectedIcon': const Icon(
          Icons.home,
          color: Colors.white,
        ),
        'icon': const Icon(Icons.home_outlined),
        'label': 'Home',
      },
      {
        'screen': const AdminDashboardScreen(),
        'hasPermission': canAccess(context: context, permissions: [
          PermissionsConstants.readAdminDashboard,
        ]),
        'selectedIcon': const Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
        'icon': const Icon(Icons.dashboard_outlined),
        'label': 'Admin Dashboard',
      },
      {
        'screen': const UserProfileScreen(),
        'hasPermission': true,
        'selectedIcon': const Icon(
          Icons.person,
          color: Colors.white,
        ),
        'icon': const Icon(Icons.person_outline),
        'label': 'Profile',
      },
    ]
        .where(
          (Map<String, dynamic> item) => item['hasPermission'],
        )
        .toList();

    final navigationDestinations = pages.map((pageObj) {
      return NavigationDestination(
          selectedIcon: pageObj['selectedIcon'],
          icon: pageObj['icon'],
          label: pageObj['label']);
    }).toList();

    return Scaffold(
      // bottomNavigationBar: NavigationBar(
      //   onDestinationSelected: (index) {
      //     setState(() {
      //       currentPageIndex = index;
      //       currentPage = pages[index]['screen'];
      //     });
      //   },
      //   selectedIndex: currentPageIndex.clamp(
      //       0,
      //       navigationDestinations.length -
      //           1), // Ensure selectedIndex stays within the range
      //   indicatorColor: colorScheme.primary,
      //   destinations: navigationDestinations,
      // ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: currentPage,
    );
  }
}
