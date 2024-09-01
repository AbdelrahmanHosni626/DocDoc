// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:docdoc/features/auth/ui/screens/login_screen.dart' as _i1;
import 'package:docdoc/features/auth/ui/screens/sign_up_screen.dart' as _i3;
import 'package:docdoc/features/on_bording/on_bording_screen.dart' as _i2;
import 'package:docdoc/settings/router/app_router.dart' as _i4;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.OnBoardingScreen]
class OnBoardingRoute extends _i5.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i5.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i4.UnAuthenticated]
class UnAuthenticatedRoute extends _i5.PageRouteInfo<void> {
  const UnAuthenticatedRoute({List<_i5.PageRouteInfo>? children})
      : super(
          UnAuthenticatedRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnAuthenticatedRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.WrappedRoute(child: const _i4.UnAuthenticated());
    },
  );
}
