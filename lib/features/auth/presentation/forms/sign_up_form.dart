// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/auth_constants.dart';
import '../../../../common/utils/helpers/regexp_helper_fn.dart';
import '../../../../common/utils/helpers/spacing_helper_fn.dart';
import '../widgets/auth_action_button.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Function(String) setObscurePasswordField;

  final bool isObscurePassword;
  final bool isObscureConfirmPassword;
  final bool isProcessing;

  final VoidCallback onSubmit;

  final Map<String, dynamic>? errors;

  const SignUpForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isObscurePassword,
    required this.isObscureConfirmPassword,
    required this.setObscurePasswordField,
    required this.formKey,
    required this.onSubmit,
    this.isProcessing = false,
    this.errors,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              errorText: errors?.containsKey('name') == true
                  ? errors!['name'][0]
                  : null,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SpacingHelperFn.verticalSpace(5.h),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              errorText: errors?.containsKey('email') == true
                  ? errors!['email'][0]
                  : null,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (RegExpHelperFn.isValidEmail(value)) {
                return 'invalid email';
              }
              // You can add more email validation logic if needed
              return null;
            },
          ),
          SpacingHelperFn.verticalSpace(5.h),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                color: Colors.grey,
                icon: Icon(
                  isObscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setObscurePasswordField(AuthConstants.password);
                },
              ),
              errorText: errors?.containsKey('password') == true
                  ? errors!['password'][0]
                  : null,
            ),
            obscureText: isObscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              // You can add more password validation logic if needed
              return null;
            },
          ),
          SpacingHelperFn.verticalSpace(5.h),
          TextFormField(
            controller: confirmPasswordController,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              suffixIcon: IconButton(
                color: Colors.grey,
                icon: Icon(
                  isObscureConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setObscurePasswordField(AuthConstants.confirmPassword);
                },
              ),
              errorText: errors?.containsKey('password_confirmation') == true
                  ? errors!['password_confirmation'][0]
                  : null,
            ),
            obscureText: isObscureConfirmPassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          SpacingHelperFn.verticalSpace(30.h),
          AuthActionButton(
            onSubmit: onSubmit,
            label: "Sign Up",
            formKey: formKey,
            isObscurePassword: isObscurePassword,
            isProcessing: isProcessing,
          )
        ],
      ),
    );
  }
}
