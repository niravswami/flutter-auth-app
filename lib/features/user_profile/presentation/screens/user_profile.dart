import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/routes/routes_constants.dart';
import '../../../../common/utils/helpers/routing_helper_fn.dart';
import '../../../../common/utils/helpers/spacing_helper_fn.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  static final serviceLocator = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    final authState = serviceLocator<AuthBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              RoutingHelperFn.pushToName(
                  context, AppPage.profileSettings.toName);
            },
            icon: const Icon(Icons.settings_outlined),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: authState is AuthUserLoggedIn
            ? Padding(
                padding: EdgeInsets.all(20.0.r),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.w,
                        backgroundColor: Colors.blueGrey,
                        child: Text(
                          authState.user.name[0].toUpperCase(),
                          style:
                              TextStyle(fontSize: 40.sp, color: Colors.white),
                        ),
                      ),
                      SpacingHelperFn.verticalSpace(12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                authState.user.name,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                authState.user.email,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SpacingHelperFn.verticalSpace(12.h),
                      const Divider(),
                      SpacingHelperFn.verticalSpace(12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "USER ROLE",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      SpacingHelperFn.verticalSpace(12.h),
                      const Divider(),
                    ],
                  ),
                ),
              )
            : const Center(
                child: Text("You are not authenticated."),
              ),
      ),
    );
  }
}
