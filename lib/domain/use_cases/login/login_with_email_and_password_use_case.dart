import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity/login_request_entity.dart';
import 'package:movies_app/domain/repositories/login/login_repository.dart';

@injectable
class LoginWithEmailAndPasswordUseCase {
  final LoginRepository _loginRepository;

  const LoginWithEmailAndPasswordUseCase(this._loginRepository);

  Future<Result<void>> invoke({required LoginRequestEntity request}) async {
    return await _loginRepository.loginWithEmailAndPassword(request: request);
  }
}
