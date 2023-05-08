// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aristeia_app/core/utils/router_pages/block_router_screen.dart'
    as _i1;
import 'package:aristeia_app/core/utils/router_pages/comunidad_router_screen.dart'
    as _i2;
import 'package:aristeia_app/core/utils/router_pages/config_router_screen.dart'
    as _i3;
import 'package:aristeia_app/core/utils/router_pages/create_router_screen.dart'
    as _i4;
import 'package:aristeia_app/core/utils/router_pages/home_router_screen.dart'
    as _i5;
import 'package:aristeia_app/core/utils/router_pages/roadmap_router_screen.dart'
    as _i6;
import 'package:aristeia_app/core/utils/router_pages/welcome_router_screen.dart'
    as _i7;
import 'package:aristeia_app/features/autenticacion/presentation/pages/logged_wrapper_screen.dart'
    as _i8;
import 'package:aristeia_app/features/autenticacion/presentation/pages/login_screen.dart'
    as _i9;
import 'package:aristeia_app/features/autenticacion/presentation/pages/register_screen.dart'
    as _i10;
import 'package:aristeia_app/features/autenticacion/presentation/pages/splash_screen.dart'
    as _i11;
import 'package:aristeia_app/features/autenticacion/presentation/pages/welcome_screen.dart'
    as _i12;
import 'package:aristeia_app/features/estadistica/presentation/pages/home_screen.dart'
    as _i13;
import 'package:aristeia_app/features/roadmap/presentation/pages/create_block_screen.dart'
    as _i14;
import 'package:aristeia_app/features/roadmap/presentation/pages/create_resource_screen.dart'
    as _i15;
import 'package:aristeia_app/features/roadmap/presentation/pages/create_roadmap_screen.dart'
    as _i16;
import 'package:aristeia_app/features/roadmap/presentation/pages/my_roadmaps_screen.dart'
    as _i17;
import 'package:aristeia_app/features/roadmap/presentation/pages/public_roadmaps_screen.dart'
    as _i18;
import 'package:aristeia_app/features/roadmap/presentation/pages/single_block_screen.dart'
    as _i19;
import 'package:aristeia_app/features/roadmap/presentation/pages/single_road_screen.dart'
    as _i20;
import 'package:aristeia_app/features/roadmap/presentation/pages/unnavailable_roadmap_screen.dart'
    as _i21;
import 'package:aristeia_app/features/usuario/presentation/pages/configuration_screen.dart'
    as _i22;
import 'package:aristeia_app/features/usuario/presentation/pages/edit_profile_screen.dart'
    as _i23;
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    BlockRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.RoadmapRouterScreen(),
      );
    },
    ComunidadRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ComunidadRouterScreen(),
      );
    },
    ConfigRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ConfigRouterScreen(),
      );
    },
    CreateRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateRouterScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeRouterScreen(),
      );
    },
    MisRoadmapsRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MisRoadmapsRouterScreen(),
      );
    },
    WelcomeRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WelcomeRouterScreen(),
      );
    },
    LoggedWrapperRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoggedWrapperScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.LoginScreen(key: args.key),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.RegisterScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.WelcomeScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.HomeScreen(),
      );
    },
    CreateBlockRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateBlockRouteArgs>(
          orElse: () =>
              CreateBlockRouteArgs(roadId: pathParams.getInt('roadId')));
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.CreateBlockScreen(
          key: args.key,
          roadId: args.roadId,
        ),
      );
    },
    CreateResourceRoute.name: (routeData) {
      final args = routeData.argsAs<CreateResourceRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.CreateResourceScreen(
          key: args.key,
          roadId: args.roadId,
          blockId: args.blockId,
        ),
      );
    },
    CreateRoadmapRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.CreateRoadmapScreen(),
      );
    },
    MyRoadmapsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.MyRoadmapsScreen(),
      );
    },
    PublicRoadmapsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.PublicRoadmapsScreen(),
      );
    },
    SingleBlockRoute.name: (routeData) {
      final args = routeData.argsAs<SingleBlockRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.SingleBlockScreen(
          key: args.key,
          blockId: args.blockId,
          roadId: args.roadId,
          isMyRoadmap: args.isMyRoadmap,
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
        child: _i20.SingleRoadScreen(
          key: args.key,
          roadId: args.roadId,
        ),
      );
    },
    UnnavailableRoadmapRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.UnnavailableRoadmapScreen(),
      );
    },
    ConfigurationRoute.name: (routeData) {
      final args = routeData.argsAs<ConfigurationRouteArgs>(
          orElse: () => const ConfigurationRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.ConfigurationScreen(key: args.key),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>(
          orElse: () => const EditProfileRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.EditProfileScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.RoadmapRouterScreen]
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
/// [_i2.ComunidadRouterScreen]
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
/// [_i3.ConfigRouterScreen]
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
/// [_i4.CreateRouterScreen]
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
/// [_i5.HomeRouterScreen]
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
/// [_i6.MisRoadmapsRouterScreen]
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
/// [_i7.WelcomeRouterScreen]
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
/// [_i8.LoggedWrapperScreen]
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
/// [_i9.LoginScreen]
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
/// [_i10.RegisterScreen]
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
/// [_i11.SplashScreen]
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
/// [_i12.WelcomeScreen]
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
/// [_i13.HomeScreen]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CreateBlockScreen]
class CreateBlockRoute extends _i24.PageRouteInfo<CreateBlockRouteArgs> {
  CreateBlockRoute({
    _i25.Key? key,
    required int roadId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          CreateBlockRoute.name,
          args: CreateBlockRouteArgs(
            key: key,
            roadId: roadId,
          ),
          rawPathParams: {'roadId': roadId},
          initialChildren: children,
        );

  static const String name = 'CreateBlockRoute';

  static const _i24.PageInfo<CreateBlockRouteArgs> page =
      _i24.PageInfo<CreateBlockRouteArgs>(name);
}

class CreateBlockRouteArgs {
  const CreateBlockRouteArgs({
    this.key,
    required this.roadId,
  });

  final _i25.Key? key;

  final int roadId;

  @override
  String toString() {
    return 'CreateBlockRouteArgs{key: $key, roadId: $roadId}';
  }
}

/// generated route for
/// [_i15.CreateResourceScreen]
class CreateResourceRoute extends _i24.PageRouteInfo<CreateResourceRouteArgs> {
  CreateResourceRoute({
    _i25.Key? key,
    required int roadId,
    required int blockId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          CreateResourceRoute.name,
          args: CreateResourceRouteArgs(
            key: key,
            roadId: roadId,
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
    required this.roadId,
    required this.blockId,
  });

  final _i25.Key? key;

  final int roadId;

  final int blockId;

  @override
  String toString() {
    return 'CreateResourceRouteArgs{key: $key, roadId: $roadId, blockId: $blockId}';
  }
}

/// generated route for
/// [_i16.CreateRoadmapScreen]
class CreateRoadmapRoute extends _i24.PageRouteInfo<void> {
  const CreateRoadmapRoute({List<_i24.PageRouteInfo>? children})
      : super(
          CreateRoadmapRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRoadmapRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.MyRoadmapsScreen]
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
/// [_i18.PublicRoadmapsScreen]
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
/// [_i19.SingleBlockScreen]
class SingleBlockRoute extends _i24.PageRouteInfo<SingleBlockRouteArgs> {
  SingleBlockRoute({
    _i25.Key? key,
    required int blockId,
    required int roadId,
    bool isMyRoadmap = false,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          SingleBlockRoute.name,
          args: SingleBlockRouteArgs(
            key: key,
            blockId: blockId,
            roadId: roadId,
            isMyRoadmap: isMyRoadmap,
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
    required this.roadId,
    this.isMyRoadmap = false,
  });

  final _i25.Key? key;

  final int blockId;

  final int roadId;

  final bool isMyRoadmap;

  @override
  String toString() {
    return 'SingleBlockRouteArgs{key: $key, blockId: $blockId, roadId: $roadId, isMyRoadmap: $isMyRoadmap}';
  }
}

/// generated route for
/// [_i20.SingleRoadScreen]
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
/// [_i21.UnnavailableRoadmapScreen]
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
/// [_i22.ConfigurationScreen]
class ConfigurationRoute extends _i24.PageRouteInfo<ConfigurationRouteArgs> {
  ConfigurationRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ConfigurationRoute.name,
          args: ConfigurationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ConfigurationRoute';

  static const _i24.PageInfo<ConfigurationRouteArgs> page =
      _i24.PageInfo<ConfigurationRouteArgs>(name);
}

class ConfigurationRouteArgs {
  const ConfigurationRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'ConfigurationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.EditProfileScreen]
class EditProfileRoute extends _i24.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i24.PageInfo<EditProfileRouteArgs> page =
      _i24.PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key}';
  }
}
