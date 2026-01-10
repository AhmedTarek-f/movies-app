import 'package:injectable/injectable.dart';
import 'package:movies_app/core/local_storage/object_box_storage.dart';
import 'package:movies_app/data/data_source/home/local_data_source/home_local_data_source.dart';
import 'package:movies_app/domain/entities/movie/movie_entity.dart';
import 'package:movies_app/objectbox.g.dart';

@LazySingleton(as: HomeLocalDataSource)
final class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final ObjectBoxStorage _localStorage;

  const HomeLocalDataSourceImpl(this._localStorage);

  @override
  List<MovieEntity> getAllCachedMovies() {
    // final int limitVal = limit ?? 10;
    // final int pageVal = page ?? 0;
    // final int startIndex = pageVal * limitVal;

    final moviesBox = _localStorage.getBox<MovieEntity>();
    final allCachedMovies = moviesBox.getAll();

    // if (startIndex >= allCachedMovies.length) {
    //   return <MovieEntity>[];
    // }
    //
    // int endIndex = startIndex + limitVal;
    // if (endIndex > allCachedMovies.length) {
    //   endIndex = allCachedMovies.length;
    // }

    return allCachedMovies;
  }

  @override
  void saveMovies({required List<MovieEntity> movies}) {
    final moviesBox = _localStorage.getBox<MovieEntity>();
    for (var movie in movies) {
      final query = moviesBox
          .query(MovieEntity_.movieId.equals(movie.movieId ?? -1))
          .build();
      final existing = query.findFirst();
      query.close();
      if (existing != null) {
        movie.id = existing.id;
      }
    }
    moviesBox.putMany(movies);
  }
}
