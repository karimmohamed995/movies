import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';

abstract class MoviesRepository {
  Future<ApiResult<List<MovieEntity>>> getSimilarMovies(int movieId);
}
