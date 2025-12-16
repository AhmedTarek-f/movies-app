import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/login/login_data_source.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity/login_request_entity.dart';
import 'package:movies_app/domain/repositories/login/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;

  const LoginRepositoryImpl(this._loginDataSource);

  @override
  Future<Result<void>> loginWithEmailAndPassword({
    required LoginRequestEntity request,
  }) async {
    return await _loginDataSource.loginWithEmailAndPassword(request: request);
  }

  @override
  Future<Result<void>> loginWithGoogle() async {
    return await _loginDataSource.loginWithGoogle();
  }
}
