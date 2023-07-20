import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoutedIconButton extends StatefulWidget {
  const RoutedIconButton({
    Key? key,
    required this.svgIconPath,
    required this.flutterIcon,
    required this.padding,
    required this.func,
  }) : super(key: key);

  final String? svgIconPath;
  final IconData? flutterIcon;
  final double padding;
  final void Function() func;

  @override
  State<RoutedIconButton> createState() => _RoutedIconButtonState();
}

class _RoutedIconButtonState extends State<RoutedIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
        widget.func();
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 1.0],
            colors: _isPressed
                ? [Colors.blue, Colors.blueAccent]
                : [Colors.blueGrey, Colors.blue],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.padding),
          child: widget.svgIconPath != null
              ? SvgPicture.asset(
                  widget.svgIconPath!,
                  width: 100,
                  height: 100,
                )
              : Icon(widget.flutterIcon),
        ),
      ),
    );
  }
}
