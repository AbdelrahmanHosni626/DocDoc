import 'package:dio/dio.dart';
import 'package:docdoc/features/auth/data/models/login_request_body.dart';
import 'package:docdoc/features/auth/data/models/login_response.dart';
import 'package:docdoc/features/auth/data/models/register_request_body.dart';
import 'package:docdoc/features/auth/data/models/register_response.dart';
import 'package:retrofit/http.dart';

import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.register)
  Future<RegisterResponse> register(
    @Body() RegisterRequestBody registerRequestBody,
  );
}
