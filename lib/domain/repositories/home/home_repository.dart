import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/entities/movie/movie_entity.dart';

abstract interface class HomeRepository {
  Future<Result<List<MovieEntity>>> getAllMovies({
    int? limit,
    int? page,
    String? sortBy,
  });

  List<MovieEntity> getCachedMovies();
}
