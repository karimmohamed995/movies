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

import '../core/shared_pref_help/shared_pref_helper.dart' as _i983;
import '../features/auth/data/repos/auth/data_sources/auth_remote_data_source.dart'
    as _i107;
import '../features/auth/data/repos/auth/data_sources/auth_remote_data_source_impl.dart'
    as _i533;
import '../features/auth/data/repos/auth_repository_impl.dart' as _i473;
import '../features/auth/domain/repos/auth_repository.dart' as _i307;
import '../features/auth/domain/usecase/login_usecase.dart' as _i532;
import '../features/auth/domain/usecase/register_usecase.dart' as _i889;
import '../features/network/api/movies_services.dart' as _i596;
import '../features/network/api/yts_services.dart' as _i39;
import '../screens/home/Tabs/home_tab/cubit/home_tab_cubit.dart' as _i744;
import '../screens/home/Tabs/home_tab/data/home_repository/data_sources/home_remote_data_source.dart'
    as _i848;
import '../screens/home/Tabs/home_tab/data/home_repository/data_sources/home_remote_data_source_impl.dart'
    as _i450;
import '../screens/home/Tabs/home_tab/domain/repository/home_repository.dart'
    as _i936;
import '../screens/home/Tabs/home_tab/domain/repository/home_repository_impl.dart'
    as _i1;
import '../screens/home/Tabs/home_tab/domain/usecase/load_movies_usecase.dart'
    as _i581;
import '../screens/home/Tabs/home_tab/mappers/movie_details_mapper.dart'
    as _i72;
import '../screens/home/Tabs/home_tab/mappers/movie_mapper.dart' as _i557;
import '../screens/login/cubit/login_cubit.dart' as _i344;
import '../screens/movie_details/cubit/movie_details_cubit.dart' as _i360;
import '../screens/movie_details/cubit/similar_movies_cubit.dart' as _i525;
import '../screens/movie_details/data/movies_remote_data_source.dart' as _i589;
import '../screens/movie_details/data/movies_remote_data_source_impl.dart'
    as _i290;
import '../screens/movie_details/repository/movies_details_repository.dart'
    as _i817;
import '../screens/movie_details/repository/movies_details_repository_impl.dart'
    as _i158;
import '../screens/movie_details/repository/movies_repository.dart' as _i520;
import '../screens/movie_details/repository/movies_repository_impl.dart'
    as _i672;
import '../screens/movie_details/usecase/load_similar_movies_usecase.dart'
    as _i781;
import '../screens/movie_details/usecase/movie_details_usecase.dart' as _i381;
import '../screens/register/cubit/register_cubit.dart' as _i59;
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
    gh.factory<_i983.SharedPrefHelper>(() => _i983.SharedPrefHelper());
    gh.factory<_i557.MovieMapper>(() => _i557.MovieMapper());
    gh.factory<_i72.MovieDetailsMapper>(() => _i72.MovieDetailsMapper());
    gh.factory<_i596.MoviesServices>(
      () => _i596.MoviesServices.new(gh<_i361.Dio>()),
    );
    gh.factory<_i39.YtsServices>(() => _i39.YtsServices.new(gh<_i361.Dio>()));
    gh.factory<_i848.HomeRemoteDataSource>(
      () => _i450.HomeRemoteDataSourceImpl(gh<_i39.YtsServices>()),
    );
    gh.factory<_i107.AuthRemoteDataSource>(
      () => _i533.AuthRemoteDataSourceImpl(gh<_i596.MoviesServices>()),
    );
    gh.factory<_i589.MoviesRemoteDataSource>(
      () => _i290.MoviesRemoteDataSourceImpl(gh<_i39.YtsServices>()),
    );
    gh.factory<_i307.AuthRepository>(
      () => _i473.AuthRepositoryImpl(
        gh<_i107.AuthRemoteDataSource>(),
        gh<_i983.SharedPrefHelper>(),
      ),
    );
    gh.factory<_i936.HomeRepository>(
      () => _i1.HomeRepositoryImpl(
        gh<_i848.HomeRemoteDataSource>(),
        gh<_i557.MovieMapper>(),
      ),
    );
    gh.factory<_i817.MoviesDetailsRepository>(
      () => _i158.MoviesDetailsRepositoryImpl(
        gh<_i589.MoviesRemoteDataSource>(),
        gh<_i72.MovieDetailsMapper>(),
      ),
    );
    gh.factory<_i581.LoadMoviesUsecase>(
      () => _i581.LoadMoviesUsecase(gh<_i936.HomeRepository>()),
    );
    gh.factory<_i520.MoviesRepository>(
      () => _i672.MoviesRepositoryImpl(
        gh<_i589.MoviesRemoteDataSource>(),
        gh<_i557.MovieMapper>(),
      ),
    );
    gh.factory<_i889.RegisterUsecase>(
      () => _i889.RegisterUsecase(gh<_i307.AuthRepository>()),
    );
    gh.factory<_i532.LoginUsecase>(
      () => _i532.LoginUsecase(gh<_i307.AuthRepository>()),
    );
    gh.factory<_i381.MovieDetailsUsecase>(
      () => _i381.MovieDetailsUsecase(gh<_i817.MoviesDetailsRepository>()),
    );
    gh.factory<_i781.LoadSimilarMoviesUsecase>(
      () => _i781.LoadSimilarMoviesUsecase(gh<_i520.MoviesRepository>()),
    );
    gh.factory<_i525.SimilarMoviesCubit>(
      () => _i525.SimilarMoviesCubit(gh<_i781.LoadSimilarMoviesUsecase>()),
    );
    gh.factory<_i344.LoginCubit>(
      () => _i344.LoginCubit(gh<_i532.LoginUsecase>()),
    );
    gh.factory<_i360.MovieDetailsCubit>(
      () => _i360.MovieDetailsCubit(gh<_i381.MovieDetailsUsecase>()),
    );
    gh.factory<_i744.HomeTabCubit>(
      () => _i744.HomeTabCubit(gh<_i581.LoadMoviesUsecase>()),
    );
    gh.factory<_i59.RegisterCubit>(
      () => _i59.RegisterCubit(gh<_i889.RegisterUsecase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i320.GetItModule {}
