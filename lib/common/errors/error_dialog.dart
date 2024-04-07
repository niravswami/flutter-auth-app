import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, message) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('Ok'),
        ),
      ],
    ),
  );
}
