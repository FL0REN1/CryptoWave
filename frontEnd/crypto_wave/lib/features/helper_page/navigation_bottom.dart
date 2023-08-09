import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/route_icon_top_text_bottom.dart';
import 'package:crypto_wave/router/router.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom(
      {super.key, required this.selectedIndex, required this.userId});

  final int selectedIndex;
  final int userId;

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blueGrey, Colors.blue],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RouteIconTopTextBottom(
              artboard: 'HOME',
              labelText: 'home',
              width: 45,
              height: 45,
              index: 0,
              func: () {
                setState(() {
                  widget.selectedIndex == 0;
                });
                if (widget.selectedIndex != 0) {
                  AutoRouter.of(context).push(HomeRoute(userId: widget.userId));
                }
              },
              isSelected: 0 == widget.selectedIndex,
              rivePath: 'assets/rive/icons.riv',
            ),
            RouteIconTopTextBottom(
              artboard: 'NEWS',
              labelText: 'news',
              index: 1,
              func: () {
                setState(() {
                  widget.selectedIndex == 1;
                });
                if (widget.selectedIndex != 1) {
                  AutoRouter.of(context).push(NewsRoute(userId: widget.userId));
                }
              },
              isSelected: 1 == widget.selectedIndex,
              rivePath: 'assets/rive/news.riv',
              width: 45,
              height: 45,
            ),
            RouteIconTopTextBottom(
              artboard: 'EARN',
              labelText: 'earn',
              index: 2,
              func: () {
                setState(() {
                  widget.selectedIndex == 2;
                });
                if (widget.selectedIndex != 2) {
                  AutoRouter.of(context).push(EarnRoute(userId: widget.userId));
                }
              },
              isSelected: 2 == widget.selectedIndex,
              rivePath: 'assets/rive/earn.riv',
              width: 45,
              height: 45,
            ),
            RouteIconTopTextBottom(
              artboard: 'USER',
              labelText: 'profile',
              index: 3,
              func: () {
                setState(() {
                  widget.selectedIndex == 3;
                });
                if (widget.selectedIndex != 3) {
                  AutoRouter.of(context)
                      .push(ProfileRoute(userId: widget.userId));
                }
              },
              isSelected: 3 == widget.selectedIndex,
              rivePath: 'assets/rive/icons.riv',
              width: 45,
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
