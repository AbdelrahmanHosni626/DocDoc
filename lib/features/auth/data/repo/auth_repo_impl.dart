import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/features/auth/data/models/login_request_body.dart';
import 'package:docdoc/features/auth/data/models/login_response.dart';
import 'package:docdoc/features/auth/data/models/register_request_body.dart';
import 'package:docdoc/features/auth/data/models/register_response.dart';
import 'package:docdoc/features/auth/data/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  Future<ApiResult<LoginResponse>> login(
      {required LoginRequestBody loginRequestBody}) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<RegisterResponse>> register(
      {required RegisterRequestBody registerRequestBody}) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
