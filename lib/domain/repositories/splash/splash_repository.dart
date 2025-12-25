import 'package:movies_app/api/client/api_result.dart';

abstract interface class SplashRepository {
  Future<Result<void>> getUserData();
}
