import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity/login_request_entity.dart';

abstract interface class LoginRemoteDataSource {
  Future<Result<void>> loginWithEmailAndPassword({
    required LoginRequestEntity request,
  });
  Future<Result<void>> loginWithGoogle();
}
