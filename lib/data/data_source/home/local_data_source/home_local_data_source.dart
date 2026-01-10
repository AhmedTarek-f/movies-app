import 'package:movies_app/domain/entities/movie/movie_entity.dart';

abstract interface class HomeLocalDataSource {
  List<MovieEntity> getAllCachedMovies();

  void saveMovies({required List<MovieEntity> movies});
}
