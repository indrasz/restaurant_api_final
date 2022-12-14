import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/navigation_helper.dart';

customDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Coming Soon'),
          content: const Text('This feature will coming soon!'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Okay'),
              onPressed: () => NavigationHelper.back(),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Coming Soon'),
          content: const Text('This feature will coming soon!'),
          actions: [
            TextButton(
              onPressed: () => NavigationHelper.back(),
              child: const Text('Okay'),
            )
          ],
        );
      },
    );
  }
}
