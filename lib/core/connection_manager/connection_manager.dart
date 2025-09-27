import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/constants/app_text.dart';
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
        late final Result<T> cachedResult;
        late final T cachedData;
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
    } catch (error) {
      return Failure(
        responseException: ResponseException(
          message: "${AppText.unexpectedError} ${error.toString()}",
        ),
      );
    }
  }
}
