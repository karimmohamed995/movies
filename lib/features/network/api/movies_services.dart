import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/network/model/request/login_request/login_request.dart';
import 'package:movies/features/network/model/request/register_request/register_request.dart';
import 'package:movies/features/network/model/response/movie_response/movie_response.dart';
import 'package:movies/features/network/model/response/register_response/register_response.dart';
import 'package:movies/features/network/model/response/token_response/token_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'movies_services.g.dart';

@RestApi(baseUrl: 'https://route-movie-apis.vercel.app/')
@injectable
abstract class MoviesServices {
  @factoryMethod
  factory MoviesServices(Dio dio) = _MoviesServices;

  @POST('auth/login')
  Future<TokenResponse> login(@Body() LoginRequest request);

  @POST('auth/register')
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  // @GET('list_movies.json')

  // // https://yts.mx/api/v2/list_movies.json

  // Future<MovieResponse> movies();
}
