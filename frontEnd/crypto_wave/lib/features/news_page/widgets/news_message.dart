import 'package:crypto_wave/features/home_page/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WaveMessage extends StatelessWidget {
  const WaveMessage({
    super.key,
    required this.date,
    required this.text,
  });

  final String date;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, 1.0],
          colors: [Colors.blueGrey, Colors.blue],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CoinImgTitleSubtitle(
            imgUrl: 'assets/images/wave_img.png',
            titleText: 'Crypto Wave',
            subtitleText: date,
            network: false,
          ),
          const SizedBox(height: 10),
          Text(text, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
