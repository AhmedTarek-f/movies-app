import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/domain/entities/user_data/user_data_entity.dart';

abstract class MoviesMethodHelper {
  static UserDataEntity? userData;

  static final List<String> avatars = const [
    AppImages.avatar1,
    AppImages.avatar2,
    AppImages.avatar3,
    AppImages.avatar4,
    AppImages.avatar5,
    AppImages.avatar6,
    AppImages.avatar7,
    AppImages.avatar8,
    AppImages.avatar9,
  ];
}
