import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/network/model/response/movie_details_response/movie_details_response.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
import 'package:movies/screens/home/Tabs/home_tab/mappers/movie_details_mapper.dart';
import 'package:movies/screens/movie_details/data/movies_remote_data_source.dart';
import 'package:movies/screens/movie_details/repository/movies_details_repository.dart';
// import 'package:movies/screens/movie_details/mappers/movie_details_mapper.dart'; // Mapper جديد

@Injectable(as: MoviesDetailsRepository)
class MoviesDetailsRepositoryImpl implements MoviesDetailsRepository {
  final MoviesRemoteDataSource _remoteDataSource;
  final MovieDetailsMapper _mapper; // استخدمنا Mapper لتفاصيل فيلم واحد

  MoviesDetailsRepositoryImpl(this._remoteDataSource, this._mapper);

  @override
  Future<ApiResult<MovieEntity>> getMovieDetails(int movieId) async {
    try {
      final result = await _remoteDataSource.getMovieDetails(movieId);

      if (result is SuccessApiResult<MovieDetailsResponse>) {
        final movieEntity = _mapper.fromDetailsModel(
          result.data!.data!.movie!,
        ); // فيلم واحد
        return SuccessApiResult(movieEntity);
      } else if (result is ErrorApiResult) {
        return ErrorApiResult(result.getError);
      } else {
        return ErrorApiResult(UnKnownError("Something went wrong"));
      }
    } catch (e) {
      return ErrorApiResult(UnKnownError("Failed to fetch movie details"));
    }
  }
}
