import 'package:auto_route/auto_route.dart';
import 'package:docdoc/core/injection/injection.dart';
import 'package:docdoc/features/auth/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: UnAuthenticatedRoute.page,
          initial: true,
          children: [
            CustomRoute(
              initial: true,
              page: OnBoardingRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: LoginRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500,
            ),
            CustomRoute(
              page: RegisterRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
          ],
        ),
      ];
}

@RoutePage(name: "UnAuthenticatedRoute")
class UnAuthenticated extends AutoRouter implements AutoRouteWrapper {
  const UnAuthenticated({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: this,
    );
  }
}
