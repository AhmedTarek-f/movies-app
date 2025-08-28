import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/api/client/request_mapper.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/exceptions/firebase_exceptions.dart';
import 'package:movies_app/core/exceptions/response_exception.dart';
import 'package:movies_app/data/data_source/login/remote_data_source/login_remote_data_source.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<Result<void>> loginWithEmailAndPassword({
    required LoginRequestEntity request,
  }) async {
    try {
      final bool connection = await ConnectionManager.checkConnection();
      if (connection) {
        final loginRequest = RequestMapper.toLoginRequest(request: request);
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginRequest.email,
          password: loginRequest.password,
        );
        return Success<void>(null);
      } else {
        return Failure(
          responseException: const ResponseException(
            message: AppText.connectionError,
          ),
        );
      }
    } on FirebaseAuthException catch (error) {
      return FirebaseExceptions.firebaseAuth(error);
    } on FirebaseException catch (error) {
      return FirebaseExceptions.firebaseExceptions(error);
    } catch (error) {
      return Failure(
        responseException: ResponseException(
          message: "${AppText.unknownErrorMessage} ${error.toString()}",
        ),
      );
    }
  }
}
