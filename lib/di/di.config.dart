// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/auth/data/repos/auth/data_sources/auth_remote_data_source.dart'
    as _i107;
import '../features/auth/data/repos/auth/data_sources/auth_remote_data_source_impl.dart'
    as _i533;
import '../features/auth/data/repos/auth_repository_impl.dart' as _i473;
import '../features/auth/domain/repos/auth_repository.dart' as _i307;
import '../features/auth/domain/usecase/login_usecase.dart' as _i532;
import '../features/network/api/movies_services.dart' as _i596;
import '../screens/login/cubit/login_cubit.dart' as _i344;
import 'get_it_modules.dart' as _i320;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i361.Dio>(() => getItModule.getDio());
    gh.factory<_i596.MoviesServices>(
      () => _i596.MoviesServices.new(gh<_i361.Dio>()),
    );
    gh.factory<_i107.AuthRemoteDataSource>(
      () => _i533.AuthRemoteDataSourceImpl(gh<_i596.MoviesServices>()),
    );
    gh.factory<_i307.AuthRepository>(
      () => _i473.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()),
    );
    gh.factory<_i532.LoginUsecase>(
      () => _i532.LoginUsecase(gh<_i307.AuthRepository>()),
    );
    gh.factory<_i344.LoginCubit>(
      () => _i344.LoginCubit(gh<_i532.LoginUsecase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i320.GetItModule {}
