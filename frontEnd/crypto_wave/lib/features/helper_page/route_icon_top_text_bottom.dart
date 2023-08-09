import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RouteIconTopTextBottom extends StatefulWidget {
  const RouteIconTopTextBottom({
    super.key,
    required this.artboard,
    required this.labelText,
    required this.width,
    required this.index,
    required this.func,
    required this.isSelected,
    required this.rivePath,
    required this.height,
  });
  final String rivePath;
  final String artboard;
  final String labelText;
  final double width;
  final double height;
  final int index;
  final bool isSelected;
  final void Function() func;

  @override
  State<RouteIconTopTextBottom> createState() => _RouteIconTopTextBottomState();
}

class _RouteIconTopTextBottomState extends State<RouteIconTopTextBottom> {
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
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        widget.func();
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: ColorFiltered(
              colorFilter: widget.isSelected
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : const ColorFilter.mode(Color.fromARGB(179, 182, 182, 182), BlendMode.srcIn),
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
          ),
          const SizedBox(height: 5),
          Text(widget.labelText, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
