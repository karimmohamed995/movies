import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/network/model/response/movie_details_response/movie_details_response.dart';
import 'package:movies/features/network/model/response/movie_response/movie_dm.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
// import 'package:movies/screens/home/Tabs/home_tab/data/movie_mapper.dart';
import 'package:movies/screens/home/Tabs/home_tab/mappers/movie_mapper.dart';
import 'package:movies/screens/movie_details/data/movies_remote_data_source.dart';
import 'package:movies/screens/movie_details/repository/movies_repository.dart';

@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource _remoteDataSource;
  final MovieMapper _mapper;

  MoviesRepositoryImpl(this._remoteDataSource, this._mapper);

  @override
  Future<ApiResult<List<MovieEntity>>> getSimilarMovies(int movieId) async {
    try {
      final result = await _remoteDataSource.getSimilarMovies(movieId);

      if (result is SuccessApiResult<List<MovieDm>>) {
        final movies = result.data; // 👈 دي List<MovieDm> مش MovieResponse
        final entities = _mapper.fromDataModels(movies!);
        return SuccessApiResult(entities);
      } else if (result is ErrorApiResult) {
        return ErrorApiResult(result.getError);
      } else {
        return ErrorApiResult(UnKnownError("something went wrong"));
      }
    } catch (e) {
      return ErrorApiResult(UnKnownError("something went wrong"));
    }
  }
}
