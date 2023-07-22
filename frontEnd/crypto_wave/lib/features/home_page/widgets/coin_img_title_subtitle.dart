import 'package:flutter/material.dart';

class CoinImgTitleSubtitle extends StatelessWidget {
  const CoinImgTitleSubtitle(
      {super.key,
      required this.imgUrl,
      required this.titleText,
      required this.subtitleText,
      required this.network});
  final String imgUrl;
  final String titleText;
  final String subtitleText;
  final bool network;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: <Widget>[
        network
            ? Image.network(
                imgUrl,
                width: 35,
              )
            : Image.asset(
                imgUrl,
                width: 35,
              ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              titleText,
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              subtitleText,
              style: theme.textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}
