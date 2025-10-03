import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/exceptions/dio_exceptions.dart';
import 'package:movies_app/core/exceptions/firebase_exceptions.dart';
import 'package:movies_app/core/exceptions/response_exception.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T successData;

  Success({required this.successData});
}

class Failure<T> extends Result<T> {
  Failure({required this.responseException, this.cachedData});
  final ResponseException responseException;
  final T? cachedData;
}

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    final data = await apiCall();
    return Success(successData: data);
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
