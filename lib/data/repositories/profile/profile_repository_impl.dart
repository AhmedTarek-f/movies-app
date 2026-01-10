import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/login/local_data_source/login_local_data_source.dart';
import 'package:movies_app/data/data_source/profile/profile_data_source.dart';
import 'package:movies_app/domain/repositories/profile/profile_repository.dart';

@Injectable(as: ProfileRepository)
final class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSource;
  final LoginLocalDataSource _loginLocalDataSource;

  const ProfileRepositoryImpl(this._dataSource, this._loginLocalDataSource);

  @override
  Future<Result<void>> logout() async {
    final result = await _dataSource.logout();
    if (result is Success<void>) {
      _loginLocalDataSource.removeUserData();
    }
    return result;
  }
}
