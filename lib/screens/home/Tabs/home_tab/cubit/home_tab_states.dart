import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';

class HomeTabStates {
  late ApiResult<List<MovieEntity>> moviesState;

  HomeTabStates({required this.moviesState});

  HomeTabStates.initial() {
    moviesState = InitialApiResult();
  }
}
