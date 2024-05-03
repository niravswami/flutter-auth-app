import 'package:flutter/material.dart';

class AdminRolesAndPermissionsScreen extends StatelessWidget {
  const AdminRolesAndPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Roles And Permissions"),
      ),
      body: const Center(
        child: Card(
          child: Text("Admin Roles and permissions"),
        ),
      ),
    );
  }
}
