import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/network/model/response/movie_response/movie_dm.dart';
import 'package:movies/features/network/model/response/movie_response/movie_response.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/home_repository/data_sources/home_remote_data_source.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
import 'package:movies/screens/home/Tabs/home_tab/domain/repository/home_repository.dart';
import 'package:movies/screens/home/Tabs/home_tab/mappers/movie_mapper.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final MovieMapper _mapper;

  HomeRepositoryImpl(this._remoteDataSource, this._mapper);

  @override
  Future<ApiResult<List<MovieEntity>>> getMovies() async {
    try {
      ApiResult<MovieResponse> result = await _remoteDataSource.getMovies();
      if (result.hasData) {
        return SuccessApiResult(
          _mapper.fromDataModels(result.getData.data.movies),
        );
      } else {
        return ErrorApiResult(result.getError);
      }
    } catch (e) {
      return ErrorApiResult(UnKnownError("something went wrong"));
    }
  }
}
