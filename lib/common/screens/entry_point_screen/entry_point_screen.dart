import 'package:flutter/material.dart';

import '../../../features/home/presentation/screens/home_screen/home_screen.dart';
import '../../../features/notifications/presentation/screens/notifications_screen.dart';
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

  late List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      const HomeScreen(),
      const NotificationsScreen(),
      const UserProfileScreen(),
    ];
    currentPage = const HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
            currentPage = pages[index];
          });
        },
        selectedIndex: currentPageIndex,
        indicatorColor: colorScheme.primary,
        // indicatorShape: const ShapeBorder()
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            icon: Icon(Icons.dashboard_outlined),
            label: 'Admin Dashboard',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
      body: currentPage,
    );
  }
}
