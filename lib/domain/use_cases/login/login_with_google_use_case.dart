import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/repositories/login/login_repository.dart';

@injectable
class LoginWithGoogleUseCase {
  final LoginRepository _loginRepository;
  const LoginWithGoogleUseCase(this._loginRepository);

  Future<Result<void>> invoke() async {
    return await _loginRepository.loginWithGoogle();
  }
}
