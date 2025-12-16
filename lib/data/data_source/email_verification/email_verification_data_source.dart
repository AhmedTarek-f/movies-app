import 'package:movies_app/api/client/api_result.dart';

abstract interface class EmailVerificationDataSource {
  Future<Result<void>> sendEmailVerification();
}
