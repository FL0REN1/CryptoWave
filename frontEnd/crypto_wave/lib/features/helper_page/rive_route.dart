import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveRoute extends StatefulWidget {
  const RiveRoute({
    super.key,
    required this.artboard,
    required this.width,
    required this.isSelected,
    required this.rivePath,
    required this.height,
  });
  final String rivePath;
  final String artboard;
  final double width;
  final double height;
  final bool isSelected;

  @override
  State<RiveRoute> createState() => _RiveRouteState();
}

class _RiveRouteState extends State<RiveRoute> {
  late RiveAnimationController _controller;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'active',
      autoplay: false,
      onStop: () => setState(() => isPlaying = false),
      onStart: () => setState(() => isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ColorFiltered(
        colorFilter: widget.isSelected
            ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : const ColorFilter.mode(
                Color.fromARGB(179, 182, 182, 182), BlendMode.srcIn),
        child: RiveAnimation.asset(
          widget.rivePath,
          artboard: widget.artboard,
          animations: const ['idle'],
          onInit: (text) {
            widget.isSelected
                ? _controller.isActive = true
                : _controller.isActive = false;
          },
          controllers: [_controller],
        ),
      ),
    );
  }
}
