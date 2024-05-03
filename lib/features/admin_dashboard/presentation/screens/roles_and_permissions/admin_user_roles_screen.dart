import 'package:flutter/material.dart';

class AdminUserRolesScreen extends StatelessWidget {
  const AdminUserRolesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin User Roles"),
      ),
      body: const Center(
        child: Card(
          child: Text("Admin User Roles"),
        ),
      ),
    );
  }
}
