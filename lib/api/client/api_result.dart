import 'package:movies_app/core/exceptions/response_exception.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T successData;

  Success({required this.successData});
}

class Failure<T> extends Result<T> {
  Failure({required this.responseException});

  final ResponseException responseException;
}
