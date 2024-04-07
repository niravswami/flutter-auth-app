// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/loader.dart';

class AuthActionButton extends StatelessWidget {
  final VoidCallback _onSubmit;
  final String _label;

  final bool _isProcessing;

  final GlobalKey<FormState> _formKey;

  const AuthActionButton({
    super.key,
    required VoidCallback onSubmit,
    required String label,
    required GlobalKey<FormState> formKey,
    required bool isObscurePassword,
    required bool isProcessing,
  })  : _label = label,
        _onSubmit = onSubmit,
        _formKey = formKey,
        _isProcessing = isProcessing;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: () {
        if (_isProcessing) return;
        if (_formKey.currentState!.validate()) {
          _onSubmit();
        }
      },
      style: FilledButton.styleFrom(minimumSize: Size(double.infinity, 55.h)),
      child: _isProcessing
          ? const Loader()
          : Text(
              _label,
              style: TextStyle(
                color: colorScheme.surface,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
