import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/auth/domain/usecase/login_usecase.dart';
import 'package:movies/features/network/model/request/login_request/login_request.dart';
import 'package:movies/screens/login/cubit/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;

  LoginCubit(this._loginUsecase) : super(LoginState.initial());
  Future<void> login(String email, String password) async {
    var request = LoginRequest(email: email, password: password);
    emit(LoginState(loginApi: LoadingApiResult()));
    ApiResult<void> response = await _loginUsecase(request);
    emit(LoginState(loginApi: response));
  }
}
