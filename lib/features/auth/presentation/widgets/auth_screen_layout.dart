// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthScreenLayout extends StatelessWidget {
  final Widget child;
  final List<Widget>? actions;
  const AuthScreenLayout({
    super.key,
    required this.child,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorScheme.background,
        surfaceTintColor: Colors.transparent,
        actions: actions,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          color: colorScheme.background,
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SafeArea(
            child: child,
          ),
        ),
      ),
    );
  }
}
