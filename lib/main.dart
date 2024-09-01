import 'dart:async';

import 'package:docdoc/core/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'bloc_observer.dart';
import 'doc_app.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
  ]);
  configureDependencies();
  print(GetIt.instance.allReadySync()); // Print all registered services
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const DocDocApp());
  });
}
