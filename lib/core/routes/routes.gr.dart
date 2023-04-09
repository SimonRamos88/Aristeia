// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aristeia_app/features/create_screen.dart' as _i8;
import 'package:aristeia_app/features/home_screen.dart' as _i1;
import 'package:aristeia_app/features/logged_wrapper_screen.dart' as _i9;
import 'package:aristeia_app/features/login_screen.dart' as _i2;
import 'package:aristeia_app/features/my_roadmaps_screen.dart' as _i3;
import 'package:aristeia_app/features/public_roadmaps_screen.dart' as _i4;
import 'package:aristeia_app/features/register_screen.dart' as _i5;
import 'package:aristeia_app/features/splash_screen.dart' as _i6;
import 'package:aristeia_app/features/welcome_router_screen.dart' as _i10;
import 'package:aristeia_app/features/welcome_screen.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    MyRoadmapsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MyRoadmapsScreen(),
      );
    },
    PublicRoadmapsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PublicRoadmapsScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.WelcomeScreen(),
      );
    },
    CreateRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CreateScreen(),
      );
    },
    LoggedWrapperRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoggedWrapperScreen(),
      );
    },
    WelcomeRouter.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WelcomeRouterScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MyRoadmapsScreen]
class MyRoadmapsRoute extends _i11.PageRouteInfo<void> {
  const MyRoadmapsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MyRoadmapsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyRoadmapsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PublicRoadmapsScreen]
class PublicRoadmapsRoute extends _i11.PageRouteInfo<void> {
  const PublicRoadmapsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PublicRoadmapsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PublicRoadmapsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WelcomeScreen]
class WelcomeRoute extends _i11.PageRouteInfo<void> {
  const WelcomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CreateScreen]
class CreateRoute extends _i11.PageRouteInfo<void> {
  const CreateRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoggedWrapperScreen]
class LoggedWrapperRoute extends _i11.PageRouteInfo<void> {
  const LoggedWrapperRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoggedWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoggedWrapperRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.WelcomeRouterScreen]
class WelcomeRouter extends _i11.PageRouteInfo<void> {
  const WelcomeRouter({List<_i11.PageRouteInfo>? children})
      : super(
          WelcomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRouter';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
