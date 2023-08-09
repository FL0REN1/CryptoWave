// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AutorizationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AutorizationPage(),
      );
    },
    CoinRoute.name: (routeData) {
      final args = routeData.argsAs<CoinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CoinPage(
          key: args.key,
          userId: args.userId,
          currencyCode: args.currencyCode,
          currencyName: args.currencyName,
        ),
      );
    },
    EarnRoute.name: (routeData) {
      final args = routeData.argsAs<EarnRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EarnPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      final args = routeData.argsAs<NewsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    NotificationsRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationsPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    TutorialRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TutorialPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [AutorizationPage]
class AutorizationRoute extends PageRouteInfo<void> {
  const AutorizationRoute({List<PageRouteInfo>? children})
      : super(
          AutorizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AutorizationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CoinPage]
class CoinRoute extends PageRouteInfo<CoinRouteArgs> {
  CoinRoute({
    Key? key,
    required int userId,
    required String currencyCode,
    required String currencyName,
    List<PageRouteInfo>? children,
  }) : super(
          CoinRoute.name,
          args: CoinRouteArgs(
            key: key,
            userId: userId,
            currencyCode: currencyCode,
            currencyName: currencyName,
          ),
          initialChildren: children,
        );

  static const String name = 'CoinRoute';

  static const PageInfo<CoinRouteArgs> page = PageInfo<CoinRouteArgs>(name);
}

class CoinRouteArgs {
  const CoinRouteArgs({
    this.key,
    required this.userId,
    required this.currencyCode,
    required this.currencyName,
  });

  final Key? key;

  final int userId;

  final String currencyCode;

  final String currencyName;

  @override
  String toString() {
    return 'CoinRouteArgs{key: $key, userId: $userId, currencyCode: $currencyCode, currencyName: $currencyName}';
  }
}

/// generated route for
/// [EarnPage]
class EarnRoute extends PageRouteInfo<EarnRouteArgs> {
  EarnRoute({
    Key? key,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          EarnRoute.name,
          args: EarnRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'EarnRoute';

  static const PageInfo<EarnRouteArgs> page = PageInfo<EarnRouteArgs>(name);
}

class EarnRouteArgs {
  const EarnRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final int userId;

  @override
  String toString() {
    return 'EarnRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final int userId;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<NewsRouteArgs> {
  NewsRoute({
    Key? key,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          NewsRoute.name,
          args: NewsRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<NewsRouteArgs> page = PageInfo<NewsRouteArgs>(name);
}

class NewsRouteArgs {
  const NewsRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final int userId;

  @override
  String toString() {
    return 'NewsRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<NotificationsRouteArgs> {
  NotificationsRoute({
    Key? key,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationsRoute.name,
          args: NotificationsRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<NotificationsRouteArgs> page =
      PageInfo<NotificationsRouteArgs>(name);
}

class NotificationsRouteArgs {
  const NotificationsRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final int userId;

  @override
  String toString() {
    return 'NotificationsRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final int userId;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final int userId;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [TutorialPage]
class TutorialRoute extends PageRouteInfo<void> {
  const TutorialRoute({List<PageRouteInfo>? children})
      : super(
          TutorialRoute.name,
          initialChildren: children,
        );

  static const String name = 'TutorialRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
