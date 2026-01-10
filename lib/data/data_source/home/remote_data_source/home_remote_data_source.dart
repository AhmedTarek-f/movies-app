import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/entities/movie/movie_entity.dart';

abstract interface class HomeRemoteDataSource {
  Future<Result<List<MovieEntity>>> getAllMovies({
    int? limit,
    int? page,
    String? sortBy,
  });
}
