import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/core/shared_pref_help/shared_pref_helper.dart';
import 'package:movies/features/auth/data/repos/auth/data_sources/auth_remote_data_source.dart';
import 'package:movies/features/auth/domain/repos/auth_repository.dart';
import 'package:movies/features/network/model/request/login_request/login_request.dart';
import 'package:movies/features/network/model/request/register_request/register_request.dart';
import 'package:movies/features/network/model/response/register_response/register_response.dart';
import 'package:movies/features/network/model/response/token_response/token_response.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  final SharedPrefHelper _prefHelper;

  AuthRepositoryImpl(this._remoteDataSource, this._prefHelper);

  @override
  Future<ApiResult<void>> login(LoginRequest request) async {
    ApiResult<TokenResponse> apiReslut = await _remoteDataSource.login(request);
    if (apiReslut is SuccessApiResult) {
      // _prefHelper.saveUser(apiReslut.getData.user!);
      // _prefHelper.saveToken(apiReslut.getData.token!);
      return SuccessApiResult(null);
    } else {
      return apiReslut;
    }
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest request) async {
    ApiResult<RegisterResponse> apiReslut = await _remoteDataSource.register(
      request,
    );
    if (apiReslut is SuccessApiResult) {
      return SuccessApiResult(null);
    } else {
      return apiReslut;
    }
  }
}
