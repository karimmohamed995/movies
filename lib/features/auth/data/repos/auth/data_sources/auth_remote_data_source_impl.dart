import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/auth/data/repos/auth/data_sources/auth_remote_data_source.dart';
import 'package:movies/features/network/api/movies_services.dart';
import 'package:movies/features/network/model/request/login_request/login_request.dart';
import 'package:movies/features/network/model/request/register_request/register_request.dart';
import 'package:movies/features/network/model/response/token_response/token_response.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final MoviesServices _apiServices;
  AuthRemoteDataSourceImpl(this._apiServices);

  @override
  Future<ApiResult<TokenResponse>> login(LoginRequest request) async {
    try {
      return SuccessApiResult(await _apiServices.login(request));
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }

  @override
  Future<ApiResult<TokenResponse>> register(RegisterRequest request) async {
    try {
      return SuccessApiResult(await _apiServices.register(request));
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }
}
