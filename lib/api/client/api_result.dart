import 'package:dio/dio.dart';
import 'package:movies_app/core/exceptions/dio_exceptions.dart';
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
  }
}
