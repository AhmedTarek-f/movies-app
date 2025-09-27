import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/entities/requests/signup_request/signup_request_entity.dart';
import 'package:movies_app/domain/repositories/signup/signup_repository.dart';

@injectable
final class SignupUseCase {
  final SignupRepository _signupRepository;
  const SignupUseCase(this._signupRepository);
  Future<Result<void>> invoke({required SignupRequestEntity request}) async {
    return await _signupRepository.signupWithEmailAndPassword(request: request);
  }
}
