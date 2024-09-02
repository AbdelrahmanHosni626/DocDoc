// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:docdoc/features/auth/ui/screens/login_screen.dart' as _i3;
import 'package:docdoc/features/auth/ui/screens/sign_up_screen.dart' as _i5;
import 'package:docdoc/features/home/ui/screens/home_screen.dart' as _i2;
import 'package:docdoc/features/on_bording/on_bording_screen.dart' as _i4;
import 'package:docdoc/settings/router/app_router.dart' as _i1;

/// generated route for
/// [_i1.Authenticated]
class AuthenticatedRoute extends _i6.PageRouteInfo<void> {
  const AuthenticatedRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthenticatedRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.Authenticated();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.OnBoardingScreen]
class OnBoardingRoute extends _i6.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i1.UnAuthenticated]
class UnAuthenticatedRoute extends _i6.PageRouteInfo<void> {
  const UnAuthenticatedRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UnAuthenticatedRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnAuthenticatedRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.WrappedRoute(child: const _i1.UnAuthenticated());
    },
  );
}
