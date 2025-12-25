import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/repositories/splash/splash_repository.dart';

@injectable
class GetUserDataUseCase {
  final SplashRepository _splashRepository;

  const GetUserDataUseCase(this._splashRepository);

  Future<Result<void>> invoke() async {
    return await _splashRepository.getUserData();
  }
}
