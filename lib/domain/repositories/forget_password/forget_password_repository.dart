import 'package:movies_app/api/client/api_result.dart';

abstract interface class ForgetPasswordRepository {
  Future<Result<void>> sendPasswordResetMessage({required String email});
}
