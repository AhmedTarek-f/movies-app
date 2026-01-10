import 'package:movies_app/domain/entities/user_data/user_data_entity.dart';

abstract interface class LoginLocalDataSource {
  void saveUserData({required UserDataEntity user});

  void removeUserData();

  UserDataEntity? getUserData();
}
