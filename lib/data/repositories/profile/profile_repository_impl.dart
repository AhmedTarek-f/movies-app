import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/profile/profile_data_source.dart';
import 'package:movies_app/domain/repositories/profile/profile_repository.dart';

@Injectable(as: ProfileRepository)
final class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSource;

  const ProfileRepositoryImpl(this._dataSource);

  @override
  Future<Result<void>> logout() async {
    return await _dataSource.logout();
  }
}
