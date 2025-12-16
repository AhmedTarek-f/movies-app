import 'package:movies_app/api/client/api_result.dart';

abstract interface class ForgetPasswordDataSource {
  Future<Result<void>> sendPasswordResetMessage({required String email});
}
