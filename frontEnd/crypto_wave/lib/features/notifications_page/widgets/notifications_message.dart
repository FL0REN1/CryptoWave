import 'package:crypto_wave/features/home_page/widgets/widgets.dart';
import 'package:crypto_wave/features/notifications_page/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class NotificationsMessage extends StatefulWidget {
  const NotificationsMessage({
    Key? key,
    required this.date,
    required this.text,
    required this.isLoss,
    required this.isProfit,
    required this.notificationsBloc,
    required this.index,
    required this.isChoosen,
    required this.onDoubleTap,
  }) : super(key: key);

  final String date;
  final String text;
  final bool isLoss;
  final bool isProfit;
  final int index;
  final NotificationsBloc notificationsBloc;
  final bool isChoosen;
  final VoidCallback onDoubleTap;

  @override
  State<NotificationsMessage> createState() => _NotificationsMessageState();
}

class _NotificationsMessageState extends State<NotificationsMessage> {
  late List<MaterialColor> _colors;

  @override
  void initState() {
    _colors = widget.isLoss
        ? [Colors.blueGrey, Colors.red]
        : [Colors.blueGrey, Colors.green];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isChosen = widget.isChoosen;
    final gradientColors = isChosen ? null : _colors;

    return GestureDetector(
      onDoubleTap: () {
        widget.onDoubleTap();
      },
      child: isChosen
          ? ShakeWidget(
              duration: const Duration(seconds: 15),
              shakeConstant: ShakeDefaultConstant1(),
              autoPlay: true,
              enableWebMouseHover: true,
              child: _buildContainer(theme, gradientColors),
            )
          : _buildContainer(theme, gradientColors),
    );
  }

  Container _buildContainer(
    ThemeData theme,
    List<MaterialColor>? gradientColors,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            widget.isChoosen ? Border.all(color: Colors.red, width: 2) : null,
        color: widget.isChoosen
            ? const Color.fromARGB(255, 133, 25, 25).withOpacity(0.6)
            : null,
        gradient: gradientColors != null
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.4, 1.0],
                colors: gradientColors,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CoinImgTitleSubtitle(
                imgUrl: 'assets/images/wave_img.png',
                titleText: 'Crypto Wave',
                subtitleText: widget.date,
                network: false,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  widget.notificationsBloc.add(
                    DeleteNotificationById(id: widget.index, completer: null),
                  );
                },
                child: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(widget.text, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
