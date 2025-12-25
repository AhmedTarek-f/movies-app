import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/splash/splash_data_source.dart';
import 'package:movies_app/domain/repositories/splash/splash_repository.dart';

@Injectable(as: SplashRepository)
final class SplashRepositoryImpl implements SplashRepository {
  final SplashDataSource _splashDataSource;

  const SplashRepositoryImpl(this._splashDataSource);

  @override
  Future<Result<void>> getUserData() async {
    return await _splashDataSource.getUserData();
  }
}
