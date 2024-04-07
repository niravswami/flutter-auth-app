import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../errors/error_dialog.dart';
import '../routes/routes_constants.dart';
import '../utils/helpers/routing_helper_fn.dart';
import '../utils/helpers/shared_preferences_helper_fn.dart';

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
    await Future.delayed(const Duration(seconds: 1));
    final token = await SharedPreferencesHelper.getToken();
    getUserDetailCall(token);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
          child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthErrors) {
          showErrorDialog(context, state.message);
        }
        if (state is AuthUserLoggedIn) {
          RoutingHelperFn.replaceToName(context, AppPage.home.toName);
        }
      }, builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Admin Dashboard',
              style: TextStyle(
                fontSize: 32,
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            (state is AuthLoading || state is AuthInitial)
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme.primary,
                    ),
                  )
                : const SizedBox(),
          ],
        );
      })),
    );
  }
}
