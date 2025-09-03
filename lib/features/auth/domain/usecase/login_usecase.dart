import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/auth/domain/repos/auth_repository.dart';
import 'package:movies/features/network/model/request/login_request/login_request.dart';

@injectable
class LoginUsecase {
  final AuthRepository _authRepository;
  LoginUsecase(this._authRepository);

  Future<ApiResult<void>> call(LoginRequest request) =>
      _authRepository.login(request);
}
