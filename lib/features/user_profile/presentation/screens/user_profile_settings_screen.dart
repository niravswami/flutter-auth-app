import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/helpers/spacing_helper_fn.dart';
import '../../../../common/utils/logout_method/logout_method.dart';
import '../../../../config/theme/cubit/app_theme_mode_cubit.dart';

class UserProfileSettingsScreen extends StatelessWidget {
  const UserProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<AppThemeModeCubit, AppThemeModeState>(
                builder: (context, state) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Dark Mode"),
                          Switch(
                              value: state is AppDarkMode,
                              onChanged: (val) {
                                context
                                    .read<AppThemeModeCubit>()
                                    .toggleThemeMode();
                              })
                        ],
                      ),
                    ),
                  );
                },
              ),
              SpacingHelperFn.verticalSpace(20.sp),
              OutlinedButton(
                onPressed: () {
                  logoutMethod(context);
                },
                child: const Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
