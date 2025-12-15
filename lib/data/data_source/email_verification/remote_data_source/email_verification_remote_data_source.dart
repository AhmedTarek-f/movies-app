import 'package:movies_app/api/client/api_result.dart';

abstract interface class EmailVerificationRemoteDataSource {
  Future<Result<void>> sendEmailVerification();
}
