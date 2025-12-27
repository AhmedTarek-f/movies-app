import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/repositories/profile/profile_repository.dart';

@injectable
class LogoutUseCase {
  final ProfileRepository _repository;

  const LogoutUseCase(this._repository);

  Future<Result<void>> invoke() async {
    return await _repository.logout();
  }
}
