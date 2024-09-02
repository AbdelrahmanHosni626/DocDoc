import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:docdoc/core/injection/injection.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:docdoc/core/networking/api_status_codes.dart';
import 'package:docdoc/core/networking/dio_log_interceptor.dart';
import 'package:flutter/foundation.dart';

abstract class DioFactory {
  final Dio dioClient;

  DioFactory({required this.dioClient}) {
    // Fix for dio handshake error
    (dioClient.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final dioClient = HttpClient();
      dioClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return dioClient;
    };
    // dio validation
    dioClient.options
      ..baseUrl = ApiConstants.apiBaseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < ApiStatusCodes.internalServerError;
      };
    if (kDebugMode) {
      dioClient.interceptors.add(getIt<DioLogInterceptor>());
    }
  }
}
