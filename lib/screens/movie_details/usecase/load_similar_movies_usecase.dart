import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
import 'package:movies/screens/movie_details/repository/movies_repository.dart';

@injectable
class LoadSimilarMoviesUsecase {
  final MoviesRepository _moviesRepository;
  LoadSimilarMoviesUsecase(this._moviesRepository);

  Future<ApiResult<List<MovieEntity>>> call(int movieId) {
    return _moviesRepository.getSimilarMovies(movieId);
  }
}
