import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(BuildContext context, String message, Color backgroundColor,
    IconData iconData, Color iconColor, ToastGravity gravity) {
  FToast fToast = FToast();
  fToast.init(context);
  final theme = Theme.of(context);

  Widget toast = Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: backgroundColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: iconColor,
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            message,
            style: theme.textTheme.labelSmall,
            softWrap: true,
          ),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: gravity,
    toastDuration: const Duration(seconds: 2),
  );
}

void showErrorToast(
    BuildContext context, String message, ToastGravity gravity) {
  showToast(context, message, const Color.fromARGB(255, 247, 64, 64),
      Icons.error, Colors.white, gravity);
}

void showSuccessToast(
    BuildContext context, String message, ToastGravity gravity) {
  showToast(context, message, const Color.fromARGB(200, 36, 71, 41),
      Icons.check_circle, const Color.fromARGB(255, 0, 243, 81), gravity);
}

// [Snack Bar]

void showErrorSnackBar(BuildContext context, String message) {
  final theme = Theme.of(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color.fromARGB(255, 247, 64, 64),
      content: Row(
        children: [
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.labelSmall,
              softWrap: true,
            ),
          ),
        ],
      ),
    ),
  );
}
