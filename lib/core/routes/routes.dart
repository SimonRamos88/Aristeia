import 'package:aristeia_app/core/routes/route_guard.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/main.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page),
    AutoRoute(
      path: '/welcome',
      page: WelcomeRouter.page,
      children: [
        AutoRoute(path: '', page: WelcomeRoute.page),
        AutoRoute(path: 'login', page: LoginRoute.page),
        AutoRoute(path: 'register', page: RegisterRoute.page),
      ],
    ),
    AutoRoute(
      path: '/logged',
      page: LoggedWrapperRoute.page,
      guards: [AuthGuard()],
      children: [
        AutoRoute(path: 'inicio', page: HomeRoute.page),
        AutoRoute(path: 'comunidad', page: PublicRoadmapsRoute.page),
        AutoRoute(path: 'personal', page: MyRoadmapsRoute.page),
        AutoRoute(path: 'crear', page: CreateRoute.page),
      ],
    ),
  ];
}    
// flutter pub run build_runner build --delete-conflicting-outputs