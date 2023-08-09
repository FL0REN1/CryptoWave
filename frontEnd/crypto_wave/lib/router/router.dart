import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/authorization_page/view/view.dart';
import 'package:crypto_wave/features/coin_page/views/views.dart';
import 'package:crypto_wave/features/earn_page/views/views.dart';
import 'package:crypto_wave/features/home_page/view/view.dart';
import 'package:crypto_wave/features/news_page/view/view.dart';
import 'package:crypto_wave/features/notifications_page/views/views.dart';
import 'package:crypto_wave/features/profile_page/views/views.dart';
import 'package:crypto_wave/features/search_page/views/views.dart';
import 'package:crypto_wave/features/tutorial_page/views/views.dart';
import 'package:crypto_wave/features/welcome_page/view/view.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // Welcome / Autorization
        AutoRoute(page: WelcomeRoute.page, path: '/'),
        AutoRoute(page: AutorizationRoute.page),

        // Home
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: TutorialRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: NotificationsRoute.page),

        // News
        AutoRoute(page: NewsRoute.page),

        // Earn
        AutoRoute(page: EarnRoute.page),

        // Profile
        AutoRoute(page: ProfileRoute.page),

        // Coin
        AutoRoute(page: CoinRoute.page),
      ];
}
