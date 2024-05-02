import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/theme_constants.dart';

class MainBottomNavbar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<BottomNavigationBarItem> navigationDestinations;
  final void Function(int) onTap;

  const MainBottomNavbar({
    super.key,
    required this.navigationShell,
    required this.navigationDestinations,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border(
          top: BorderSide(
            color: AppColors.primaryLight.withOpacity(0.8),
          ),
        ),
      ),
      child: BottomNavigationBar(
        selectedFontSize: 15.0,
        unselectedFontSize: 14.0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        items: navigationDestinations,
        currentIndex: navigationShell.currentIndex.clamp(
            0,
            navigationDestinations.length -
                1), // Ensure selectedIndex stays within the range
        onTap: onTap,
      ),
    );
  }
}
