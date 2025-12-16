import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/data/data_source/email_verification/email_verification_data_source.dart';

@Injectable(as: EmailVerificationDataSource)
final class EmailVerificationRemoteDataSourceImpl
    implements EmailVerificationDataSource {
  final FirebaseAuth _auth;

  const EmailVerificationRemoteDataSourceImpl(this._auth);

  @override
  Future<Result<void>> sendEmailVerification() async {
    return await ConnectionManager.userConnectionResult(
      apiDataSource: () async {
        await _auth.currentUser?.sendEmailVerification();
        return Success(successData: null);
      },
    );
  }
}
