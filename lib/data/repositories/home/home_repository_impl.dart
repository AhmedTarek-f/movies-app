import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/data/data_source/home/local_data_source/home_local_data_source.dart';
import 'package:movies_app/data/data_source/home/remote_data_source/home_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie/movie_entity.dart';
import 'package:movies_app/domain/repositories/home/home_repository.dart';

@Injectable(as: HomeRepository)
final class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;
  final ConnectionManager _connectionManager;

  const HomeRepositoryImpl(
    this._homeRemoteDataSource,
    this._homeLocalDataSource,
    this._connectionManager,
  );

  @override
  Future<Result<List<MovieEntity>>> getAllMovies({
    int? limit,
    int? page,
    String? sortBy,
  }) async {
    final isConnected = await _connectionManager.checkConnection();
    if (isConnected) {
      final result = await _homeRemoteDataSource.getAllMovies(
        limit: limit,
        page: page,
        sortBy: sortBy,
      );
      if (result is Success<List<MovieEntity>>) {
        _homeLocalDataSource.saveMovies(movies: result.successData);
      }
      return result;
    } else {
      return Success(successData: _homeLocalDataSource.getAllCachedMovies());
    }
  }

  @override
  List<MovieEntity> getCachedMovies() {
    return _homeLocalDataSource.getAllCachedMovies();
  }
}
