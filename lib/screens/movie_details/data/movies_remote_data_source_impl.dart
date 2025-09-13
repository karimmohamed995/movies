import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
// import 'package:movies/core/errors.dart';
import 'package:movies/features/network/api/yts_services.dart';
import 'package:movies/features/network/model/response/movie_details_response/movie_details_response.dart';
import 'package:movies/features/network/model/response/movie_response/movie_dm.dart';
import 'package:movies/features/network/model/response/movie_response/movie_response.dart';
import 'package:movies/screens/movie_details/data/movies_remote_data_source.dart';

@Injectable(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final YtsServices _ytsServices;

  MoviesRemoteDataSourceImpl(this._ytsServices);

  @override
  Future<ApiResult<List<MovieDm>>> getSimilarMovies(int movieId) async {
    try {
      //  استدعاء الـ endpoint
      final MovieResponse response = await _ytsServices.getMovieSuggestions(
        movieId,
      );

      /// لو مفيش أفلام هرجع ليست فاضية
      final movies = response.data?.movies ?? [];

      return SuccessApiResult(movies);
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }

  @override
  Future<ApiResult<MovieDetailsResponse>> getMovieDetails(int movieId) async {
    try {
      final response = await _ytsServices.getMovieDetails(
        movieId,
        true, // with_images
        true, // with_cast
      );
      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }
}
