import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';

class MovieDetailsStates {
  late ApiResult<MovieEntity> movieDetailsState;

  MovieDetailsStates({required this.movieDetailsState});

  MovieDetailsStates.initial() {
    movieDetailsState = InitialApiResult();
  }
}
