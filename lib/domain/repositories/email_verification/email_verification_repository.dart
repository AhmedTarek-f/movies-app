import 'package:movies_app/api/client/api_result.dart';

abstract interface class EmailVerificationRepository {
  Future<Result<void>> sendEmailVerification();
}
