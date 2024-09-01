// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:docdoc/core/injection/injection_module.dart' as _i537;
import 'package:docdoc/core/networking/api_service.dart' as _i774;
import 'package:docdoc/features/auth/cubits/auth_cubit.dart' as _i675;
import 'package:docdoc/features/auth/data/repo/auth_repo.dart' as _i1061;
import 'package:docdoc/features/auth/data/repo/auth_repo_impl.dart' as _i676;
import 'package:docdoc/settings/router/app_router.dart' as _i772;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.factory<_i361.Dio>(() => injectionModule.dioClient);
    gh.factory<_i774.ApiService>(() => injectionModule.apiService);
    gh.singleton<_i772.AppRouter>(() => injectionModule.appRouter);
    gh.lazySingleton<_i1061.AuthRepo>(
        () => _i676.AuthRepoImpl(gh<_i774.ApiService>()));
    gh.factory<_i675.AuthCubit>(() => _i675.AuthCubit(gh<_i1061.AuthRepo>()));
    return this;
  }
}

class _$InjectionModule extends _i537.InjectionModule {}
