import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/route_icon_top_text_bottom.dart';
import 'package:crypto_wave/router/router.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              svgIconPath: 'assets/svg/home.svg',
              labelText: 'home',
              width: 30,
              index: 0,
              func: () {
                setState(() {
                  widget.selectedIndex == 0;
                });
                if (widget.selectedIndex != 0) {
                  AutoRouter.of(context).push(const HomeRoute());
                }
              },
              isSelected: 0 == widget.selectedIndex,
            ),
            RouteIconTopTextBottom(
              svgIconPath: 'assets/svg/news.svg',
              labelText: 'news',
              width: 30,
              index: 1,
              func: () {
                setState(() {
                  widget.selectedIndex == 1;
                });
                if (widget.selectedIndex != 1) {
                  AutoRouter.of(context).push(const NewsRoute());
                }
              },
              isSelected: 1 == widget.selectedIndex,
            ),
            RouteIconTopTextBottom(
              svgIconPath: 'assets/svg/earn.svg',
              labelText: 'earn',
              width: 55,
              index: 2,
              func: () {
                setState(() {
                  widget.selectedIndex == 2;
                });
                if (widget.selectedIndex != 2) {
                  AutoRouter.of(context).push(const EarnRoute());
                }
              },
              isSelected: 2 == widget.selectedIndex,
            ),
            RouteIconTopTextBottom(
              svgIconPath: 'assets/svg/profile.svg',
              labelText: 'profile',
              width: 30,
              index: 3,
              func: () {
                setState(() {
                  widget.selectedIndex == 3;
                });
                if (widget.selectedIndex != 3) {
                  AutoRouter.of(context).push(const ProfileRoute());
                }
              },
              isSelected: 3 == widget.selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
