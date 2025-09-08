import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/network/model/response/movie_response/movie_response.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<MovieResponse>> getMovies();
}
