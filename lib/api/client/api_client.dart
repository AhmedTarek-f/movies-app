import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/responses/movies/movies_response.dart';
import 'package:movies_app/core/constants/endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Endpoints.allMovies)
  Future<MoviesResponse> getAllMovies({
    @Query("limit") int? limit,
    @Query("page") int? page,
    @Query("sort_by") String? sortBy,
    @Query("query_term") String? searchTerm,
    @Query("genre") String? category,
  });
}
