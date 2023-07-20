import 'package:crypto_wave/features/helper_page/route_icon_top_text_bottom.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int selectedIndex = 0;

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
                  selectedIndex = 0;
                });
              },
              isSelected: 0 == selectedIndex,
            ),
            RouteIconTopTextBottom(
              svgIconPath: 'assets/svg/news.svg',
              labelText: 'news',
              width: 30,
              index: 1,
              func: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              isSelected: 1 == selectedIndex,
            ),
            RouteIconTopTextBottom(
              svgIconPath: 'assets/svg/earn.svg',
              labelText: 'earn',
              width: 55,
              index: 2,
              func: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              isSelected: 2 == selectedIndex,
            ),
            RouteIconTopTextBottom(
              svgIconPath: 'assets/svg/profile.svg',
              labelText: 'profile',
              width: 30,
              index: 3,
              func: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
              isSelected: 3 == selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
