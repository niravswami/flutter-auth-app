import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutingHelperFn {
  static void routePushToWidget(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static void pushToPath(BuildContext context, String path) {
    context.push(path);
  }

  static void replaceToPath(BuildContext context, String path) {
    context.go(path);
  }

  static void pushToName(BuildContext context, String name) {
    context.pushNamed(name);
  }

  static void replaceToName(BuildContext context, String name) {
    context.goNamed(name);
  }

  static void popScreen(BuildContext context) {
    context.pop();
  }
}
