import 'package:movies_app/api/requests/login_request/login_request.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity.dart';

abstract class RequestMapper {
  static LoginRequest toLoginRequest({required LoginRequestEntity request}) {
    return LoginRequest(email: request.email, password: request.password);
  }
}
