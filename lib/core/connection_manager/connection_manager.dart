import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/exceptions/dio_exceptions.dart';
import 'package:movies_app/core/exceptions/firebase_exceptions.dart';
import 'package:movies_app/core/exceptions/response_exception.dart';

abstract class ConnectionManager {
  static Connectivity connectivity = Connectivity();

  static Future<bool> checkConnection() async {
    final List<ConnectivityResult> connectivityResult = await (connectivity
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Result<T>> userConnectionResult<T>({
    required Future<Result<T>> Function() apiDataSource,
    Future<Result<T>> Function()? cachedDataSource,
  }) async {
    try {
      final bool connection = await checkConnection();
      if (connection) {
        final data = await apiDataSource();
        switch (data) {
          case Success<T>():
            return Success(successData: data.successData);
          case Failure<T>():
            return Failure(responseException: data.responseException);
        }
      } else {
        Result<T> cachedResult;
        T? cachedData;
        if (cachedDataSource != null) {
          cachedResult = await cachedDataSource();
          cachedData = (cachedResult as Success<T>).successData;
        }
        return Failure(
          responseException: const ResponseException(
            message: AppText.connectionError,
          ),
          cachedData: cachedData,
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
