// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/routes/routes_constants.dart';
import '../../../../common/utils/helpers/regexp_helper_fn.dart';
import '../../../../common/utils/helpers/routing_helper_fn.dart';
import '../../../../common/utils/helpers/spacing_helper_fn.dart';
import '../widgets/auth_action_button.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final Function() setObscurePasswordField;

  final VoidCallback onSubmit;

  final bool isObscurePassword;
  final bool isProcessing;

  final GlobalKey<FormState> formKey;
  final Map<String, dynamic>? errors;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.setObscurePasswordField,
    required this.isObscurePassword,
    required this.onSubmit,
    this.isProcessing = false,
    required this.formKey,
    this.errors,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              errorText: errors?.containsKey('email') == true
                  ? errors!['email'][0]
                  : null,
              labelText: 'Eamil',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a email';
              } else if (RegExpHelperFn.isValidEmail(value)) {
                return 'invalid email';
              }
              return null;
            },
          ),
          SpacingHelperFn.verticalSpace(20.h),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                color: Colors.grey,
                icon: Icon(
                  isObscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: setObscurePasswordField,
              ),
            ),
            obscureText: isObscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
          SpacingHelperFn.verticalSpace(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  if (isProcessing) return;
                  RoutingHelperFn.pushToName(
                      context, AppPage.forgotPassword.toName);
                },
                child: const Text(
                  "Forgot Password?",
                ),
              )
            ],
          ),
          SpacingHelperFn.verticalSpace(30.h),
          AuthActionButton(
            onSubmit: onSubmit,
            label: "Login",
            formKey: formKey,
            isObscurePassword: isObscurePassword,
            isProcessing: isProcessing,
          )
        ],
      ),
    );
  }
}
