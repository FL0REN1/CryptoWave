import 'package:flutter/material.dart';

class RoutedTextIconButton extends StatelessWidget {
  const RoutedTextIconButton(
      {super.key,
      required this.routedButtonText,
      required this.onPressed,
      required this.width,
      required this.paddingVertical,
      required this.paddingHorizontal,
      required this.flutterIcon});
  final String routedButtonText;
  final IconData? flutterIcon;
  final VoidCallback onPressed;
  final double width;
  final double paddingVertical;
  final double paddingHorizontal;

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
          padding: EdgeInsets.symmetric(
            vertical: paddingVertical,
            horizontal: paddingHorizontal,
          ),
        ),
        child: Row(
          children: <Widget>[
            Text(routedButtonText),
            const SizedBox(width: 10),
            if (flutterIcon != null) Icon(flutterIcon),
          ],
        ),
      ),
    );
  }
}
