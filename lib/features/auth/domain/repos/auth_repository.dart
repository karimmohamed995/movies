import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/network/model/request/login_request/login_request.dart';
import 'package:movies/features/network/model/request/register_request/register_request.dart';

abstract class AuthRepository {
  Future<ApiResult<void>> login(LoginRequest request);
  Future<ApiResult<void>> register(RegisterRequest request);
}

// import 'package:movies/core/api_result/api_result.dart';
// import 'package:movies/features/network/model/request/login_request/login_request.dart';
// import 'package:movies/features/network/model/request/register_request/register_request.dart';
// import 'package:movies/features/network/model/response/token_response/token_response.dart';

// abstract class AuthRepository {
//   Future<ApiResult<TokenResponse>> login(LoginRequest request);
//   Future<ApiResult<TokenResponse>> register(RegisterRequest request);
// }
