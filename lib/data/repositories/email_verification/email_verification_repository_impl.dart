import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/email_verification/email_verification_data_source.dart';
import 'package:movies_app/domain/repositories/email_verification/email_verification_repository.dart';

@Injectable(as: EmailVerificationRepository)
final class EmailVerificationRepositoryImpl
    implements EmailVerificationRepository {
  final EmailVerificationDataSource _emailVerificationDataSource;

  const EmailVerificationRepositoryImpl(this._emailVerificationDataSource);

  @override
  Future<Result<void>> sendEmailVerification() async {
    return await _emailVerificationDataSource.sendEmailVerification();
  }
}
