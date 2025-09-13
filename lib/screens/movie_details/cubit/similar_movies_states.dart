import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';

class SimilarMoviesStates {
  late ApiResult<List<MovieEntity>> similarMoviesState;

  SimilarMoviesStates({required this.similarMoviesState});

  SimilarMoviesStates.initial() {
    similarMoviesState = InitialApiResult();
  }
}
