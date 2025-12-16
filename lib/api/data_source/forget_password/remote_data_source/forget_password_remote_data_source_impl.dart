import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/data/data_source/forget_password/forget_password_data_source.dart';

@Injectable(as: ForgetPasswordDataSource)
final class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordDataSource {
  final FirebaseAuth _auth;

  const ForgetPasswordRemoteDataSourceImpl(this._auth);

  @override
  Future<Result<void>> sendPasswordResetMessage({required String email}) async {
    return await ConnectionManager.userConnectionResult(
      apiDataSource: () async {
        await _auth.sendPasswordResetEmail(email: email);
        return Success(successData: null);
      },
    );
  }
}
