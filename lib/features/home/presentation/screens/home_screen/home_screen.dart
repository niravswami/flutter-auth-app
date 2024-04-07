import 'package:flutter/material.dart';

import '../../../../../common/routes/routes_constants.dart';
import '../../../../../common/utils/helpers/routing_helper_fn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        actions: [
          IconButton(
            onPressed: () {
              RoutingHelperFn.pushToName(
                context,
                AppPage.notifications.toName,
              );
            },
            icon: const Badge(
              child: Icon(
                Icons.notifications_outlined,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Text(
              "Wel come to your home screen",
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
