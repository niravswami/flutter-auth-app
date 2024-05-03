import 'package:flutter/material.dart';

class AdminPaymentGatewayScreen extends StatelessWidget {
  const AdminPaymentGatewayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Payment Gateways"),
      ),
      body: const Center(
        child: Card(
          child: Text("Admin Payment Gateways"),
        ),
      ),
    );
  }
}
