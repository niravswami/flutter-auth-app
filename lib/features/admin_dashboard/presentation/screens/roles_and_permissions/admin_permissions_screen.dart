import 'package:flutter/material.dart';

class AdminPermissionsScreen extends StatelessWidget {
  const AdminPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Permission Gateways"),
      ),
      body: const Center(
        child: Card(
          child: Text("Admin Permission Gateways"),
        ),
      ),
    );
  }
}
