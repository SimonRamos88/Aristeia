import 'package:aristeia_app/core/routes/route_guard.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/routes/router_pages/comunidad_router_screen.dart';
import 'package:aristeia_app/main.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

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
      //guards: [AuthGuard()],
      children: [
        AutoRoute(
          path: '',
          page: HomeRoute.page,
          // children: [
          //   AutoRoute(path: '', page: HomeRoute.page),
          //   AutoRoute(path: '/config', page: ConfigurationRoute.page),
          // ]
        ),
        AutoRoute(
          path: 'comunidad',
          page: ComunidadRouter.page,
          children: [
            AutoRoute(path: '', page: PublicRoadmapsRoute.page),
            AutoRoute(path: ':roadId', page: BlockRouter.page, children: [
              AutoRoute(path: '', page: SingleRoadRoute.page),
              AutoRoute(path: ':blockId', page: SingleBlockRoute.page),
            ]),
          ],
        ),
        AutoRoute(
          path: 'personal',
          page: MisRoadmapsRouter.page,
          children: [
            AutoRoute(path: '', page: MyRoadmapsRoute.page),
            AutoRoute(path: ':roadId', page: BlockRouter.page, children: [
              AutoRoute(path: '', page: SingleRoadRoute.page),
              AutoRoute(path: 'editar', page: EditRouter.page, children: [
                AutoRoute(path: ':roadId', page: EditRoadmapRoute.page),
              ]),
              AutoRoute(path: ':blockId', page: SingleBlockRoute.page),
            ]),
          ],
        ),
        AutoRoute(path: 'crear', page: CreateRouter.page, children: [
          AutoRoute(path: '', page: CreateRoadmapRoute.page),
          AutoRoute(path: ':roadId', page: CreateBlockRoute.page),
          AutoRoute(path: ':blockId', page: CreateResourceRoute.page),
        ]),
      ],
    ),
    // AutoRoute(path: '/editar', page: EditRouter.page, children: [
    //   AutoRoute(path: ':roadId', page: EditRoadmapRoute.page),
    // ]),
    AutoRoute(path: '/config', page: ConfigRouter.page, children: [
      AutoRoute(path: '', page: ConfigurationRoute.page),
      AutoRoute(path: 'edit', page: EditProfileRoute.page),
    ]),
    // AutoRoute(path: '/nuevo', page: ConfigRouter.page, children: [
    //   AutoRoute(path: 'bloque', page: ConfigurationRoute.page),
    //   AutoRoute(path: 'edit', page: EditProfileRoute.page),
    // ]),
  ];
}    
// flutter pub run build_runner build --delete-conflicting-outputs