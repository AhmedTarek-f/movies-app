import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_client.dart';
import 'package:movies_app/api/client/api_executor.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/data/data_source/home/remote_data_source/home_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie/movie_entity.dart';

@Injectable(as: HomeRemoteDataSource)
final class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;
  final ApiExecutor _apiExecutor;

  const HomeRemoteDataSourceImpl(this._apiClient, this._apiExecutor);

  @override
  Future<Result<List<MovieEntity>>> getAllMovies({
    int? limit,
    int? page,
    String? sortBy,
  }) async {
    return await _apiExecutor.executeApi(() async {
      final response = await _apiClient.getAllMovies(
        limit: limit ?? 20,
        page: page ?? 1,
        sortBy: sortBy ?? 'date_added',
      );
      final movies =
          response.data?.movies?.map((e) => e.toEntity()).toList() ?? [];
      return movies;
    });
  }
}
