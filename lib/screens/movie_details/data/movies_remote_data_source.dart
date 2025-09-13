import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/network/model/response/movie_details_response/movie_details_response.dart';
import 'package:movies/features/network/model/response/movie_response/movie_dm.dart';

abstract class MoviesRemoteDataSource {
  Future<ApiResult<List<MovieDm>>> getSimilarMovies(int movieId);
  Future<ApiResult<MovieDetailsResponse>> getMovieDetails(int movieId);
}
