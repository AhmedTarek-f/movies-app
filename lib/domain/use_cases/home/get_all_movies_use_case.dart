import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/domain/entities/movie/movie_entity.dart';
import 'package:movies_app/domain/repositories/home/home_repository.dart';

@injectable
class GetAllMoviesUseCase {
  final HomeRepository _homeRepository;

  const GetAllMoviesUseCase(this._homeRepository);

  Future<Result<List<MovieEntity>>> invoke({
    int? limit,
    int? page,
    String? sortBy,
  }) async {
    return await _homeRepository.getAllMovies(
      limit: limit,
      page: page,
      sortBy: sortBy,
    );
  }

  List<MovieEntity> getCachedMovies() {
    return _homeRepository.getCachedMovies();
  }
}
