import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/login_page/view/view.dart';
import 'package:crypto_wave/features/registration_page/view/view.dart';
import 'package:crypto_wave/features/welcome_page/view/view.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, path: '/'),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: LoginRoute.page),
      ];
}
