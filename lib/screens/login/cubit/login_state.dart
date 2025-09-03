import 'package:movies/core/api_result/api_result.dart';

class LoginState {
  late ApiResult<void> loginApi;

  LoginState.initial() {
    loginApi = InitialApiResult();
  }
  LoginState({required this.loginApi});
}
