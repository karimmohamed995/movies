import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/network/model/response/movie_response/movie_dm.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';

abstract class HomeRepository {
  Future<ApiResult<List<MovieEntity>>> getMovies();
}
