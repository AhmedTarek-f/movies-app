import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/forget_password/forget_password_data_source.dart';
import 'package:movies_app/domain/repositories/forget_password/forget_password_repository.dart';

@Injectable(as: ForgetPasswordRepository)
final class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordDataSource _forgetPasswordDataSource;

  const ForgetPasswordRepositoryImpl(this._forgetPasswordDataSource);

  @override
  Future<Result<void>> sendPasswordResetMessage({required String email}) async {
    return await _forgetPasswordDataSource.sendPasswordResetMessage(
      email: email,
    );
  }
}
