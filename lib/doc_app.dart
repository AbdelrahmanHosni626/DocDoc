import 'package:auto_route/auto_route.dart';
import 'package:docdoc/core/injection/injection.dart';
import 'package:docdoc/route_observer.dart';
import 'package:docdoc/settings/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocDocApp extends StatelessWidget {
  const DocDocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          );
        },
        routerConfig: getIt<AppRouter>().config(
          navigatorObservers: () => [
            MyRouteObserver(),
            AutoRouteObserver(),
          ],
        ),
      ),
    );
  }
}
