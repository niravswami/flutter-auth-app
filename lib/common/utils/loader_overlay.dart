import 'package:flutter/material.dart';

import '../widgets/loader.dart';

/// Note: To remove this overlay use: Navigator.pop(context);
void showLoaderOverlay(BuildContext context) {
  showDialog<Widget>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Loader()],
          ),
        ),
      );
    },
  );
}
