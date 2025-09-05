import 'package:movies/core/api_result/api_result.dart';

class RegisterState {
  late ApiResult<void> registerApi;

  RegisterState.initial() {
    registerApi = InitialApiResult();
  }
  RegisterState({required this.registerApi});
}
