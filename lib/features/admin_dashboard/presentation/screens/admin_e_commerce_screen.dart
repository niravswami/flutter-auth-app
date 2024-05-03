import 'package:flutter/material.dart';

class AdminECommerceScreen extends StatelessWidget {
  const AdminECommerceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin E-Commerce"),
      ),
      body: const Center(
        child: Card(
          child: Text("Admin E-Commerce"),
        ),
      ),
    );
  }
}
