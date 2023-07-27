import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/home_page/widgets/widgets.dart';
import 'package:crypto_wave/features/welcome_page/widgets/widgets.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:crypto_wave/router/router.dart';
import 'package:flutter/material.dart';

class CoinSmallContainer extends StatefulWidget {
  const CoinSmallContainer({
    super.key,
    required this.coin,
    required this.currencyCode,
    required this.userId,
    required this.currencyName,
  });
  final Coins coin;
  final String currencyCode;
  final int userId;
  final String currencyName;

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
            child: Align(
              alignment: Alignment.centerRight, // Align to the right
              child: RoutedTextIconButton(
                routedButtonText: 'View more',
                onPressed: () {
                  AutoRouter.of(context).push(
                    CoinRoute(
                        currencyCode: widget.currencyCode,
                        userId: widget.userId,
                        currencyName: widget.currencyName),
                  );
                },
                width: 230,
                flutterIcon: Icons.auto_graph,
                paddingVertical: 20,
                paddingHorizontal: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
