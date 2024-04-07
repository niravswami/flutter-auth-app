import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/assets_constants.dart';
import '../../../../common/constants/auth_constants.dart';
import '../../../../common/errors/error_dialog.dart';
import '../../../../common/routes/routes_constants.dart';
import '../../../../common/utils/helpers/routing_helper_fn.dart';
import '../../../../common/utils/helpers/spacing_helper_fn.dart';
import '../bloc/auth_bloc.dart';
import '../forms/sign_up_form.dart';
import '../widgets/auth_screen_layout.dart';
import '../widgets/auth_screen_title.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late GlobalKey<FormState> _formKey;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isProcessing = false;

  Map<String, dynamic>? _errors;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _setObscurePasswordField(String value) {
    setState(() {
      if (value == AuthConstants.password) {
        _obscurePassword = !_obscurePassword;
      } else {
        _obscureConfirmPassword = !_obscureConfirmPassword;
      }
    });
  }

  void _onSubmit() {
    setState(() {
      _isProcessing = true;
    });
    context.read<AuthBloc>().add(
          AuthSignUpEvent(
            email: _emailController.text.trim(),
            name: _nameController.text.trim(),
            password: _passwordController.text,
            passwordConfirmation: _confirmPasswordController.text,
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AuthScreenTitle(
            title: "Sign Up",
            subText: "Create a free account",
          ),
          SpacingHelperFn.verticalSpace(40.h),
          SvgPicture.asset(
            AssetsConstants.signUpSvgPath,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
          ),
          SpacingHelperFn.verticalSpace(25.h),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthErrors) {
                if (state.errors == null) {
                  showErrorDialog(context, state.message);
                }
                setState(() {
                  _errors = state.errors;
                  _isProcessing = false;
                });
              } else if (state is AuthUserLoggedIn) {
                print('got to home ');
                RoutingHelperFn.replaceToName(context, AppPage.home.toName);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: SignUpForm(
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  isObscurePassword: _obscurePassword,
                  isObscureConfirmPassword: _obscureConfirmPassword,
                  setObscurePasswordField: _setObscurePasswordField,
                  formKey: _formKey,
                  onSubmit: _onSubmit,
                  isProcessing: _isProcessing,
                  errors: _errors,
                ),
              );
            },
          ),
          SpacingHelperFn.verticalSpace(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              SpacingHelperFn.horizontalSpace(5.w),
              GestureDetector(
                onTap: () {
                  RoutingHelperFn.pushToName(context, AppPage.login.toName);
                },
                child: Text(
                  "Login",
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
