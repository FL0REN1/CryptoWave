import 'package:crypto_wave/features/home_page/widgets/coin_graphic.dart';
import 'package:crypto_wave/features/home_page/widgets/coin_img_title_subtitle.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:flutter/material.dart';

class CoinHugeContainer extends StatefulWidget {
  const CoinHugeContainer({
    super.key,
    required this.coin,
  });
  final Coins coin;

  @override
  State<CoinHugeContainer> createState() => _CoinHugeContainerState();
}

class _CoinHugeContainerState extends State<CoinHugeContainer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 27, 38, 49),
            Color.fromARGB(255, 52, 73, 94),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CoinImgTitleSubtitle(
                    imgUrl: widget.coin.details.fullImageUrl,
                    titleText: widget.coin.name,
                    subtitleText: widget.coin.details.toSymbol),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '\$ ${widget.coin.details.highDay} HIGH',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      "\$ ${widget.coin.details.lowDay} LOW",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: CoinGraphic(coin: widget.coin),
            ),
            const SizedBox(
              width: 200,
              child: Divider(
                height: 10,
                thickness: 2,
              ),
            ),
            Text(
                '${widget.coin.details.priceInUSD}\$ | ${widget.coin.details.fullPrecentInUSD}%')
          ],
        ),
      ),
    );
  }
}
