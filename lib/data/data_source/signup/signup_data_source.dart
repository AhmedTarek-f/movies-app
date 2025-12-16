import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/entities/requests/signup_request/signup_request_entity.dart';

abstract interface class SignupDataSource {
  Future<Result<void>> signupWithEmailAndPassword({
    required SignupRequestEntity request,
  });
}
