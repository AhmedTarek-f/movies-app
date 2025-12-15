import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/email_verification/remote_data_source/email_verification_remote_data_source.dart';
import 'package:movies_app/domain/repositories/email_verification/email_verification_repository.dart';

@Injectable(as: EmailVerificationRepository)
class EmailVerificationRepositoryImpl implements EmailVerificationRepository {
  final EmailVerificationRemoteDataSource _emailVerificationRemoteDataSource;
  const EmailVerificationRepositoryImpl(
    this._emailVerificationRemoteDataSource,
  );

  @override
  Future<Result<void>> sendEmailVerification() async {
    return await _emailVerificationRemoteDataSource.sendEmailVerification();
  }
}
