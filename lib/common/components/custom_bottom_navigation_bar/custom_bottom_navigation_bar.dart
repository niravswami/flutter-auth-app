import 'package:flutter_auth_app/common/routes/cubit/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/theme/theme_constants.dart';
import '../../routes/routes_constants.dart';
import '../../utils/helpers/routing_helper_fn.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(BuildContext context, int index) {
    final routeCubit = context.read<BottomNavCubit>();
    String routeName = 'home';
    switch (index) {
      case 0:
        routeName = AppPage.home.toName;
        break;
      case 1:
        routeName = AppPage.adminDashboard.toName;
        break;
      case 2:
        routeName = AppPage.profile.toName;
        break;
      default:
    }
    routeCubit.updateRoute({'index': index, 'routeName': routeName});
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   final routeCubit = context.read<BottomNavCubit>().state;
  //   if (routeCubit is BottomNavCubitInitial) {
  //     setState(() {
  //       _selectedIndex = routeCubit.index;
  //     });
  //   }

  //   print(routeCubit);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final routeCubit = context.read<BottomNavCubit>().state;
    // if (routeCubit is BottomNavCubitInitial) {
    //   print(routeCubit.index);
    //   print(routeCubit.routeName);
    // }
    return Container(
        // margin: const EdgeInsets.symmetric(horizontal: 24),
        // padding: const EdgeInsets.only(
        //   top: 10,
        //   left: 5,
        //   right: 5,
        // ),
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
        child: BlocConsumer<BottomNavCubit, BottomNavCubitState>(
            listener: (context, state) {
          if (state is BottomNavCubitInitial) {
            print(state.index);
            print(state.routeName);
            RoutingHelperFn.pushToName(context, state.routeName);
          }
        }, builder: (context, state) {
          return BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            currentIndex:
                state is BottomNavCubitInitial ? state.index : _selectedIndex,
            onTap: (index) => _onItemTapped(context, index),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Admin Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        }));
  }
}
