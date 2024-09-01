import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/settings/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectionModule {
  @singleton
  AppRouter get appRouter => AppRouter();

  @factory
  Dio get dioClient => Dio();

  @factory
  ApiService get apiService => ApiService(dioClient);
}
