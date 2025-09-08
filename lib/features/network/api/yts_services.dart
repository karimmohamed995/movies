import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/network/model/response/movie_response/movie_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'yts_services.g.dart';

@RestApi(baseUrl: 'https://yts.mx/api/v2/')
@injectable
abstract class YtsServices {
  @factoryMethod
  factory YtsServices(Dio dio) = _YtsServices;

  /// GET Movies List
  /// Example: https://yts.mx/api/v2/list_movies.json?limit=20&page=1
  @GET('list_movies.json')
  Future<MovieResponse> getMovies({
    @Query("limit") int limit = 20,
    @Query("page") int page = 1,
    @Query("minimum_rating") int? minRating,
    @Query("query_term") String? search,
    @Query("genre") String? genre,
  });
}
