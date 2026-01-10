import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/login/local_data_source/login_local_data_source.dart';
import 'package:movies_app/data/data_source/login/remote_data_source/login_remote_data_source.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity/login_request_entity.dart';
import 'package:movies_app/domain/repositories/login/login_repository.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@Injectable(as: LoginRepository)
final class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;
  final LoginLocalDataSource _loginLocalDataSource;

  const LoginRepositoryImpl(
    this._loginRemoteDataSource,
    this._loginLocalDataSource,
  );

  @override
  Future<Result<void>> loginWithEmailAndPassword({
    required LoginRequestEntity request,
  }) async {
    final result = await _loginRemoteDataSource.loginWithEmailAndPassword(
      request: request,
    );
    if (result is Success<void>) {
      _loginLocalDataSource.saveUserData(user: MoviesMethodHelper.userData!);
    }
    return result;
  }

  @override
  Future<Result<void>> loginWithGoogle() async {
    final result = await _loginRemoteDataSource.loginWithGoogle();
    if (result is Success<void>) {
      _loginLocalDataSource.saveUserData(user: MoviesMethodHelper.userData!);
    }
    return result;
  }
}
