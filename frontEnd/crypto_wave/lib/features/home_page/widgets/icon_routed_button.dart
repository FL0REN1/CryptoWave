import 'package:crypto_wave/features/helper_page/rive_route.dart';
import 'package:flutter/material.dart';

class RoutedIconButton extends StatefulWidget {
  const RoutedIconButton({
    Key? key,
    required this.padding,
    required this.func,
    required this.rivePath,
    required this.artboard,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String rivePath;
  final String artboard;
  final double width;
  final double height;
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
        child: RiveRoute(
          artboard: widget.artboard,
          isSelected: true,
          rivePath: widget.rivePath,
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }
}
