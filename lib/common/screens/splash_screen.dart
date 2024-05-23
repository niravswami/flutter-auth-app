import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../constants/assets_constants.dart';
import '../errors/error_dialog.dart';
import '../routes/routes_constants.dart';
import '../utils/helpers/routing_helper_fn.dart';
import '../utils/helpers/shared_preferences_helper_fn.dart';
import '../utils/helpers/spacing_helper_fn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  void getUserDetailCall(String? token) {
    if (token != null) {
      context.read<AuthBloc>().add(AuthGetUserDetail());
    } else {
      RoutingHelperFn.replaceToName(context, AppPage.onBoarding.toName);
    }
  }

  Future<void> _initializeApp() async {
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 2));
    final token = await SharedPreferencesHelper.getToken();
    getUserDetailCall(token);
  }

  _navigateToLoginScreen() {
    RoutingHelperFn.replaceToName(context, AppPage.login.toName);
  }

  Future<void> _onUnauthenticated() async {
    await SharedPreferencesHelper.removeToken();
    _navigateToLoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthErrors) {
              showErrorDialog(context, state.message);

              if (state.statusCode == 401) {
                Future.delayed(
                  const Duration(seconds: 1),
                  () => _onUnauthenticated(),
                );
              }
            }
            if (state is AuthUserLoggedIn) {
              RoutingHelperFn.replaceToName(context, AppPage.home.toName);
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: Image.asset(
                    AssetsConstants.icon96SizePath,
                    width: 140.w,
                    height: 140.h,
                  ),
                ),
                SpacingHelperFn.verticalSpace(20.h),
                Text(
                  'Flutter Auth App',
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SpacingHelperFn.verticalSpace(30.h),
                (state is AuthLoading || state is AuthInitial)
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.sp),
                        child: const LinearProgressIndicator(),
                      )
                    : const SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
