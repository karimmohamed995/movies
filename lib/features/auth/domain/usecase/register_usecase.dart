import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/features/auth/domain/repos/auth_repository.dart';
import 'package:movies/features/network/model/request/register_request/register_request.dart';

@injectable
class RegisterUsecase {
  final AuthRepository _authRepository;
  RegisterUsecase(this._authRepository);

  Future<ApiResult<void>> call(RegisterRequest request) =>
      _authRepository.register(request);
}
