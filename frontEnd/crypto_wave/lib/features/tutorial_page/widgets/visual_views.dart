import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class VisualView extends StatelessWidget {
  const VisualView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title = const Text(
      'CRYPTO WAVE',
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 32,
        color: Color(0xFF666870),             
        letterSpacing: 0,
      ),
    );

    title = title.animate(adapter: ValueAdapter(0.5)).shimmer(
      colors: [
        const Color(0xFFFFFF00),
        const Color(0xFF00FF00),
        const Color(0xFF00FFFF),
        const Color(0xFF0033FF),
        const Color(0xFFFF00FF),
        const Color(0xFFFF0000),
        const Color(0xFFFFFF00),
      ],
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .saturate(delay: 1.seconds, duration: 2.seconds)
        .then() // set baseline time to previous effect's end time
        .tint(color: const Color(0xFF80DDFF));

    return Padding(padding: const EdgeInsets.all(24), child: title);
  }
}
