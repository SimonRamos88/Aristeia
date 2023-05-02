// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aristeia_app/features/configuration_screen.dart' as _i1;
import 'package:aristeia_app/features/create_block_screen.dart' as _i21;
import 'package:aristeia_app/features/create_resource_screen.dart' as _i22;
import 'package:aristeia_app/features/create_roadmap_screen.dart' as _i23;
import 'package:aristeia_app/features/edit_profile_screen.dart' as _i2;
import 'package:aristeia_app/features/home_screen.dart' as _i3;
import 'package:aristeia_app/features/logged_wrapper_screen.dart' as _i4;
import 'package:aristeia_app/features/login_screen.dart' as _i5;
import 'package:aristeia_app/features/my_roadmaps_screen.dart' as _i6;
import 'package:aristeia_app/features/public_roadmaps_screen.dart' as _i7;
import 'package:aristeia_app/features/register_screen.dart' as _i8;
import 'package:aristeia_app/features/router_pages/block_router_screen.dart'
    as _i9;
import 'package:aristeia_app/features/router_pages/comunidad_router_screen.dart'
    as _i10;
import 'package:aristeia_app/features/router_pages/config_router_screen.dart'
    as _i11;
import 'package:aristeia_app/features/router_pages/create_router_screen.dart'
    as _i20;
import 'package:aristeia_app/features/router_pages/home_router_screen.dart'
    as _i12;
import 'package:aristeia_app/features/router_pages/roadmap_router_screen.dart'
    as _i13;
import 'package:aristeia_app/features/router_pages/welcome_router_screen.dart'
    as _i14;
import 'package:aristeia_app/features/single_block_screen.dart' as _i15;
import 'package:aristeia_app/features/single_road_screen.dart' as _i16;
import 'package:aristeia_app/features/splash_screen.dart' as _i17;
import 'package:aristeia_app/features/unnavailable_roadmap_screen.dart' as _i18;
import 'package:aristeia_app/features/welcome_screen.dart' as _i19;
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    ConfigurationRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ConfigurationScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditProfileScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeScreen(key: args.key),
      );
    },
    LoggedWrapperRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoggedWrapperScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginScreen(key: args.key),
      );
    },
    MyRoadmapsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MyRoadmapsScreen(),
      );
    },
    PublicRoadmapsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PublicRoadmapsScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RegisterScreen(key: args.key),
      );
    },
    BlockRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.RoadmapRouterScreen(),
      );
    },
    ComunidadRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ComunidadRouterScreen(),
      );
    },
    ConfigRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ConfigRouterScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.HomeRouterScreen(),
      );
    },
    MisRoadmapsRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MisRoadmapsRouterScreen(),
      );
    },
    WelcomeRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WelcomeRouterScreen(),
      );
    },
    SingleBlockRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleBlockRouteArgs>(
          orElse: () =>
              SingleBlockRouteArgs(blockId: pathParams.getInt('blockId')));
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.SingleBlockScreen(
          key: args.key,
          blockId: args.blockId,
        ),
      );
    },
    SingleRoadRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleRoadRouteArgs>(
          orElse: () =>
              SingleRoadRouteArgs(roadId: pathParams.getInt('roadId')));
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.SingleRoadScreen(
          key: args.key,
          roadId: args.roadId,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SplashScreen(),
      );
    },
    UnnavailableRoadmapRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.UnnavailableRoadmapScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.WelcomeScreen(),
      );
    },
    CreateRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.CreateRouterScreen(),
      );
    },
    CreateBlockRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.CreateBlockScreen(),
      );
    },
    CreateResourceRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateResourceRouteArgs>(
          orElse: () =>
              CreateResourceRouteArgs(blockId: pathParams.getInt('blockId')));
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.CreateResourceScreen(
          key: args.key,
          blockId: args.blockId,
        ),
      );
    },
    CreateRoadmapRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.CreateRoadmapScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ConfigurationScreen]
class ConfigurationRoute extends _i24.PageRouteInfo<void> {
  const ConfigurationRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ConfigurationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfigurationRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditProfileScreen]
class EditProfileRoute extends _i24.PageRouteInfo<void> {
  const EditProfileRoute({List<_i24.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i24.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i24.PageInfo<HomeRouteArgs> page =
      _i24.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.LoggedWrapperScreen]
class LoggedWrapperRoute extends _i24.PageRouteInfo<void> {
  const LoggedWrapperRoute({List<_i24.PageRouteInfo>? children})
      : super(
          LoggedWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoggedWrapperRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i24.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i24.PageInfo<LoginRouteArgs> page =
      _i24.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.MyRoadmapsScreen]
class MyRoadmapsRoute extends _i24.PageRouteInfo<void> {
  const MyRoadmapsRoute({List<_i24.PageRouteInfo>? children})
      : super(
          MyRoadmapsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyRoadmapsRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PublicRoadmapsScreen]
class PublicRoadmapsRoute extends _i24.PageRouteInfo<void> {
  const PublicRoadmapsRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PublicRoadmapsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PublicRoadmapsRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RegisterScreen]
class RegisterRoute extends _i24.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i24.PageInfo<RegisterRouteArgs> page =
      _i24.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.RoadmapRouterScreen]
class BlockRouter extends _i24.PageRouteInfo<void> {
  const BlockRouter({List<_i24.PageRouteInfo>? children})
      : super(
          BlockRouter.name,
          initialChildren: children,
        );

  static const String name = 'BlockRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ComunidadRouterScreen]
class ComunidadRouter extends _i24.PageRouteInfo<void> {
  const ComunidadRouter({List<_i24.PageRouteInfo>? children})
      : super(
          ComunidadRouter.name,
          initialChildren: children,
        );

  static const String name = 'ComunidadRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ConfigRouterScreen]
class ConfigRouter extends _i24.PageRouteInfo<void> {
  const ConfigRouter({List<_i24.PageRouteInfo>? children})
      : super(
          ConfigRouter.name,
          initialChildren: children,
        );

  static const String name = 'ConfigRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomeRouterScreen]
class HomeRouter extends _i24.PageRouteInfo<void> {
  const HomeRouter({List<_i24.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MisRoadmapsRouterScreen]
class MisRoadmapsRouter extends _i24.PageRouteInfo<void> {
  const MisRoadmapsRouter({List<_i24.PageRouteInfo>? children})
      : super(
          MisRoadmapsRouter.name,
          initialChildren: children,
        );

  static const String name = 'MisRoadmapsRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i14.WelcomeRouterScreen]
class WelcomeRouter extends _i24.PageRouteInfo<void> {
  const WelcomeRouter({List<_i24.PageRouteInfo>? children})
      : super(
          WelcomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SingleBlockScreen]
class SingleBlockRoute extends _i24.PageRouteInfo<SingleBlockRouteArgs> {
  SingleBlockRoute({
    _i25.Key? key,
    required int blockId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          SingleBlockRoute.name,
          args: SingleBlockRouteArgs(
            key: key,
            blockId: blockId,
          ),
          rawPathParams: {'blockId': blockId},
          initialChildren: children,
        );

  static const String name = 'SingleBlockRoute';

  static const _i24.PageInfo<SingleBlockRouteArgs> page =
      _i24.PageInfo<SingleBlockRouteArgs>(name);
}

class SingleBlockRouteArgs {
  const SingleBlockRouteArgs({
    this.key,
    required this.blockId,
  });

  final _i25.Key? key;

  final int blockId;

  @override
  String toString() {
    return 'SingleBlockRouteArgs{key: $key, blockId: $blockId}';
  }
}

/// generated route for
/// [_i16.SingleRoadScreen]
class SingleRoadRoute extends _i24.PageRouteInfo<SingleRoadRouteArgs> {
  SingleRoadRoute({
    _i25.Key? key,
    required int roadId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          SingleRoadRoute.name,
          args: SingleRoadRouteArgs(
            key: key,
            roadId: roadId,
          ),
          rawPathParams: {'roadId': roadId},
          initialChildren: children,
        );

  static const String name = 'SingleRoadRoute';

  static const _i24.PageInfo<SingleRoadRouteArgs> page =
      _i24.PageInfo<SingleRoadRouteArgs>(name);
}

class SingleRoadRouteArgs {
  const SingleRoadRouteArgs({
    this.key,
    required this.roadId,
  });

  final _i25.Key? key;

  final int roadId;

  @override
  String toString() {
    return 'SingleRoadRouteArgs{key: $key, roadId: $roadId}';
  }
}

/// generated route for
/// [_i17.SplashScreen]
class SplashRoute extends _i24.PageRouteInfo<void> {
  const SplashRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.UnnavailableRoadmapScreen]
class UnnavailableRoadmapRoute extends _i24.PageRouteInfo<void> {
  const UnnavailableRoadmapRoute({List<_i24.PageRouteInfo>? children})
      : super(
          UnnavailableRoadmapRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnnavailableRoadmapRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.WelcomeScreen]
class WelcomeRoute extends _i24.PageRouteInfo<void> {
  const WelcomeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i20.CreateRouterScreen]
class CreateRouter extends _i24.PageRouteInfo<void> {
  const CreateRouter({List<_i24.PageRouteInfo>? children})
      : super(
          CreateRouter.name,
          initialChildren: children,
        );

  static const String name = 'CreateRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.CreateBlockScreen]
class CreateBlockRoute extends _i24.PageRouteInfo<void> {
  const CreateBlockRoute({List<_i24.PageRouteInfo>? children})
      : super(
          CreateBlockRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateBlockRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.CreateResourceScreen]
class CreateResourceRoute extends _i24.PageRouteInfo<CreateResourceRouteArgs> {
  CreateResourceRoute({
    _i25.Key? key,
    required int blockId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          CreateResourceRoute.name,
          args: CreateResourceRouteArgs(
            key: key,
            blockId: blockId,
          ),
          rawPathParams: {'blockId': blockId},
          initialChildren: children,
        );

  static const String name = 'CreateResourceRoute';

  static const _i24.PageInfo<CreateResourceRouteArgs> page =
      _i24.PageInfo<CreateResourceRouteArgs>(name);
}

class CreateResourceRouteArgs {
  const CreateResourceRouteArgs({
    this.key,
    required this.blockId,
  });

  final _i25.Key? key;

  final int blockId;

  @override
  String toString() {
    return 'CreateResourceRouteArgs{key: $key, blockId: $blockId}';
  }
}

/// generated route for
/// [_i23.CreateRoadmapScreen]
class CreateRoadmapRoute extends _i24.PageRouteInfo<void> {
  const CreateRoadmapRoute({List<_i24.PageRouteInfo>? children})
      : super(
          CreateRoadmapRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRoadmapRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}
