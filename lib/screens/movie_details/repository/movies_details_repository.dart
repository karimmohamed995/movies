import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';

// abstract class MoviesDetailsRepository {
//   Future<ApiResult<List<MovieEntity>>> getMovieDetails(int movieId);
// }

abstract class MoviesDetailsRepository {
  Future<ApiResult<MovieEntity>> getMovieDetails(int movieId);
}
