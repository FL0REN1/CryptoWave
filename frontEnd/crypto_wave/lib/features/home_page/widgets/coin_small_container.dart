import 'package:crypto_wave/features/home_page/widgets/widgets.dart';
import 'package:crypto_wave/features/welcome_page/widgets/widgets.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:flutter/material.dart';

class CoinSmallContainer extends StatefulWidget {
  const CoinSmallContainer({super.key, required this.coin});
  final Coins coin;

  @override
  State<CoinSmallContainer> createState() => _CoinSmallContainerState();
}

class _CoinSmallContainerState extends State<CoinSmallContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 92, 118, 145),
            Color.fromARGB(255, 52, 73, 94),
          ],
        ),
      ),
      child: Row(
        children: <Widget>[
          CoinImgTitleSubtitle(
            imgUrl: widget.coin.details.fullImageUrl,
            titleText: widget.coin.name,
            subtitleText: widget.coin.details.toSymbol,
            network: true,
          ),
          const SizedBox(width: 20),
          Expanded(
            // Added Expanded widget
            child: Align(
              alignment: Alignment.centerRight, // Align to the right
              child: RoutedTextIconButton(
                routedButtonText: 'View more',
                onPressed: () {},
                width: 230,
                flutterIcon: Icons.auto_graph,
                paddingVertical: 20,
                paddingHorizontal: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
