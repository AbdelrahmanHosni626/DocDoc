import 'package:docdoc/features/auth/cubits/auth_state.dart';
import 'package:docdoc/features/auth/data/models/login_request_body.dart';
import 'package:docdoc/features/auth/data/models/register_request_body.dart';
import 'package:docdoc/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(const AuthState.initial());

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const AuthState.loading());
    final result = await _authRepo.login(loginRequestBody: loginRequestBody);
    result.when(
      success: (loginResponse) {
        emit(AuthState.success(loginResponse));
      },
      failure: (failure) {
        emit(
            AuthState.failure(errMessage: failure.apiErrorModel.message ?? ''));
      },
    );
  }

  void emitRegisterStates(RegisterRequestBody registerRequestBody) async {
    emit(const AuthState.loading());
    final result =
        await _authRepo.register(registerRequestBody: registerRequestBody);
    result.when(
      success: (registerResponse) {
        emit(AuthState.success(registerResponse));
      },
      failure: (failure) {
        emit(
            AuthState.failure(errMessage: failure.apiErrorModel.message ?? ''));
      },
    );
  }
}
