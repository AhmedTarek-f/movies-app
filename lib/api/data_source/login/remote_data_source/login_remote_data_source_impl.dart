import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      return Failure(
        responseException: FirebaseExceptions.firebaseAuth(
          error,
        ).responseException,
      );
    } on FirebaseException catch (error) {
      return Failure(
        responseException: FirebaseExceptions.firebaseExceptions(
          error,
        ).responseException,
      );
    } catch (error) {
      return Failure(
        responseException: ResponseException(
          message: "${AppText.unknownErrorMessage} ${error.toString()}",
        ),
      );
    }
  }

  @override
  Future<Result<UserCredential>> loginWithGoogle() async {
    try {
      final bool connection = await ConnectionManager.checkConnection();
      final auth = FirebaseAuth.instance;
      late final UserCredential userCredential;
      if (connection) {
        late final OAuthCredential credential;
        final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await userAccount?.authentication;

        try {
          credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
        } catch (e) {
          throw AppText.googleLoginCanceled;
        }
        userCredential = await auth.signInWithCredential(credential);
      }
      return Success(userCredential);
    } on FirebaseAuthException catch (error) {
      return Failure(
        responseException: FirebaseExceptions.firebaseAuth(
          error,
        ).responseException,
      );
    } on FirebaseException catch (error) {
      return Failure(
        responseException: FirebaseExceptions.firebaseExceptions(
          error,
        ).responseException,
      );
    } catch (error) {
      if (error == AppText.googleLoginCanceled) {
        return Failure(
          responseException: ResponseException(
            message: AppText.googleLoginCanceled.tr(),
          ),
        );
      }
      return Failure(
        responseException: ResponseException(
          message: "${AppText.unknownErrorMessage} ${error.toString()}",
        ),
      );
    }
  }
}
