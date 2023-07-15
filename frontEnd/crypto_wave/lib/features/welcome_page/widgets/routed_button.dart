import 'package:flutter/material.dart';

class RoutedButton extends StatelessWidget {
  const RoutedButton({super.key, required this.routedButtonText, required this.onPressed, required this.width});
  final String routedButtonText;
  final VoidCallback onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(routedButtonText),
      ),
    );
  }
}
