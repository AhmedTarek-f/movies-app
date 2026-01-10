import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/exceptions/dio_exceptions.dart';
import 'package:movies_app/core/exceptions/firebase_exceptions.dart';
import 'package:movies_app/core/exceptions/response_exception.dart';

@lazySingleton
final class ApiExecutor {
  final ConnectionManager _connectionManager;

  const ApiExecutor(this._connectionManager);

  Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
    try {
      final bool connection = await _connectionManager.checkConnection();
      if (connection) {
        final data = await apiCall();
        return Success(successData: data);
      } else {
        return Failure(
          responseException: ResponseException(
            message: AppText.connectionError.tr(),
          ),
        );
      }
    } on DioException catch (error) {
      return Failure(
        responseException: DioExceptions.handleError(error).responseException,
      );
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
    } on GoogleSignInException catch (error) {
      if (error.code == GoogleSignInExceptionCode.canceled) {
        return Failure(
          responseException: ResponseException(
            message: AppText.googleLoginCanceled.tr(),
          ),
        );
      }
      return Failure(
        responseException: ResponseException(message: error.description ?? ""),
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
          message: "${AppText.unknownErrorMessage.tr()} ${error.toString()}",
        ),
      );
    }
  }
}
