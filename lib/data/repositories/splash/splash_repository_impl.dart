import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/login/local_data_source/login_local_data_source.dart';
import 'package:movies_app/data/data_source/splash/splash_data_source.dart';
import 'package:movies_app/domain/repositories/splash/splash_repository.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@Injectable(as: SplashRepository)
final class SplashRepositoryImpl implements SplashRepository {
  final SplashDataSource _splashDataSource;
  final LoginLocalDataSource _loginLocalDataSource;

  const SplashRepositoryImpl(
    this._splashDataSource,
    this._loginLocalDataSource,
  );

  @override
  Future<Result<void>> getUserData() async {
    final result = await _splashDataSource.getUserData();
    if (result is Failure<void>) {
      MoviesMethodHelper.userData = _loginLocalDataSource.getUserData();
    } else {
      _loginLocalDataSource.removeUserData();
      _loginLocalDataSource.saveUserData(user: MoviesMethodHelper.userData!);
    }
    return result;
  }
}
