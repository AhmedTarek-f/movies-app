import 'package:movies_app/api/client/api_result.dart';

abstract interface class SplashDataSource {
  Future<Result<void>> getUserData();
}
