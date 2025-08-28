import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/login/remote_data_source/login_remote_data_source.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity.dart';
import 'package:movies_app/domain/repositories/login/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;
  const LoginRepositoryImpl(this._loginRemoteDataSource);
  @override
  Future<Result<void>> loginWithEmailAndPassword({
    required LoginRequestEntity request,
  }) async {
    return await _loginRemoteDataSource.loginWithEmailAndPassword(
      request: request,
    );
  }
}
