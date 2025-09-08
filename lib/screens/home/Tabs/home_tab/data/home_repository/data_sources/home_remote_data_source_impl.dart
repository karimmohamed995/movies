import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/network/api/yts_services.dart';
import 'package:movies/features/network/model/response/movie_response/movie_response.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/home_repository/data_sources/home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final YtsServices _ytsServices;

  HomeRemoteDataSourceImpl(this._ytsServices);

  @override
  Future<ApiResult<MovieResponse>> getMovies() async {
    try {
      var moviesResponse = await _ytsServices.getMovies();
      return SuccessApiResult(moviesResponse);
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }
}
