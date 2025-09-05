import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/auth/domain/usecase/register_usecase.dart';
import 'package:movies/features/network/model/request/register_request/register_request.dart';
import 'package:movies/screens/register/cubit/register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase _registerUsecase;

  RegisterCubit(this._registerUsecase) : super(RegisterState.initial());
  Future<void> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
    int avatarId,
  ) async {
    var request = RegisterRequest(
      name: name,
      email: email,
      password: password,
      confirmPassword: rePassword,
      phone: phone,
      avaterId: avatarId,
    );
    emit(RegisterState(registerApi: LoadingApiResult()));
    ApiResult<void> response = await _registerUsecase(request);
    emit(RegisterState(registerApi: response));
  }
}
