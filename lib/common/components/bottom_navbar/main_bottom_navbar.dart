import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(25.r),
        ),
        border: Border(
          top: BorderSide(color: colorScheme.primary.withOpacity(0.8)),
        ),
      ),
      child: BottomNavigationBar(
        selectedFontSize: 15.0.sp,
        unselectedFontSize: 14.0.sp,
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
