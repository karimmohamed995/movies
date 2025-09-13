import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
// import 'package:movies/features/network/model/response/movie_details_response/movie_details_response.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
import 'package:movies/screens/movie_details/repository/movies_details_repository.dart';
// import 'package:movies/screens/movie_details/repository/movies_repository.dart';

@injectable
class MovieDetailsUsecase {
  final MoviesDetailsRepository _moviesDetailsRepository;
  MovieDetailsUsecase(this._moviesDetailsRepository);
  Future<ApiResult<MovieEntity>> call(int movieId) {
    return _moviesDetailsRepository.getMovieDetails(movieId);
  }
}
