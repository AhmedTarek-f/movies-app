import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/signup/signup_data_source.dart';
import 'package:movies_app/domain/entities/requests/signup_request/signup_request_entity.dart';
import 'package:movies_app/domain/repositories/signup/signup_repository.dart';

@Injectable(as: SignupRepository)
class SignupRepositoryImpl implements SignupRepository {
  final SignupDataSource _signupDataSource;

  const SignupRepositoryImpl(this._signupDataSource);

  @override
  Future<Result<void>> signupWithEmailAndPassword({
    required SignupRequestEntity request,
  }) async {
    return await _signupDataSource.signupWithEmailAndPassword(request: request);
  }
}
