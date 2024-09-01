import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/auth/data/models/login_request_body.dart';
import 'package:docdoc/features/auth/data/models/login_response.dart';
import 'package:docdoc/features/auth/data/models/register_request_body.dart';
import 'package:docdoc/features/auth/data/models/register_response.dart';

abstract class AuthRepo {
  Future<ApiResult<LoginResponse>> login(
      {required LoginRequestBody loginRequestBody});

  Future<ApiResult<RegisterResponse>> register(
      {required RegisterRequestBody registerRequestBody});
}
