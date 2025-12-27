import 'package:movies_app/api/client/api_result.dart';

abstract interface class ProfileRepository {
  Future<Result<void>> logout();
}
