import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/repositories/forget_password/forget_password_repository.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepository _forgetPasswordRepository;

  const ForgetPasswordUseCase(this._forgetPasswordRepository);

  Future<Result<void>> invoke({required String email}) async {
    return await _forgetPasswordRepository.sendPasswordResetMessage(
      email: email,
    );
  }
}
