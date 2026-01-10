import 'package:injectable/injectable.dart';
import 'package:movies_app/core/local_storage/object_box_storage.dart';
import 'package:movies_app/data/data_source/login/local_data_source/login_local_data_source.dart';
import 'package:movies_app/domain/entities/user_data/user_data_entity.dart';

@Injectable(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final ObjectBoxStorage _localStorage;

  const LoginLocalDataSourceImpl(this._localStorage);

  @override
  UserDataEntity? getUserData() {
    final userData = _localStorage.getBox<UserDataEntity>();
    return userData.getAll().first;
  }

  @override
  void removeUserData() {
    final userData = _localStorage.getBox<UserDataEntity>();
    userData.removeAll();
  }

  @override
  void saveUserData({required UserDataEntity user}) {
    final userData = _localStorage.getBox<UserDataEntity>();
    userData.put(user);
  }
}
