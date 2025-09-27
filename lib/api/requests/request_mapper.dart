import 'package:movies_app/api/requests/login_request/login_request_model.dart';
import 'package:movies_app/api/requests/signup_request/signup_request_model.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity/login_request_entity.dart';
import 'package:movies_app/domain/entities/requests/signup_request/signup_request_entity.dart';

abstract class RequestMapper {
  static LoginRequestModel toLoginModelRequest({
    required LoginRequestEntity request,
  }) {
    return LoginRequestModel(email: request.email, password: request.password);
  }

  static SignupRequestModel toSignupModelRequest({
    required SignupRequestEntity request,
  }) {
    return SignupRequestModel(
      userId: request.userId ?? "",
      fullName: request.fullName,
      email: request.email,
      password: request.password,
      phoneNumber: request.phoneNumber,
      selectedImage: request.selectedImage,
    );
  }
}
