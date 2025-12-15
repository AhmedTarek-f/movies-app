import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/repositories/email_verification/email_verification_repository.dart';

@injectable
final class SendEmailVerificationUseCase {
  final EmailVerificationRepository _emailVerificationRepository;
  const SendEmailVerificationUseCase(this._emailVerificationRepository);
  Future<Result<void>> invoke() async {
    return await _emailVerificationRepository.sendEmailVerification();
  }
}
