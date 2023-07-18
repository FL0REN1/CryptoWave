import 'package:crypto_wave/features/home_page/widgets/coin_img_title_subtitle.dart';
import 'package:crypto_wave/features/home_page/widgets/icon_container.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:flutter/material.dart';

class CoinHugeContainer extends StatefulWidget {
  const CoinHugeContainer({
    super.key,
    required this.coin,
    required this.greenStyle,
    required this.redStyle,
  });
  final Coins coin;
  final bool greenStyle;
  final bool redStyle;

  @override
  State<CoinHugeContainer> createState() => _CoinHugeContainerState();
}

class _CoinHugeContainerState extends State<CoinHugeContainer> {
  late List<Color> colors;

  @override
  void initState() {
    if (widget.greenStyle) colors = [Colors.blueGrey, Colors.green];
    if (widget.redStyle) colors = [Colors.blueGrey, Colors.red];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 1.0],
            colors: colors),
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
                const SizedBox(width: 70),
                IconContainer(
                  svgIconPath: widget.greenStyle
                      ? 'assets/svg/greenPolygon.svg'
                      : 'assets/svg/redPolygon.svg',
                  flutterIcon: null,
                  padding: 8,
                  blueStyle: false,
                  redStyle: widget.redStyle,
                  greenStyle: widget.greenStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
