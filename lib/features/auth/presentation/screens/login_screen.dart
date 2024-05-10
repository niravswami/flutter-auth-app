import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/assets_constants.dart';
import '../../../../common/errors/error_dialog.dart';
import '../../../../common/routes/routes_constants.dart';
import '../../../../common/utils/helpers/routing_helper_fn.dart';
import '../../../../common/utils/helpers/spacing_helper_fn.dart';
import '../bloc/auth_bloc.dart';
import '../forms/login_form.dart';
import '../widgets/auth_screen_layout.dart';
import '../widgets/auth_screen_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> _formKey;
  bool _obscurePassword = true;
  bool _isProcessing = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Map<String, dynamic>? _errors;

  void _setObscurePasswordField() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenLayout(
      child: Column(
        children: [
          const AuthScreenTitle(
            title: "Login",
            subText: "Login to your account",
          ),
          SpacingHelperFn.verticalSpace(30.h),
          SvgPicture.asset(
            AssetsConstants.loginSvgPath,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
          ),
          SpacingHelperFn.verticalSpace(30.h),
          BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            // if (state is AuthFailure) {
            if (state is AuthErrors) {
              if (state.errors == null) {
                showErrorDialog(context, state.message);
              }
              setState(() {
                _errors = state.errors;
                _isProcessing = false;
              });
            } else if (state is AuthUserLoggedIn) {
              RoutingHelperFn.replaceToName(context, AppPage.home.toName);
            }
          }, builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: LoginForm(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                isObscurePassword: _obscurePassword,
                setObscurePasswordField: _setObscurePasswordField,
                onSubmit: () {
                  setState(() {
                    _isProcessing = true;
                  });
                  context.read<AuthBloc>().add(
                        AuthLoginEvent(
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                        ),
                      );
                },
                isProcessing: _isProcessing,
                errors: _errors,
              ),
            );
          }),
          SpacingHelperFn.verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              SpacingHelperFn.horizontalSpace(5.w),
              GestureDetector(
                onTap: () {
                  if (_isProcessing) return;
                  RoutingHelperFn.pushToName(context, AppPage.signUp.toName);
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
