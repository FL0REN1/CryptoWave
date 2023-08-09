import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/tutorial_page/widgets/visual_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title = const Text(
      'Introduction',
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 40,
        color: Color(0xFF666870),
        height: 1,
        letterSpacing: -1,
      ),
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1200.ms, color: const Color(0xFF80DDFF))
        .animate() // this wraps the previous Animate in another Animate
        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
        .slide();

    List<Widget> tabInfoItems = [
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.link, color: Color(0xFF80DDFF)),
            const SizedBox(width: 8),
            Flexible(
              child: GestureDetector(
                onTap: () async {
                  final url = Uri.parse(
                    'https://github.com/FL0REN1/CryptoWave',
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: const Text(
                  'Source code of GitHub',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )
    ];

    // Animate all of the info items in the list:
    tabInfoItems = tabInfoItems
        .animate(interval: 600.ms)
        .fadeIn(duration: 900.ms, delay: 300.ms)
        .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const VisualView(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            title,
            hr,
            const Text(
                'Crypto Wave, an innovative cryptocurrency exchange that combines advanced technology and security to ensure your financial freedom.'
                '\n\nWe offer the convenience of trading cryptocurrencies and tokens right from your mobile device.'),
            hr,
            ...tabInfoItems,
            hr,
            const Text(
                'Download Crypto Wave app now and start your way to financial independence!'),
          ],
        ));
  }

  Widget get hr => Container(
        height: 2,
        color: const Color(0x8080DDFF),
        margin: const EdgeInsets.symmetric(vertical: 16),
      ).animate().scale(duration: 600.ms, alignment: Alignment.centerLeft);
}
