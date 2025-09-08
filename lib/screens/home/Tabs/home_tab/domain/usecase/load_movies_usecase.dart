import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
import 'package:movies/screens/home/Tabs/home_tab/domain/repository/home_repository.dart';

@injectable
class LoadMoviesUsecase {
  final HomeRepository _homeRepository;
  LoadMoviesUsecase(this._homeRepository);
  Future<ApiResult<List<MovieEntity>>> call() => _homeRepository.getMovies();
}
