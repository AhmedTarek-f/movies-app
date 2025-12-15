import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/data/data_source/email_verification/remote_data_source/email_verification_remote_data_source.dart';

@Injectable(as: EmailVerificationRemoteDataSource)
final class EmailVerificationRemoteDataSourceImpl
    implements EmailVerificationRemoteDataSource {
  @override
  Future<Result<void>> sendEmailVerification() async {
    return await ConnectionManager.userConnectionResult(
      apiDataSource: () async => await executeApi(() async {
        final auth = FirebaseAuth.instance;
        await auth.currentUser?.sendEmailVerification();
      }),
    );
  }
}
