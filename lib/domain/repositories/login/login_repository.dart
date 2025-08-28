import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity.dart';

abstract class LoginRepository {
  Future<Result<void>> loginWithEmailAndPassword({
    required LoginRequestEntity request,
  });
}
